class FormOrder

    include ActiveModel::Model
  attr_accessor :token, :item_id, :price, :user_id, :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number


  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ }
        validates :shipping_area_id
        validates :municipality
        validates :address
        validates :building_name
        validates :phone_number, format: { with: /\A[0-9]+\z/ }
 end
 validates :shipping_area_id, numericality: { other_than: 1 }

    def save 
        @buy = Buy.create(item_id: item_id, user_id: user_id)

        Order.create( 
            buy_id: @buy.id, postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end


    
end