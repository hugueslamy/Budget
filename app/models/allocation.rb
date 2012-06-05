class Allocation < ActiveRecord::Base
  attr_accessible :account_id, :effective_date, :note, :value, :title
  
  belongs_to :account
	
	validates_presence_of :title
	
	scope :effective, lambda { |cdate| where("effective_date <= '#{cdate}'") }
end
