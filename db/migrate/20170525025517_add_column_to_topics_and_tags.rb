class AddColumnToTopicsAndTags < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :comment_date, :datetime
    add_column :tags, :topics_count, :integer, default: 0
  end
end
