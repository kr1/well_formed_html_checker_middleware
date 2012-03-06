require 'rubygems'
require 'well_formed_html/log'

module WellFormedHtml
  class << self
    # Memoizes the current environment
    def env
      @env ||= ENV['RAILS_ENV'] || ARGV[0] || 'development'
    end
  end
end
