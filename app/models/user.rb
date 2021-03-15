class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
      validates :email
      validates :nickname
      validates :encrypted_password#, format: { with: /\A[a-zA-Z0-9]+\z/}
      validates :name_kanji_namae, format: { with: /\A[一-龥]+\z/} 
      validates :name_kanji_myoji, format: { with: /\A[一-龥]+\z/}
      validates :name_katakana_namae, format: { with: /\A[ァ-ヶー－]+\z/}
      validates :name_katakana_myoji, format: { with: /\A[ァ-ヶー－]+\z/}
      validates :birth_day, format: {with: /\A\d{4}-\d{2}-\d{2}\z/}
   end
         
end
