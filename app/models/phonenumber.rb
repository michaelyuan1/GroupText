class Phonenumber < ActiveRecord::Base
  
  belongs_to :user

  attr_accessible :number, :user_id
  
  number_regex = /^(1?(-?\d{3})-?)?(\d{3})(-?\d{4})$/
  
  validates :number, :format     => { :with => number_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :user_id, :presence => true
end
