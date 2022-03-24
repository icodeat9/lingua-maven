require "test_helper"

class TranslatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @translator = translators(:one)
  end

  test "should get index" do
    get translators_url
    assert_response :success
  end

  test "should get new" do
    get new_translator_url
    assert_response :success
  end

  test "should create translator" do
    assert_difference("Translator.count") do
      post translators_url, params: { translator: { bio: @translator.bio, profile_enabled: @translator.profile_enabled, slug: @translator.slug, user_id: @translator.user_id } }
    end

    assert_redirected_to translator_url(Translator.last)
  end

  test "should show translator" do
    get translator_url(@translator)
    assert_response :success
  end

  test "should get edit" do
    get edit_translator_url(@translator)
    assert_response :success
  end

  test "should update translator" do
    patch translator_url(@translator), params: { translator: { bio: @translator.bio, profile_enabled: @translator.profile_enabled, slug: @translator.slug, user_id: @translator.user_id } }
    assert_redirected_to translator_url(@translator)
  end

  test "should destroy translator" do
    assert_difference("Translator.count", -1) do
      delete translator_url(@translator)
    end

    assert_redirected_to translators_url
  end
end
