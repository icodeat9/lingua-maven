class CreateTranslators < ActiveRecord::Migration[7.0]
  def change
    create_table :translators do |t|
      t.boolean :profile_enabled
      t.string :slug
      t.json :bio
      t.belongs_to :user

      t.timestamps
    end
  end
end
