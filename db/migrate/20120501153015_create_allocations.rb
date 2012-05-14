class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.decimal :value
      t.date :effective_date
      t.text :note
      t.integer :account_id

      t.timestamps
    end
  end
end
