class RecordingSession < ActiveRecord::Base
    #model associations
    belongs_to :user
    belongs_to :client
    validates :start_date, presence: true
    #model validations
    #check bookmarks for help validating dates
    # validates :start_date, :end_date, presence: true
    # validate :end_date_after_start_date
    # validates :email, presence: true
    # def self.find_by_slug(slug)
    #     self.all.find{|i| i.slug == slug}
    # end

    # def slug
    #     self.user.name.downcase.gsub(" ","-")
    # end
  


    # def self.parse_date(date)
    #     Date.strptime(date, '%m/%d/%Y')
    # end
end
