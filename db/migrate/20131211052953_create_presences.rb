class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.references :user
      t.datetime :time

      t.timestamps
    end
  end
end
