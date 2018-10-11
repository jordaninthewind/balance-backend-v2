class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :email, :location, :total_time, :profile_url
end
