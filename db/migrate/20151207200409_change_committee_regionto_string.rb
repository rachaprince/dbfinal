class ChangeCommitteeRegiontoString < ActiveRecord::Migration
  def change
  	change_column :committees, :region, :string
  end
end
