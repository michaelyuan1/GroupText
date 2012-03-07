class Numbergroup < ActiveRecord::Base
  attr_accessible :name, :user_id
  
  belongs_to :user
  
  validates :user_id, :presence => true
  
  has_many :phonenumbers

end
