json.extract! supplier, :id, :supp_name, :supp_address, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
