class Good < ApplicationRecord
	belongs_to :user

	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :description, presence: true
	validates :quantity, presence: true
	validates :buy_price, presence: true
	validates :sell_price, presence: true, :allow_nil => true
	validates :buy_day, presence: true
	validates :buy_month, presence: true
	validates :buy_year, presence: true
	validates :note, length: { maximum: 255 }
end
