class BankAccount < ActiveRecord::Base
	belongs_to :user
	has_many :sources

	def active?
		self.status == "active" ? true : false
	end

	def minimum_balance?
		self.balance > self.minimum_balance ? true : false
	end
end
