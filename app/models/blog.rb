class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :category, presence: true
  validates :user, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
