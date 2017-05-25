class AddColumnToTopics < ActiveRecord::Migration[5.1]
  def change
        add_column :topics, :view_counts, :integer
  end
end
