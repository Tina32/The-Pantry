class RemoveCompletedFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :completed, :string
  end
end
