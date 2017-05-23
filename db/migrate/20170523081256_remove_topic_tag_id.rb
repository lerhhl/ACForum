class RemoveTopicTagId < ActiveRecord::Migration[5.1]
  def change
    remove_column :topics, :tag_id
  end
end
