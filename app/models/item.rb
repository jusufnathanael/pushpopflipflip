class Item < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :workspace
  has_many :dues, dependent: :destroy
  accepts_nested_attributes_for :dues

  #after_create :generate_code
  #def generate_code
  #  self.name = SecureRandom.hex
  #  save
  #end
end