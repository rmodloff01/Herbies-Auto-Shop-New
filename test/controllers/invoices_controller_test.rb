require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_url
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: { car_vin: @invoice.car_vin, cost_of_labor: @invoice.cost_of_labor, cust_id: @invoice.cust_id, emp_id: @invoice.emp_id, eng_code: @invoice.eng_code, inv_date: @invoice.inv_date, inv_desc: @invoice.inv_desc, prob_desc: @invoice.prob_desc, tot_cost: @invoice.tot_cost } }
    end

    assert_redirected_to invoice_url(Invoice.last)
  end

  test "should show invoice" do
    get invoice_url(@invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_url(@invoice)
    assert_response :success
  end

  test "should update invoice" do
    patch invoice_url(@invoice), params: { invoice: { car_vin: @invoice.car_vin, cost_of_labor: @invoice.cost_of_labor, cust_id: @invoice.cust_id, emp_id: @invoice.emp_id, eng_code: @invoice.eng_code, inv_date: @invoice.inv_date, inv_desc: @invoice.inv_desc, prob_desc: @invoice.prob_desc, tot_cost: @invoice.tot_cost } }
    assert_redirected_to invoice_url(@invoice)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete invoice_url(@invoice)
    end

    assert_redirected_to invoices_url
  end
end
