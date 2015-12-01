class CreateHomeRatings < ActiveRecord::Migration
  def change
    create_table :home_ratings do |t|
      t.references :participant, index: true, foreign_key: true
      t.references :committee, index: true, foreign_key: true
      t.integer :rating
      t.text :explanation
      t.integer :prep_rating
      t.text :prep_explanation
      t.integer :prior_difficulties, array: true

      t.timestamps null: false
    end
  end
end
