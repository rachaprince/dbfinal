class ChangeTypeInInternships < ActiveRecord::Migration
  def change
  	change_column :internships, :type, :string
  end
end
