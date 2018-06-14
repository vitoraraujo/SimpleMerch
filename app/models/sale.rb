class Sale < ApplicationRecord
	belongs_to :user
	belongs_to :good

	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: :true
	validates :good_id, presence: :true
	validates :quantity, presence: true
	validates :sell_price, presence: true
	validates :sell_day, presence: true
	validates :sell_month, presence: true
	validates :sell_year, presence: true
end
