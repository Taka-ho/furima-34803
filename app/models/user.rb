class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
      validates :nickname
      validates :password, format: { with: /\A[a-zA-Z0-9]+\z/}, length: { minimum: 6 }
      validates :name_kanji_namae, format: { with: /\A[ぁ-んァ-ン一-龥]/} 
      validates :name_kanji_myoji, format: { with: /\A[ぁ-んァ-ン一-龥]/}
      validates :name_katakana_namae, format: { with: /\A[ァ-ヶー－]+\z/}
      validates :name_katakana_myoji, format: { with: /\A[ァ-ヶー－]+\z/}
      validates :birth_day, format: {with: /\A\d{4}-\d{2}-\d{2}\z/}
   end
   PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
   validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
end
