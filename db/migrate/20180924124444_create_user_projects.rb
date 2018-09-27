class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :projects_users do |t|
      t.references :user
      t.references :project
    end
  end
end
