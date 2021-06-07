class Client < ActiveRecord::Base
  has_many :recording_sessions
  has_and_belongs_to_many :users
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true


    def self.find_by_slug(slug)
        self.all.find{|i| i.slug == slug}
    end

    def slug
        self.name.downcase.gsub(" ","-")
    end

    # def slug_to_name(slug)
    # slug.gsub("-", " ").capitalize
    # end
  



end
