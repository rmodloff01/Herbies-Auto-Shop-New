# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "cars", primary_key: "car_vin", id: :string, limit: 15, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "car_model", limit: 10, null: false
    t.string "car_make", limit: 20, null: false
    t.string "car_year", limit: 4, null: false
    t.string "cust_id", limit: 8, null: false
    t.string "license_plate", limit: 7, null: false
    t.index ["cust_id"], name: "cust_id_idx"
  end

  create_table "customers", primary_key: "cust_id", id: :string, limit: 8, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "cust_fname", limit: 15, null: false
    t.string "cust_lname", limit: 15, null: false
    t.string "cust_phone", limit: 13, null: false
    t.string "cust_addr", limit: 30, null: false
    t.date "cust_date", null: false
  end

  create_table "employees", primary_key: "emp_id", id: :string, limit: 15, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "emp_fname", limit: 20, null: false
    t.string "emp_lname", limit: 20, null: false
    t.string "emp_wage", limit: 8, null: false
  end

  create_table "included_parts", primary_key: ["part_id", "inv_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "part_id", limit: 20, null: false
    t.integer "inv_id", null: false
    t.index ["inv_id"], name: "inv_id_idx"
  end

  create_table "invoices", primary_key: "inv_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "cost_of_labor", precision: 2
    t.string "car_vin", limit: 15, null: false
    t.string "cust_id", limit: 8, null: false
    t.string "emp_id", limit: 15, null: false
    t.string "inv_desc"
    t.string "prob_desc", null: false
    t.string "eng_code", limit: 45
    t.date "inv_date", null: false
    t.decimal "tot_cost", precision: 2
    t.index ["car_vin"], name: "car_vin_idx"
    t.index ["cust_id"], name: "cust_id_idx"
    t.index ["emp_id"], name: "emp_id_idx"
  end

  create_table "parts", primary_key: ["part_id", "supp_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "part_id", limit: 20, null: false
    t.string "part_name", limit: 20, null: false
    t.string "part_cost", limit: 20, null: false
    t.string "part_num_in_inventory", limit: 15
    t.integer "supp_id", null: false
    t.index ["supp_id"], name: "supp_id_idx"
  end

  create_table "suppliers", primary_key: "supp_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "supp_name", limit: 45, null: false
    t.string "supp_address", limit: 45, null: false
  end

  add_foreign_key "cars", "customers", column: "cust_id", primary_key: "cust_id", name: "cust_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "included_parts", "invoices", column: "inv_id", primary_key: "inv_id", name: "inv_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "included_parts", "parts", primary_key: "part_id", name: "part_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invoices", "cars", column: "car_vin", primary_key: "car_vin", name: "car", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invoices", "customers", column: "cust_id", primary_key: "cust_id", name: "cust", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invoices", "employees", column: "emp_id", primary_key: "emp_id", name: "emp", on_update: :cascade, on_delete: :cascade
  add_foreign_key "parts", "suppliers", column: "supp_id", primary_key: "supp_id", name: "supp_id", on_update: :cascade, on_delete: :cascade
end
