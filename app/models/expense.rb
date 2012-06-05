class Expense < ActiveRecord::Base
  attr_accessible :effective_date, :value, :description, :accrue, :supplier_id, :account_id, :title
	
	belongs_to :account
	belongs_to :supplier
	
	scope :effective, lambda { |cdate| where("effective_date <= '#{cdate}'") }
	scope :spent, lambda { where("accrue or effective_date < '#{Date.today}'") }
	scope :projected, lambda { where("not accrue and effective_date > '#{Date.today}'" )}
	
	validates_associated :supplier
	validates_presence_of :title
	
	def accrue?
		accrue || effective_date < Date.today
	end
	
end
