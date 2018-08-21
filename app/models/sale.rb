class Sale < ApplicationRecord
	belongs_to :user
	belongs_to :good

	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: :true
	validates :good_id, presence: :true
	validates :quantity, presence: true
	validates :sell_price, presence: true
	validates :sell_day, presence: true, :inclusion => { :in => 1..31, :message => "Digite o dia entre 1-31" }
	validates :sell_month, presence: true, :inclusion => { :in => 1..12, :message => "Digite o mês entre 1-12" }
	validates :sell_year, allow_nil: true, :inclusion => {:in => 2017..2019, :message => "Esse ano não é valido"}
end
