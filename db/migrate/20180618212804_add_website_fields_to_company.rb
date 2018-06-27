class AddWebsiteFieldsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :linkweb, :string
  end
end
