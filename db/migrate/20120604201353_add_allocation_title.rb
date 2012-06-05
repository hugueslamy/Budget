class AddAllocationTitle < ActiveRecord::Migration
  def up
		add_column :allocations, :title, :string
  end

  def down
		remove_column :allocations, :title
  end
end