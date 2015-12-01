class CreateAwayRatings < ActiveRecord::Migration
  def change
    create_table :away_ratings do |t|
      t.references :internship, index: true, foreign_key: true
      t.references :committee, index: true, foreign_key: true
      t.integer :visa
      t.integer :rating
      t.text :explanation
      t.integer :experience_difficulties, array: true

      t.timestamps null: false
    end
  end
end
