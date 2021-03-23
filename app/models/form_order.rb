class FormOrder

    include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number


  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }, length: { maximum: 8 }
        validates :shipping_area_id
        validates :municipality, format: {with: /\A[ぁ-んァ-ン一-龥]/}
        validates :address
        validates :phone_number, format: { with: /\A[0-9]+\z/ }, length: { maximum: 12   }
        validates :user_id
        validates :item_id
        validates :token
  end

 validates :shipping_area_id, numericality: { other_than: 1 }

    def save 
        @buy = Buy.create(item_id: item_id, user_id: user_id)

        Order.create( 
            buy_id: @buy.id, postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number
            )
  end


    
end