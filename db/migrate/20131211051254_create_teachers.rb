class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|

      t.timestamps
    end

    create_table :groups_teachers, id: false do |t|
      t.references :group, :teacher
    end

    add_index :groups_teachers, [:group_id, :teacher_id]
  end
end
