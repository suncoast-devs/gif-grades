require "application_system_test_case"

class VenerationsTest < ApplicationSystemTestCase
  setup do
    @veneration = venerations(:one)
  end

  test "visiting the index" do
    visit venerations_url
    assert_selector "h1", text: "Venerations"
  end

  test "creating a Veneration" do
    visit venerations_url
    click_on "New Veneration"

    fill_in "Caption", with: @veneration.caption
    fill_in "Score", with: @veneration.score
    fill_in "User", with: @veneration.user_id
    click_on "Create Veneration"

    assert_text "Veneration was successfully created"
    click_on "Back"
  end

  test "updating a Veneration" do
    visit venerations_url
    click_on "Edit", match: :first

    fill_in "Caption", with: @veneration.caption
    fill_in "Score", with: @veneration.score
    fill_in "User", with: @veneration.user_id
    click_on "Update Veneration"

    assert_text "Veneration was successfully updated"
    click_on "Back"
  end

  test "destroying a Veneration" do
    visit venerations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Veneration was successfully destroyed"
  end
end
