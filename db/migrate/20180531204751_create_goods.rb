class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :description
      t.integer :quantity
      t.integer :user_id
      t.float :buy_price
      t.string :buyed_from
      t.integer :buy_day
      t.integer :buy_month
      t.integer :buy_year
      t.string :kind
      t.string :note

      t.timestamps
    end
    add_index :goods, [:user_id, :created_at]  
  end
end
