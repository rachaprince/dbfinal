class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :name
      t.integer :region
      t.string :country

      t.timestamps null: false
    end
  end
end
