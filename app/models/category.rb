class Category < ApplicationRecord
    has_many :blogs
    validates :title, uniqueness: true
end
