class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :user_id
      t.integer :good_id
      t.integer :quantity
      t.float :sell_price
      t.string :sold_to
      t.integer :sell_day
      t.integer :sell_month
      t.integer :sell_year

      t.timestamps
    end
  end
end
