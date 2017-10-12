class Comment < ApplicationRecord
  belongs_to :project
  scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }

  validates :description, presence: true

end
