class AddExpenseTitle < ActiveRecord::Migration
  def up	
		add_column :expenses, :title, :string
  end

  def down
		remove_column :expenses, :title
  end
end