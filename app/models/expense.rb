class Expense < ApplicationRecord
	belongs_to :user
	
	default_scope -> { order(created_at: :desc) }
	validates :cost, presence: true
	validates :user_id, presence: true
	validates :day, presence: true
	validates :month, presence: true
	validates :year, presence: true
end
