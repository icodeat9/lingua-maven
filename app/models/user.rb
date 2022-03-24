class User < ApplicationRecord
  validates :given_name, presence: true, if: -> { family_name.present? }
  validates :family_name, presence: true, if: -> { given_name.present? }
  validates :email, presence: true
  validate :email_should_be_ascii

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
end
