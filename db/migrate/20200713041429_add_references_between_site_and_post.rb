class AddReferencesBetweenSiteAndPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :site_id, :integer
    add_index :posts, :site_id
  end
end
