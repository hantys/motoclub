class Election < ApplicationRecord
  validates :name, presence: true
  validates :text, presence: true
  validates :user_id, presence: true
  belongs_to :user
end
