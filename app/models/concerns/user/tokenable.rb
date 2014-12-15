class User
  module Tokenable
    def generate_token(column=default_token)
      begin
        token = SecureRandom.urlsafe_base64
      end while self.class.exists?(column => token)
      self[column] = token
    end

    def refresh_token(column=default_token)
      generate_token(column)
      save!
    end

    def default_token; :auth_token end
  end
end