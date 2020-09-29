class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :length
      t.datetime :date

      t.timestamps
    end
  end
end
