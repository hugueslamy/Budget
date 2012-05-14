class AddProjectDate < ActiveRecord::Migration
  def up
		add_column :projects, :start_date, :date
		add_column :projects, :end_date, :date
  end

  def down
		remove_column :projects, start_date
		remove_column :projects, end_date
  end
end
