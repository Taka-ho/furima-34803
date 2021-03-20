class Order < ApplicationRecord
    

    belongs_to :user
    attr_accessor :token

    with_options presence: true do  
        validates :postal_code, format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ }
        validates :shipping_area_id
        validates :municipality
        validates :address
        validates :building_name
        validates :phone_number, format: { with: /\A[0-9]+\z/ }
   end

    validates :shipping_area_id, numericality: { other_than: 1 }
    
end
