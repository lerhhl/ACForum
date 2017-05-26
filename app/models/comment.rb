class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  enum status: {
    "Draft":        1,
    "Published":    2,
    "Abandoned":    3,
  }

  # Scopes
  scope :published_comments, -> {where(status: 2)}
  scope :draft_comments, -> {where(status: 1)}  
end
