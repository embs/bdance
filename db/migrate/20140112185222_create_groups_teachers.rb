class CreateGroupsTeachers < ActiveRecord::Migration
  def change
    create_table :groups_teachers do |t|
      t.references :group, :teacher
    end
    add_index :groups_teachers, [:group_id, :teacher_id]
  end
end
