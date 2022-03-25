class Translator < ApplicationRecord
  belongs_to :user
  validates :profile_enabled, acceptance: true, if: -> { slug.present? }
  validates :slug, presence: true, if: -> { profile_enabled }

  validate :bio_should_be_a_valid_json
  validate :slug_should_be_ascii

  private
  def bio_should_be_a_valid_json
    return unless bio.present?

    begin
      ActiveSupport::JSON.decode(bio)
    rescue JSON::ParserError, TypeError => exception
      errors.add(:bio, "should be a valid JSON")
    end
  end

  def slug_should_be_ascii
    return unless slug.present?

    unless slug.ascii_only?
      errors.add(:slug, "can't include non-ASCII characters.")
    end
  end
end
