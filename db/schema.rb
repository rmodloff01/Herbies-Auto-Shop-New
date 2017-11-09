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

  create_table "cars", primary_key: "car_vin", id: :string, limit: 17, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "car_model", limit: 10, null: false
    t.string "car_make", limit: 20, null: false
    t.string "car_year", limit: 4, null: false
    t.integer "cust_id", null: false
    t.string "license_plate", limit: 9, null: false
  end

  create_table "customers", primary_key: "cust_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "cust_fname", limit: 15, null: false
    t.string "cust_lname", limit: 15, null: false
    t.string "cust_phone", limit: 13, null: false
    t.string "cust_addr", limit: 30, null: false
    t.datetime "cust_date", null: false
  end

  create_table "employees", primary_key: "emp_id", id: :string, limit: 6, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "emp_fname", limit: 20, null: false
    t.string "emp_lname", limit: 20, null: false
    t.decimal "emp_wage", precision: 4, scale: 2, null: false
  end

  create_table "included_parts", primary_key: ["part_id", "inv_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "part_id", null: false
    t.integer "inv_id", null: false
  end

  create_table "invoices", primary_key: "inv_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "cost_of_labor", precision: 6, scale: 2
    t.string "car_vin", limit: 17, null: false
    t.integer "cust_id", null: false
    t.string "emp_id", limit: 6, null: false
    t.string "inv_desc"
    t.string "prob_desc", null: false
    t.string "eng_code", limit: 45
    t.date "inv_date", null: false
    t.decimal "tot_cost", precision: 6, scale: 2
  end

  create_table "parts", primary_key: "part_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "part_name", limit: 20, null: false
    t.decimal "part_cost", precision: 5, scale: 2, null: false
    t.integer "part_num_in_inventory"
    t.integer "supp_id", null: false
  end

  create_table "suppliers", primary_key: "supp_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "supp_name", limit: 45, null: false
    t.string "supp_address", limit: 55, null: false
  end

end
