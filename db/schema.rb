# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_24_082322) do

  create_table "bank_accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id", null: false
    t.string "bank_account_type", null: false
    t.string "bank", null: false
    t.float "balance", default: 0.0, null: false
    t.float "minimum_balance", default: 0.0, null: false
    t.datetime "active_since", null: false
    t.string "status", default: "inactive", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_on_user_id"
  end

  create_table "budget_buckets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "budget_id", null: false
    t.string "bucket_type", null: false
    t.float "amount", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["budget_id"], name: "index_on_budget_id"
  end

  create_table "budget_expense_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "budget_expense_id", null: false
    t.string "status", default: "inactive", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "amount", default: 0.0, null: false
    t.index ["budget_expense_id"], name: "index_on_budget_expense_id"
  end

  create_table "budget_expense_transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "budget_expense_category_id", null: false
    t.float "amount", default: 0.0, null: false
    t.datetime "transaction_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "budget_bucket_id", null: false
    t.string "status", default: "inactive", null: false
    t.index ["budget_bucket_id"], name: "index_on_budget_bucket_id"
    t.index ["budget_expense_category_id"], name: "index_on_budget_expense_category_id"
  end

  create_table "budget_expenses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "budget_id", null: false
    t.float "planned_allotment_amount", default: 0.0, null: false
    t.float "final_allotment_amount", default: 0.0, null: false
    t.float "spent_amount", default: 0.0, null: false
    t.float "balance", default: 0.0, null: false
    t.string "status", default: "inactive", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["budget_id"], name: "index_on_budget_id"
  end

  create_table "budget_incomes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "budget_id", null: false
    t.integer "budget_bucket_id", null: false
    t.float "planned_amount", default: 0.0, null: false
    t.float "final_amount", default: 0.0, null: false
    t.string "status", default: "inactive", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["budget_bucket_id"], name: "index_on_budget_bucket_id"
    t.index ["budget_id"], name: "index_on_budget_id"
  end

  create_table "budgets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.float "planned_income", default: 0.0, null: false
    t.float "actual_income", default: 0.0, null: false
    t.float "planned_expense", default: 0.0, null: false
    t.float "actual_expense", default: 0.0, null: false
    t.string "status", default: "inactive", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_on_user_id"
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "card_type", null: false
    t.string "card_subtype"
    t.string "bank", null: false
    t.integer "user_id", null: false
    t.integer "first_four_number", default: 9999, null: false
    t.integer "last_four_number", default: 9999, null: false
    t.integer "limit", default: 0, null: false
    t.integer "exp_date", default: 1299, null: false
    t.datetime "next_renew_date", default: "2099-12-31 00:00:00", null: false
    t.float "joining_fees", default: 0.0, null: false
    t.float "renew_fees", default: 0.0, null: false
    t.float "renew_fees_waiver", default: 0.0, null: false
    t.float "ytd_usage", default: 0.0, null: false
    t.integer "statement_date", default: 1, null: false
    t.integer "payment_date", default: 1, null: false
    t.string "status", default: "inactive", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_on_user_id"
  end

  create_table "other_incomes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id", null: false
    t.float "amount", default: 0.0, null: false
    t.string "status", default: "inactive", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_on_user_id"
  end

  create_table "sources", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "bank_account_id", null: false
    t.string "purpose", null: false
    t.float "balance", default: 0.0, null: false
    t.string "status", default: "inactive", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bank_account_id"], name: "index_on_bank_account_id"
  end

  create_table "statements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "card_id", null: false
    t.string "statement_month_year", null: false
    t.datetime "statement_generation_date", null: false
    t.datetime "statement_due_date", null: false
    t.string "payment_date"
    t.float "previous_balance", default: 0.0, null: false
    t.float "current_expense", default: 0.0, null: false
    t.float "total_due", default: 0.0, null: false
    t.float "minimum_due", default: 0.0, null: false
    t.float "credit_limit", default: 0.0, null: false
    t.float "available_credit_limit", default: 0.0, null: false
    t.float "total_payment_done", default: 0.0, null: false
    t.string "payment_status", default: "not_paid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_on_card_id"
  end

  create_table "transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.float "amount", default: 0.0, null: false
    t.datetime "date", null: false
    t.string "transaction_type", null: false
    t.string "status", default: "inactive", null: false
    t.integer "budget_id"
    t.integer "budget_bucket_id"
    t.integer "budget_expense_id"
    t.integer "budget_expense_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "source_type"
    t.bigint "source_id"
    t.index ["budget_bucket_id"], name: "index_budget_bucket_id"
    t.index ["budget_expense_category_id"], name: "index_on_budget_expense_category_id"
    t.index ["budget_expense_id"], name: "index_on_budget_expense_id"
    t.index ["budget_id"], name: "index_on_budget_id"
    t.index ["source_type", "source_id"], name: "index_transactions_on_source_type_and_source_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "display_name", null: false
    t.string "uid", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "access_key", null: false
    t.string "password", null: false
    t.string "status", default: "inactive", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_key"], name: "index_on_access_key", unique: true
    t.index ["email"], name: "index_on_email", unique: true
    t.index ["phone"], name: "index_on_phone", unique: true
    t.index ["uid"], name: "index_on_uid", unique: true
  end

end
