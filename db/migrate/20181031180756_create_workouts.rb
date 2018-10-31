class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
    	t.string :name
    	t.string :description
    	t.integer :user_id

      t.timestamps null: false #automaticly give us a timestamp as soon we update our model
    end
  end
end
