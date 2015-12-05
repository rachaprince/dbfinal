class FixInternshipTypeColumnName < ActiveRecord::Migration
  def change
  	rename_column :internships, :type, :product
  end
end
