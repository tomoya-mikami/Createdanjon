class Item < ActiveRecord::Base
  validates_presence_of :url,:titls
  validates_format_of :url,:with=>/\Ahttps*.*/
  validates_numericality_of :raiting, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5
end
