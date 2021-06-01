class User < ActiveRecord::Base
    has_many :recording_sessions
    has_many :clients through: :recording_sessions
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true #downcase emails
    has_secure_password

end
