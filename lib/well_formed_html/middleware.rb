require 'well_formed_html/log'

module WellFormedHtml
  class Middleware
    @@logger  = WellFormedHtml::Log.new

    def initialize(app, options={})
      @@repair_html = options[:repair_html] if options.keys.include?(:repair_html)
      @app = app
    end

    def call(env)
      @doc = nil
      response = @app.call(env)
      if response[2].is_a?(ActionDispatch::Response) &&
          response[2].content_type == 'text/html'
        @doc = Nokogiri::HTML(response[2].body){|config|
          config.options = Nokogiri::XML::ParseOptions::PEDANTIC
        }
        unless @doc.errors.empty?
          @doc.errors.each{|error|
            @@logger.error("#{env['REQUEST_URI']} : #{error.message}")
          }
        else
          @@logger.info("#{env['REQUEST_URI']} - no errors")
        end
      end
      if @@repair_html && @doc
        response[2].body = @doc.to_s
        @@logger.info("#{env['REQUEST_URI']} - repaired")
      end
      return response
    end
  end
end
