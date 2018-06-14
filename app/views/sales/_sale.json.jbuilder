json.extract! sale, :id, :user_id, :good_id, :quantity, :sell_price, :sold_to, :sell_day, :sell_month, :sell_year, :created_at, :updated_at
json.url sale_url(sale, format: :json)
