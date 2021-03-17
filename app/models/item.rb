class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
    with_options presence: true do
        validates :image
        validates :name
        validates :desctiption
        validates :price, format: { with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to:9999999 }
   end

   with_options numericality: { other_than: 1 } do
     validates :category_id 
     validates :condition_id
     validates :shipping_charges_id
     validates :shipping_area_id
     validates :days_to_ship_id
   end
    end
