class User < ActiveRecord::Base
    has_many :recording_sessions
    has_and_belongs_to_many :clients
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true #downcase emails
    has_secure_password

end
