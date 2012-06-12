class Account < ActiveRecord::Base
  attr_accessible :name, :project_id
  
  belongs_to :project
  has_many :allocations
	has_many :expenses
	
	validates_associated :project
	validates_presence_of :project
end
