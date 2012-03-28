require 'test_helper'

class InlinePurchasesTest < ActionDispatch::IntegrationTest
  javascript

  test "enter a purchase" do
    login
    visit root_path
    click_link "New Purchase"
    fill_in "Description", with: "Spam"
    fill_in "Amount", with: "4.50"
    click_button "Create Purchase"
    assert page.has_content? "Spam"
  end
end
