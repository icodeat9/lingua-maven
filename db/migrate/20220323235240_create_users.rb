class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :given_name
      t.string :family_name
      t.string :email
      t.string :preferred_timezone

      t.timestamps
    end
  end
end
