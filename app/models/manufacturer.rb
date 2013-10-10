class Manufacturer < ActiveRecord::Base

  has_many :cars, :dependent => :destroy
  validates_presence_of :name
  validates_presence_of :country
end
