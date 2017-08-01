class ChangeColumnNameInComments < ActiveRecord::Migration
  def change
  	rename_column :comments, :user_id, :commentable_id
  	rename_column :comments, :user_type, :commentable_type
  end
end
