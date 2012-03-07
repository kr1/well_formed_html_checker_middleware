require 'well_formed_html/log'

module WellFormedHtml
  class Middleware
    @@logger  = WellFormedHtml::Log.new

    def initialize(app, options={})
      @app      = app
    end

    def call(env)
      response = @app.call(env)
      if Rails.env.development? &&
          response[2].is_a?(ActionDispatch::Response) &&
          response[2].content_type == 'text/html'
        body = response[2].body
        doc = Nokogiri::HTML(body){|config|
          config.options = Nokogiri::XML::ParseOptions::PEDANTIC
        }
        unless doc.errors.empty?
          doc.errors.each{|error|
            @@logger.error("#{env['REQUEST_URI']} : #{error.message}")
          }
        else
          @@logger.info("#{env['REQUEST_URI']} - no errors")
        end
      end
      return response
    end
  end
end
