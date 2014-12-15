class User < ActiveRecord::Base

  include Validatable
  has_secure_password

  include Tokenable
  before_create :generate_token
end

