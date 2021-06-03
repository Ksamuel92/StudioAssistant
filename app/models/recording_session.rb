class RecordingSession < ActiveRecord::Base
    #model associations
    belongs_to :user
    belongs_to :client
    #model validations
    #check bookmarks for help validating dates
    validates :start_date, :end_date, :per_hour, :hours_per_day, presence: true
    # validate :end_date_after_start_date
    # validates :email, presence: true, uniqueness: true 


    def parse_date(date)
        Date.parse(date)
    end
end
