class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :task
      t.boolean :complete
      t.date :created_on
      t.date :finished_on
      t.integer :user_id

      t.timestamps
    end
  end
end
