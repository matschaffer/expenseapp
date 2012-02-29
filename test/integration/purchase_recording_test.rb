require 'test_helper'

class PurchaseRecordingTest < ActionDispatch::IntegrationTest
  javascript

  setup do
    @mat = User.create(email: 'mat@schaffer.me',
                       password: 'test1234',
                       password_confirmation: 'test1234')
    visit new_user_session_path
    fill_in 'Email', with: 'mat@schaffer.me'
    fill_in 'Password', with: 'test1234'
    click_button 'Sign in'
  end

  test "a new purchase" do
    visit purchases_path
    click_link "New Purchase"
    fill_in "Description", with: "Spam"
    click_button "Create Purchase"

    error_message = "Amount can't be blank"
    assert page.has_content?(error_message)
  end
end
