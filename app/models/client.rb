class Client < ActiveRecord::Base
    has_many :recording_sessions
    has_many :users, through: :recording_sessions
    validates :name, :band?, :genre, :has_producer?, :budget, presence: true
    validates :email, presence: true, uniqueness: true #downcase emails
end
