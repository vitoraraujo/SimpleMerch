class Good < ApplicationRecord
	before_validation :comma_to_dot

	belongs_to :user
	has_many :sales, dependent: :destroy

	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :description, presence: true, uniqueness: { case_sensitive: false}, uniqueness: false
	validates :quantity, presence: true
	validates :buy_price, presence: true
	validates :buy_day, presence: true, :inclusion => { :in => 1..31, :message => "Digite o dia entre 1-31" }
	validates :buy_month, presence: true, :inclusion => { :in => 1..12, :message => "Digite o mês entre 1-12" }
	validates :buy_year, allow_nil: true, :inclusion => {:in => 1919..2019, :message => "Esse ano não é valido"}

	validates :note, length: { maximum: 255 }

	def comma_to_dot
    	self.buy_price = self.buy_price.to_s.gsub(/,/,'.').to_f
    end

end
