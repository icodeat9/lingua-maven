class Translator < ApplicationRecord
  belongs_to :user, optional: true
  validates :profile_enabled, acceptance: true, if: -> { slug.present? }
  validates :slug, presence: true, if: -> { profile_enabled }

  validate :bio_should_be_a_valid_json

  private
  def bio_should_be_a_valid_json
    return unless bio.present?
    begin
      ActiveSupport::JSON.decode(bio)
    rescue JSON::ParserError, TypeError => exception
      errors.add(:bio, "should be a valid JSON")
    end
  end
end
