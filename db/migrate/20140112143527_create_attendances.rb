class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :user, :event

      t.timestamps
    end
    add_index :attendances, [:user_id, :event_id]
  end
end
