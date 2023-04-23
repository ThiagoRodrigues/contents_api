class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :original_title, :year, :type, :order
end
