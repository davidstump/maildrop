module Maildrop
  class Authorizer

    def self.fetch_flow
      key = Maildrop.configuration.app_key
      secret = Maildrop.configuration.app_secret
      @flow = DropboxOAuth2FlowNoRedirect.new(key, secret)
    end

    def self.url
      fetch_flow
      @flow.start
    end

    def self.token(code)
      fetch_flow
      @access_token, @user_id = @flow.finish(code)
      @access_token
    end
  end
end
