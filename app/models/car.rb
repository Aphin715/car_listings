class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates_presence_of :color
  validates_numericality_of :mileage, :greater_than_or_equal_to => 0
  validates_numericality_of :year, :greater_than_or_equal_to => 1980 ,
  :less_than_or_equal_to => 2014
end
