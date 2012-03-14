require 'test_helper'

class HouseholdAssignmentTest < ActionDispatch::IntegrationTest
  test "assigning your own household" do
    login
    click_link "Make a Household"
    fill_in "Address", with: "123 ParkLine Drive"
    click_button "Create Household"
    assert page.has_content? "Recent purchases"
  end
end
