module Maildrop
  class MailInterceptor
    def self.delivering_email(message)
      Maildrop.client.store!(message)
    end
  end
end
