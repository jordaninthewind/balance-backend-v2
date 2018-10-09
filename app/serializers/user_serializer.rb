class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :email, :location, :total_time, :profile_url
  # has_many :meditation_sessions
end
