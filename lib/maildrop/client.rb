module Maildrop
  class Client

    def initialize(options={})
      token = Maildrop::Authorizer.token(Maildrop.configuration.code)
      @client = DropboxClient.new(token)
    end

    def store!(subject, body)
      now = Time.now.strftime("%Y-%m-%d")
      file = "#{now}/#{underscoreize(message.subject)}.html"
      @client.put_file(file, message.body.to_s)

      # message.attachments.each do |name, attachment|
      #   attachment_path = "#{now}/#{name}"
      #   @client.put_file(attachment_path, attachment.to_s)
      # end
    end

    def underscoreize(string)
      string.downcase.gsub(" ", "_")
    end
  end
end
