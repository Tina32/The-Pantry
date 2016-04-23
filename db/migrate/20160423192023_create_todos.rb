class CreateAddRecipe < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
