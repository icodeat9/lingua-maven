require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "should not save a user without an email" do
    user = User.new
    user.given_name = "Michael"
    user.family_name = "Bertini"

    assert_not user.save, "Saved the user without email"
  end

  test "should not save with email containing non-ASCII characters" do
    user = User.new
    user.given_name = "Michael"
    user.family_name = "Bertini"
    user.email = 'piña@test.com'

    assert_not user.save, "Saved the user containing non-ASCII characters"
  end

  test "should not save if one of given name is missing when family name is not" do
    user = User.new
    user.given_name = ""
    user.family_name = "Bertini"
    user.email = 'piña@test.com'

    assert_not user.save, "Saved the user with given name missing when family name is not"
  end

  test "should not save if one of family name is missing when given name is not" do
    user = User.new
    user.given_name = "Michael"
    user.family_name = ""
    user.email = 'pina@test.com'

    assert_not user.save, "Saved the user with family name missing when given name is not"
  end

  test "should not save with an invalid preferred time zone" do
    user = User.new
    user.preferred_timezone = "America/Santo_Domingues"
    user.email = 'pina@test.com'

    assert_not user.save, "Saved the user with an invalid preffered time zone"
  end

end
