Wellformed Html Checker Middleware
----------------------------------

What is it?
===========

A rack middleware that informs you on the well-formedness of your app's html
responses.

It is a rails 3 middleware that uses nokogiri to parse the html produced by
your app and checks if it is well-formed.
The default behaviour is to log errors and warnings to a separate log-file.
This should help you in repairing the templates that produce the html response.
You should use this middleware only in development.

You can configure it to repair the html, which can be useful in case you want to
check if a specific bug is due to malformed html.

Deploying
=========

 * install the gem.

 * configure your app to use the middleware, e.g.:
    put this in your config/initalizers/middlewares.rb

    ```ruby
    if Rails.env.development?
      config.middleware.use WellFormedHtml::Middleware
    end
    ```

    if you want your html to be repaired, configure the middleware like this:
    ```ruby
    if Rails.env.development?
      config.middleware.use WellFormedHtml::Middleware, {
          :repair_html => true
      }
    end
    ```

 * The logs will be written to the log-directory

 * we strongly *discourage* using this middleware in production as parsing
   the complete body takes time and resources

