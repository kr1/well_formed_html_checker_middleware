Wellformed Html Checker Middleware
----------------------------------

What is it?
===========

a rack middleware that informs you on the well-formedness of your app's responses.
It is a rails 3 middleware that uses nokogiri to parse the body of the apps html
response and checks if it is well-formed.
The default behaviour is to log errors and warnings to a seperate log-file.
This should help you in repairing the templates that produce the html response.
This middleware is running by default only in development.

Deploying
=========

 * install the gem.

 * configure your app to use the middleware, e.g.:
    put this in your config/initalizers/middlewares.rb

    ```ruby
    if Rails.env.development?
      config.middleware.use WellFormedHtml::Middleware
    end

 * The log will be written to the log-directory

