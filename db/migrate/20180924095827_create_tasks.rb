class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :name
      t.string :status
      t.date :due_date
      t.string :label

      t.timestamps null: false
    end
  end
end
