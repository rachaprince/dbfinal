class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.integer :type
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :key_learning
      t.integer :overall_rating
      t.text :overall_expl
      t.integer :internship_rating
      t.text :internship_expl
      t.references :participant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
