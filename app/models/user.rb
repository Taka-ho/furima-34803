class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  
  with_options presence: true do
      validates :nickname
      validates :password, length: { minimum: 6 }
      validates :name_kanji_namae, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/} 
      validates :name_kanji_myoji, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/}
      validates :name_katakana_namae, format: { with: /\A[ァ-ヶー－]+\z/}
      validates :name_katakana_myoji, format: { with: /\A[ァ-ヶー－]+\z/}
      validates :birth_day, format: {with: /\A\d{4}-\d{2}-\d{2}\z/}
   end
   PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
   validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, {presence: true , format: { with: VALID_EMAIL_REGEX }}
end
