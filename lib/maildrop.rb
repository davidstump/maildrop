require "dropbox_sdk"
require "maildrop/version"
require "maildrop/configuration"
require "maildrop/authorizer"
require "maildrop/client"
require "maildrop/railtie" if defined?(Rails)

module Maildrop
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield self.configuration if block_given?
    end

    def client(options={})
      @client = Maildrop::Client.new(options)
    end
  end
end
