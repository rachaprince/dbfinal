class CreateInternshipCommittees < ActiveRecord::Migration
  def change
    create_table :internship_committees do |t|
      t.references :internship, index: true, foreign_key: true
      t.references :home_c, index: true, foreign_key: true
      t.references :away_c, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
