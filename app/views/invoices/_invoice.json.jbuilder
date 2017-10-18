json.extract! invoice, :id, :cost_of_labor, :car_vin, :cust_id, :emp_id, :inv_desc, :prob_desc, :eng_code, :inv_date, :tot_cost, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
