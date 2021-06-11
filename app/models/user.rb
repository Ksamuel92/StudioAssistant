class User < ActiveRecord::Base
  has_many :recording_sessions
  has_many :clients, through: :recording_sessions
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password

  def self.find_by_slug(slug)
    self.all.find { |i| i.slug == slug }
  end

  def slug
    self.name.downcase.gsub(' ', '-')
  end

  def slug_to_name(slug)
    self.slug.gsub('-', ' ').capitalize
  end


end
