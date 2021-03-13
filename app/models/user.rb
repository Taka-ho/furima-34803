class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
      validates :email
      validates :nickname
      validates :encrypted_password
      validates :name_kanji_namae
      validates :name_kanji_myoji
      validates :name_katakana_namae
      validates :name_katakana_myoji
      validates :birth_day
   end
         
end
