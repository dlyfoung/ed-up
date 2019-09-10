class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false},
            format: {with: /\w+@\w+.\w/ }
end
