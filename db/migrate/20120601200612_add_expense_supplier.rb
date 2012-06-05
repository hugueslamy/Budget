class AddExpenseSupplier < ActiveRecord::Migration
  def up
		add_column :expenses, :supplier_id, :integer
  end

  def down
		remove_column :expenses, :supplier_id
  end
end
