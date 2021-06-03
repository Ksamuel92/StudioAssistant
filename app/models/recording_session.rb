class RecordingSession < ActiveRecord::Base
    #model associations
    belongs_to :user
    belongs_to :client
    #model validations
    #check bookmarks for help validating dates
    validates :start_date, :end_date, presence: true
    # validate :end_date_after_start_date
    # validates :email, presence: true, uniqueness: true 


    # def self.parse_date(date)
    #     Date.strptime(date, '%m/%d/%Y')
    # end
end
