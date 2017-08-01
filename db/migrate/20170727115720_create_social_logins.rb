class CreateSocialLogins < ActiveRecord::Migration
  def change
    create_table :social_logins do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
