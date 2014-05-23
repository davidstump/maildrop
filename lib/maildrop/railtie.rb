require 'maildrop'
require 'rails'
require 'launchy'

module Maildrop
  class MaildropRailtie < Rails::Railtie
    rake_tasks do
      namespace :maildrop do
        desc 'get dropbox access token'
        task :authorize do
          key = Maildrop.configuration.app_key
          secret = Maildrop.configuration.app_secret
          authorize_url = Maildrop::Authorizer.url(key, secret)
          Launchy.open(authorize_url)
        end
      end
    end
  end
end
