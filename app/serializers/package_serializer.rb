class PackageSerializer < ActiveModel::Serializer
  attributes :id, :topic, :message, :created_at
end
