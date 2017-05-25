class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  enum status: {
    "Draft":        1,
    "Published":    2,
    "Abandoned":    3,
  }
end
