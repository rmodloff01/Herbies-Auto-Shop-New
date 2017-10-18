json.extract! customer, :id, :cust_fname, :cust_lname, :cust_phone, :cust_addr, :cust_date, :created_at, :updated_at
json.url customer_url(customer, format: :json)
