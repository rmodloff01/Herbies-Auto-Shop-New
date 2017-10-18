json.extract! employee, :id, :emp_fname, :emp_lname, :emp_wage, :created_at, :updated_at
json.url employee_url(employee, format: :json)
