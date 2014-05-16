module Maildrop
  class Authorizer

    def self.fetch_flow
      key = 'wntza3mos2lwywp'
      secret = 'b0hfxi37k082ed1'
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
