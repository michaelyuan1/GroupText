class Phonenumber < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessible :number, :user_id
  
  number_regex = /^(2|3|4|5|6|7|8|9)\d{9}$/
  
  validates :number, :format     => { :with => number_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :user_id, :presence => true
  #validates_associated :user
  validate :numbers_count
  
  def numbers_count
      if User.find(user_id).phonenumbers.count > 2
         errors.add(:You, "have too many numbers") 
         return true
      else
        return true
      end
    end
    
end
