class Comment < ApplicationRecord
  default_scope { order(updated_at: :desc)  }  
  belongs_to :user
  belongs_to :topic
end
