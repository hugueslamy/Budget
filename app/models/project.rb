class Project < ActiveRecord::Base
  attr_accessible :name, :start_date, :end_date
  
  has_many :accounts
	has_many :expenses, :through => :accounts
	has_many :allocations, :through => :accounts
	
	accepts_nested_attributes_for :accounts
	
	def span
		return 0 if start_date.nil? || end_date.nil?
		return start_date..end_date
	end
end
