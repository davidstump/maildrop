require 'maildrop'
require 'rails'
require 'launchy'

module Maildrop
  class MaildropRailtie < Rails::Railtie
    rake_tasks do
      namespace :maildrop do
        desc 'get dropbox access token'
        task :authorize do
          authorize_url = Maildrop::Authorizer.url
          Launchy.open(authorize_url)
        end
      end
    end
  end
end
