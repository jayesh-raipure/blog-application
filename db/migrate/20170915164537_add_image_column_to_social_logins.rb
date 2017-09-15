class AddImageColumnToSocialLogins < ActiveRecord::Migration
  def change
    add_column :social_logins, :image, :string
  end
end
