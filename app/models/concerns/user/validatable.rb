class User
  module Validatable
    extend ActiveSupport::Concern
    included do
      TEXT_MAX_LEN = 70
      validates :username, :email, presence:true, length:{maximum:TEXT_MAX_LEN}
      validates :email, uniqueness: true,
                format:{with:/\A[\w\.%\-\+]+@([\w\-]+\.)+(\w{2,})\z/}
      validates :password, presence:true,
                length:{minimum:6, maximum:TEXT_MAX_LEN}, on: :create
    end
  end
end