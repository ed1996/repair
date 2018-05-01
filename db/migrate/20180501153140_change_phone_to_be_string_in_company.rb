class ChangePhoneToBeStringInCompany < ActiveRecord::Migration
  def change
    change_column :companies, :phone, :string
    change_column :companies, :siret, :string
  end
end
