class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :middle_name, :last_name
end
