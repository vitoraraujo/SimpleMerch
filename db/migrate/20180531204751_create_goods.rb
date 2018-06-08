class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :description
      t.integer :quantity
      t.integer :user_id
      t.float :buy_price
      t.float :sell_price
      t.string :buyed_from
      t.string :sold_to
      t.integer :buy_day
      t.integer :buy_month
      t.integer :buy_year
      t.integer :sell_day
      t.integer :sell_month
      t.integer :sell_year
      t.string :kind
      t.string :note
      t.boolean :sold

      t.timestamps
    end
    add_index :goods, [:user_id, :created_at]  
  end
end
