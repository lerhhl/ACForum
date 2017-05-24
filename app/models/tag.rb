class Tag < ApplicationRecord
  belongs_to :topic
  has_many :topic_tags , dependent: :destroy
end
