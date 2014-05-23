module Maildrop
  class Authorizer

    def self.fetch_flow(key, secret)
      @flow = DropboxOAuth2FlowNoRedirect.new(key, secret)
    end

    def self.url(key, secret)
      fetch_flow(key, secret)
      @flow.start
    end

    def self.token(code, key, secret)
      fetch_flow(key, secret)
      @access_token, @user_id = @flow.finish(code)
      @access_token
    end
  end
end
