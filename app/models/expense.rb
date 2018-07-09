class Expense < ApplicationRecord
	belongs_to :user
	
	default_scope -> { order(created_at: :desc) }
	validates :cost, presence: true
	validates :user_id, presence: true
	validates :day, presence: true, :inclusion => { :in => 1..31, :message => "Digite o dia entre 1-31" }
	validates :month, presence: true, :inclusion => { :in => 1..12, :message => "Digite o mês entre 1-12" }
	validates :year, presence: true, :inclusion => {:in => 2017..2019, :message => "Esse ano não é valido"}

end