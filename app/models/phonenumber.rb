class Phonenumber < ActiveRecord::Base
  
  belongs_to :numbergroup
  attr_accessible :number, :numbergroup_id
  
  number_regex = /^(1?(-?\d{3})-?)?(\d{3})(-?\d{4})$/
  
  validates :number, :format     => { :with => number_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :numbergroup_id, :presence => true
end
