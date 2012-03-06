require 'well_formed_html/log'

module WellFormedHtml
  class Middleware
    @@logger  = WellFormedHtml::Log.new

    def initialize(app, options={})
      @app      = app
    end

    def call(env)
      response  = @app.call env
      if @env == 'development'
        response  = @app.call env
        body = response[2]
        doc = Nokogiri::XML(body)
        unless doc.errors.empty?
          doc.errors.each{|error|
            @@logger.error("#{env['REQUEST_URI']} : #{error.message}")
          }
        else
          @@logger.error("#{env['REQUEST_URI']} - no errors")
        end
      end
      return response
    end
  end
end
