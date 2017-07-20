class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :emailid, null: false
      t.string :password, null: false

      t.timestamps null: false
    end
  end
end
