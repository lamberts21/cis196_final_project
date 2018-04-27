class CreateRecipeComments < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_comments do |t|
      t.text :field
      t.references :recipe, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
