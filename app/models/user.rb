class User < ActiveRecord::Base
  validates :email, uniqueness: { uniqueness: true, message: ''}
end
