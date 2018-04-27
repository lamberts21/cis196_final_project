ActiveRecord::Schema.define(version: 20180426221652) do
  create_table 'comments', force: :cascade do |t|
    t.text 'field'
    t.integer 'workout_id'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_comments_on_user_id'
    t.index ['workout_id'], name: 'index_comments_on_workout_id'
  end

  create_table 'exercises', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.decimal 'time'
    t.integer 'workout_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['workout_id'], name: 'index_exercises_on_workout_id'
  end

  create_table 'favorite_recipes', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'recipe_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['recipe_id'], name: 'index_favorite_recipes_on_recipe_id'
    t.index ['user_id'], name: 'index_favorite_recipes_on_user_id'
  end

  create_table 'favorite_workouts', force: :cascade do |t|
    t.integer 'workout_id'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_favorite_workouts_on_user_id'
    t.index ['workout_id'], name: 'index_favorite_workouts_on_workout_id'
  end

  create_table 'ingredients', force: :cascade do |t|
    t.string 'name'
    t.string 'amount'
    t.integer 'recipe_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['recipe_id'], name: 'index_ingredients_on_recipe_id'
  end

  create_table 'recipe_comments', force: :cascade do |t|
    t.text 'field'
    t.integer 'recipe_id'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['recipe_id'], name: 'index_recipe_comments_on_recipe_id'
    t.index ['user_id'], name: 'index_recipe_comments_on_user_id'
  end

  create_table 'recipes', force: :cascade do |t|
    t.string 'name'
    t.text 'instructions'
    t.boolean 'comments_state'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_recipes_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'username'
    t.string 'password_hash'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'workouts', force: :cascade do |t|
    t.string 'name'
    t.boolean 'comments_state'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_workouts_on_user_id'
  end
end
