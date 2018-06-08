class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.string :kind
      t.float :cost
      t.string :reason
      t.integer :day
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
