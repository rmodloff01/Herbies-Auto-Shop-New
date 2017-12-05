
Customer.create!([
  {cust_id: 1, cust_fname: "Kari", cust_lname: "Smith", cust_phone: "630-335-2455", cust_addr: "746 Johnny Drive", cust_date: "2017-11-02 00:00:00", state: "IL", city: "Aurora"},
  {cust_id: 2, cust_fname: "John", cust_lname: "Jacob", cust_phone: "362-124-8888", cust_addr: "174 Foxtail Drive", cust_date: "2017-10-30 00:00:00", state: "IL", city: "Naperville"},
  {cust_id: 3, cust_fname: "Dillon", cust_lname: "Odinson", cust_phone: "630-123-4567", cust_addr: "65 Drury Lane", cust_date: "2017-11-03 00:00:00", state: "IL", city: "Plainfield"},
  {cust_id: 4, cust_fname: "Tomas", cust_lname: "Koffer", cust_phone: "630-677-4354", cust_addr: "64353 Prairie Ave", cust_date: "2017-11-28 00:00:00", state: "IL", city: "Oswego"},
  {cust_id: 5, cust_fname: "Crystal", cust_lname: "Jaeger", cust_phone: "630-666-1010", cust_addr: "4508 Alan Deathrage St", cust_date: "2017-12-03 00:00:00", state: "IL", city: "Aurora"}
])
Car.create!([
  {car_vin: "DJFIV864JF", car_model: "RSX", car_make: "Acura", car_year: "2004", cust_id: 1, license_plate: "11111", state: "IL", in_shop: true},
  {car_vin: "12345678910", car_model: "Sonata", car_make: "Hyundai", car_year: "2015", cust_id: 5, license_plate: "170 3RG", state: "IL", in_shop: true},
  {car_vin: "FGV4598C48C", car_model: "Accord", car_make: "Honda", car_year: "1999", cust_id: 2, license_plate: "3DD3F", state: "IL", in_shop: false},
  {car_vin: "894C3943NV", car_model: "Gallardo", car_make: "Lamborghini", car_year: "2008", cust_id: 3, license_plate: "3RFG40", state: "IL", in_shop: false},
  {car_vin: "45NH9N3R4T", car_model: "Chiron", car_make: "Bugatti", car_year: "2017", cust_id: 1, license_plate: "2FAST4U", state: "IL", in_shop: false},
  {car_vin: "SDF464VRW6969", car_model: "F12berlinetta", car_make: "Ferrari", car_year: "2017", cust_id: 2, license_plate: "H1Q0RA", state: "IL", in_shop: true}
])
Employee.create!([
  {emp_id: "1", emp_fname: "Jay", emp_lname: "Doe", emp_wage: "23.00"},
  {emp_id: "2", emp_fname: "Khal", emp_lname: "Drogo", emp_wage: "44.00"},
  {emp_id: "3", emp_fname: "Lindsey", emp_lname: "Cukachoo", emp_wage: "13.00"},
  {emp_id: "4", emp_fname: "Herc", emp_lname: "Ules", emp_wage: "22.00"},
  {emp_id: "5", emp_fname: "John", emp_lname: "Watson", emp_wage: "18.00"}
])
Invoice.create!([
  {inv_id: 1, cost_of_labor: "50.00", cust_id: 2, emp_id: "2", inv_desc: "Put in new spark plug", prob_desc: "Engine misfiring", eng_code: "N/A", inv_date: "2017-11-28", tot_cost: nil, license_plate: "H1Q0RA"},
  {inv_id: 2, cost_of_labor: "225.00", cust_id: 3, emp_id: "4", inv_desc: "Replaced Brakes", prob_desc: "Grinding noise when braking", eng_code: "N/A", inv_date: "2017-11-29", tot_cost: nil, license_plate: "3RFG40"},
  {inv_id: 3, cost_of_labor: "60.00", cust_id: 1, emp_id: "1", inv_desc: "Replaced hose", prob_desc: "Leaky hose", eng_code: "N/A", inv_date: "2017-11-27", tot_cost: nil, license_plate: "11111"},
  {inv_id: 4, cost_of_labor: "40.00", cust_id: 5, emp_id: "5", inv_desc: "Put in new air filter after oil change", prob_desc: "None", eng_code: "N/A", inv_date: "2017-11-29", tot_cost: nil, license_plate: "170 3RG"},
  {inv_id: 5, cost_of_labor: "537.00", cust_id: 2, emp_id: "2", inv_desc: "Replaced exhaust pipe", prob_desc: "Massive hole in exhaust pipe", eng_code: "N/A", inv_date: "2017-12-03", tot_cost: nil, license_plate: "H1Q0RA"}
])
Supplier.create!([
  {supp_id: 1, supp_name: "Auto Parts Galore", supp_address: "111 Auto Lane", supp_phone: "630-535-1119", supp_email: "supplies@autopartsgalore.com"},
  {supp_id: 2, supp_name: "Auto Heaven", supp_address: "52 Brakher Ave", supp_phone: "708-453-5683", supp_email: "order@autoheaven.com"},
  {supp_id: 3, supp_name: "O'Malley Auto Parts", supp_address: "532 Washington Lane", supp_phone: "342-563-5432", supp_email: "parts@omalleyautoparts.com"},
  {supp_id: 4, supp_name: "AutoParts Zone", supp_address: "453 S. Route 59", supp_phone: "212-642-7890", supp_email: "supply@autopartszone.com"},
  {supp_id: 5, supp_name: "Waterpebble Complete Auto Care", supp_address: "9482 127th Street", supp_phone: "630-513-5992", supp_email: "lol@waterpebble.com"}
])
Part.create!([
  {part_id: 1, part_name: "spark plug", part_cost: "15.99", part_num_in_inventory: 10, supp_id: 1},
  {part_id: 2, part_name: "brake pads", part_cost: "95.99", part_num_in_inventory: 10, supp_id: 2},
  {part_id: 3, part_name: "air filter", part_cost: "5.99", part_num_in_inventory: 10, supp_id: 1},
  {part_id: 4, part_name: "generic hose", part_cost: "222.00", part_num_in_inventory: 9, supp_id: 4},
  {part_id: 5, part_name: "exhaust pipe", part_cost: "575.00", part_num_in_inventory: 10, supp_id: 3}
])
IncludedPart.create!([
  {part_id: 1, inv_id: 1},
  {part_id: 5, inv_id: 5},
  {part_id: 2, inv_id: 2},
  {part_id: 3, inv_id: 4},
  {part_id: 4, inv_id: 3}
])
