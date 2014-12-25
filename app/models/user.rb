class User < ActiveRecord::Base
has_many :posts
has_many :comments
validates :name, presence: true
validates :email, presence: true
validates :email, uniqueness: true
has_secure_password

end
