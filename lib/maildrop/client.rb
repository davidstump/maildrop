module Maildrop
  class Client

    def initialize(options={})
      key = Maildrop.configuration.app_key
      secret = Maildrop.configuration.app_secret
      code = Maildrop.configuration.code
      token = find_token
      @client = DropboxClient.new(token)
    end

    def store!(subject, body)
      now = Time.now.strftime("%Y-%m-%d")
      format = Maildrop.configuration.format || 'txt'
      file = "#{now}/#{underscoreize(subject)}.#{format}"
      @client.put_file(file, body.to_s)

      # message.attachments.each do |name, attachment|
      #   attachment_path = "#{now}/#{name}"
      #   @client.put_file(attachment_path, attachment.to_s)
      # end
    end

    def underscoreize(string)
      string.downcase.gsub(" ", "_")
    end

    private

    def find_token
      Maildrop.configuration.token || Maildrop::Authorizer.token(code, key, secret)
    end
  end
end
