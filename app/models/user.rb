class User < ApplicationRecord
    validates :username, uniqueness: true
    validates :username, presence: true  # Adding validations
    validates :password, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    include ActiveModel::Serialization

    has_many :blogs
    has_secure_password
end
