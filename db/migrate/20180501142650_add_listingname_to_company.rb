class AddListingnameToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :listingname, :string
  end
end
