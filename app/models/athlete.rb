class Athlete < ActiveRecord::Base
  attr_accessible :code, :country, :event, :fname, :gender, :height, :sname, :sport, :weight
  
  has_many :stars
end