class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :value
			t.string	:description
			t.boolean :accrue
      t.date :effective_date
			t.integer :account_id

      t.timestamps
    end
  end
end
