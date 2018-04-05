class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.decimal :time
      t.references :workout, foreign_key: true

      t.timestamps
    end
  end
end
