class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, as_relation_superclass: true do |t|
      t.string :rg
      t.string :profession
      t.date :birth
      t.string :cpf
      t.text :phone
      t.string :first_name
      t.string :last_name
      t.string :mail
      t.string :username

      t.timestamps
    end

    create_table :events_users, id: false do |t|
      t.references :event, :user
    end

    add_index :events_users, [:event_id, :user_id]
  end
end
