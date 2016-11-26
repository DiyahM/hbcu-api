class HbcuSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_address, :city, :state, :zip_code, :latitude,
    :longitude, :mission_statement
end
