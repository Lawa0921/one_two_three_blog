class AddOwnerColumnForSite < ActiveRecord::Migration[6.0]
  def change
    add_column :sites, :owner, :string
  end
end
