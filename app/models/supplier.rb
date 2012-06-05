class Supplier < ActiveRecord::Base
  attr_accessible :name, :project_id
	
	has_many :expenses
end
