require 'test_helper'

class HouseholdAssignmentTest < ActionDispatch::IntegrationTest
  setup do
    login
    click_link "Make a Household"
    fill_in "Address", with: "123 ParkLine Drive"
    click_button "Create Household"
  end

  test "shows recent purchases after assigning a household" do
    assert page.has_content? "Recent purchases"
  end

  def click_invite_link
    mail = ActionMailer::Base.deliveries.last
    visit Nokogiri(mail.body.to_s).search('a').first['href']
  end

  test "inviting another user to your household" do
    visit purchases_path
    click_link "New Purchase"
    fill_in "Description", with: "Spam"
    fill_in "Amount", with: "3.50"
    click_button "Create Purchase"

    click_link "Invite someone to your household"
    fill_in "Email", with: "kaori@schaffer.me"
    click_button "Send invite"

    logout

    click_invite_link
    click_link "Sign up"
    fill_in "Email", with: "kaori@schaffer.me"
    fill_in "Password", with: "test1234"
    fill_in "Password confirmation", with: "test1234"
    click_button "Sign up"

    within('.sidebar') do
      assert page.has_content?("Spam")
    end
  end
end
