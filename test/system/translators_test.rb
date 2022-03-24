require "application_system_test_case"

class TranslatorsTest < ApplicationSystemTestCase
  setup do
    @translator = translators(:one)
  end

  test "visiting the index" do
    visit translators_url
    assert_selector "h1", text: "Translators"
  end

  test "should create translator" do
    visit translators_url
    click_on "New translator"

    fill_in "Bio", with: @translator.bio
    check "Profile enabled" if @translator.profile_enabled
    fill_in "Slug", with: @translator.slug
    fill_in "User", with: @translator.user_id
    click_on "Create Translator"

    assert_text "Translator was successfully created"
    click_on "Back"
  end

  test "should update Translator" do
    visit translator_url(@translator)
    click_on "Edit this translator", match: :first

    fill_in "Bio", with: @translator.bio
    check "Profile enabled" if @translator.profile_enabled
    fill_in "Slug", with: @translator.slug
    fill_in "User", with: @translator.user_id
    click_on "Update Translator"

    assert_text "Translator was successfully updated"
    click_on "Back"
  end

  test "should destroy Translator" do
    visit translator_url(@translator)
    click_on "Destroy this translator", match: :first

    assert_text "Translator was successfully destroyed"
  end
end
