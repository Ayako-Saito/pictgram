class RenameUserIdColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :user, :user_id
  end
end
