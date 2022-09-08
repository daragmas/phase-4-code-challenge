class VendorShowSerializer < ActiveModel::Serializer
  attributes :id, :name
  
  has_many :vendor_sweets

end
