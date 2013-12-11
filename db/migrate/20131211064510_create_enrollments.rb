class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :number
      t.datetime :date
      t.references :pupil
      t.references :group

      t.timestamps
    end
  end
end
