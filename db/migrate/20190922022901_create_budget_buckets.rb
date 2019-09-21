class CreateBudgetBuckets < ActiveRecord::Migration[6.0]
	def change
		create_table :budgetbuckets do |t|
			t.string :name, :null => false
			t.integer :bank_id
			t.integer :card_id
			t.integer :other_income_id
			t.string :bucket_type, :null => false
			t.float :amount, :null => false, :default => 0.0
			t.timestamps
			t.index ["bank_id"], name: "index_on_bank_id"
			t.index ["card_id"], name: "index_on_card_id"
			t.index ["other_income_id"], name: "index_on_other_income_id"
		end
	end
end