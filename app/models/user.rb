class User < ApplicationRecord
  validates :given_name, presence: true, if: -> { family_name.present? }
  validates :family_name, presence: true, if: -> { given_name.present? }
  validates :email, presence: true

  validate :email_should_be_ascii
  validate :preferred_timezone_should_be_a_valid_timezone


  def full_name
    given_name + " " + family_name
  end

  private

  def email_should_be_ascii
    return unless email.present?

    unless email.ascii_only?
      errors.add(:email, "can't include non-ASCII characters.")
    end
  end

  def preferred_timezone_should_be_a_valid_timezone
    return unless preferred_timezone.present?
    begin
      TZInfo::Timezone.get(preferred_timezone)
    rescue TZInfo::InvalidTimezoneIdentifier => exception
      errors.add(:bio, "should be a valid Time Zone")
    end
  end
end
