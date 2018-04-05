class CreateFavoriteWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_workouts do |t|
      t.references :workout, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
