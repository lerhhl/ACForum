class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.integer :votes, default: 0
      t.integer :status
      t.references :tag, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
