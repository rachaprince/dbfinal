class AddProvidedDifficultiesToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :provided_difficulties, :integer, array: true
  end
end
