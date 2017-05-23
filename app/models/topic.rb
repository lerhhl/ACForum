class Topic < ApplicationRecord
  belongs_to :tag
  belongs_to :user

   validates :title, :body, :user_id, :status, :votes, presence: true 

    enum status: {
        "Draft":        1,
        "Published":    2,
        "Abandoned":    3,
    }
end
