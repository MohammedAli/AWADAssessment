class Star < ActiveRecord::Base
  attr_accessible :athlete_id, :user_id

  validates_uniqueness_of :athlete_id, :scope => :user_id

  belongs_to :athlete
  belongs_to :user
end