class User < ActiveRecord::Base
    has_many :recording_sessions
    has_many :clients, through: :recording_sessions
    # has_many :returning_clients, through: :clients_users, class_name: "Client"
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true #downcase emails
    has_secure_password

end
