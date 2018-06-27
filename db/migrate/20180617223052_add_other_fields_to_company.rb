class AddOtherFieldsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :linksocialf, :string
  end
end
