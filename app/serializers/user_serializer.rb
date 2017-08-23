class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :mobile, :imei, :name, :password
end
