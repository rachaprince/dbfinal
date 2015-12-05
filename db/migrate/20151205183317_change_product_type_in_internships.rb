class ChangeProductTypeInInternships < ActiveRecord::Migration
  def change
  	change_column :internships, :product, :string
  end
end
