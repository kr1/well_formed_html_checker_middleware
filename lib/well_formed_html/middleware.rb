require 'timeout'
require 'well_formed_html/log'
require 'well_formed_html/railtie' if defined?(Rails)


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
        doc.errors.each{|error|
          @logger.error(error.message)
        }
      end
      return response
    end
  end
end
