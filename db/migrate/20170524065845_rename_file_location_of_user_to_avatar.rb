class RenameFileLocationOfUserToAvatar < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :file_location, :avatar
  end
end
