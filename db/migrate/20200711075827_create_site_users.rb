class CreateSiteUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :site_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true
    end
  end
end
