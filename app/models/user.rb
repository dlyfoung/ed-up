class User < ApplicationRecord

  validates :login, :password, :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false},
            format: {with: /\w+@\w+.\w/ }

end
