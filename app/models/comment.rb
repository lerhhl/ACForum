class Comment < ApplicationRecord
  default_scope { order(updated_at: :desc)  }  
  belongs_to :user
  belongs_to :topic

  enum status: {
    "Draft":        1,
    "Published":    2,
    "Abandoned":    3,
  }
end
