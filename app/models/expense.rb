class Expense < ActiveRecord::Base
  attr_accessible :effective_date, :value, :description, :accrue
	
	belongs_to :account
	
	scope :effective, lambda { |cdate| where("effective_date <= '#{cdate}'") }
	scope :spent, lambda { where("accrue or effective_date < '#{Date.today}'") }
	scope :projected, lambda { where("not accrue and effective_date > '#{Date.today}'" )}
	
	def accrue?
		accrue || effective_date < Date.today
	end
	
end
