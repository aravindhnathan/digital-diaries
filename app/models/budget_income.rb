class BudgetIncome < ActiveRecord::Base
	belongs_to :budget
	belongs_to :budget_bucket
end