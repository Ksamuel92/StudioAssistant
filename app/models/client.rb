class Client < ActiveRecord::Base
    has_many :recording_sessions
    has_many :users, through: :recording_sessions
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true #downcase emails
end
