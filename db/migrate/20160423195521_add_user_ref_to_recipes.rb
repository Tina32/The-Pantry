class AddUserRefToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :user, index: true, foreign_key: true, null: false
  end
end
