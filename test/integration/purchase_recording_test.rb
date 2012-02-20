require 'test_helper'

class PurchaseRecordingTest < ActionDispatch::IntegrationTest
  javascript
  test "a new purchase" do
    visit purchases_path
    click_link "New Purchase"
    fill_in "Description", with: "Spam"
    click_button "Create Purchase"

    error_message = "Amount can't be blank"
    assert page.has_content?(error_message)
  end
end
