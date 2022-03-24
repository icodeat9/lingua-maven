require "test_helper"

class TranslatorTest < ActiveSupport::TestCase
  test "should not save bio is not a valid json" do
    translator = Translator.new
    translator.bio = '{"en": "}'

    assert_not translator.save, "Saved the translator with bio being an invalid json"
  end

  test "should not save with profile enabled true when slug is missing" do
    translator = Translator.new
    translator.profile_enabled = true
    translator.slug = ''

    assert_not translator.save, "Saved the translator with profile enabled true when slug is missing"
  end
end
