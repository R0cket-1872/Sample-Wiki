class User < ActiveRecord::Base
has_many :articles
has_secure_password

validates_presence_of :username, :firstname, :lastname, :email, :password_digest
validates_uniqueness_of :username, :email
validates_format_of :email, :with => /@/



def name
[firstname, lastname].join(' ')
end
end
