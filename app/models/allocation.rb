class Allocation < ActiveRecord::Base
  attr_accessible :account_id, :effective_date, :note, :value
  
  belongs_to :account
	
	scope :effective, lambda { |cdate| where("effective_date <= '#{cdate}'") }
end
