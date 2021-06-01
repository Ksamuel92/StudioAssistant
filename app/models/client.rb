class Client < ActiveRecord::Base
    has_many :recording_sessions
    has_many :users, through: :recording_sessions
end
