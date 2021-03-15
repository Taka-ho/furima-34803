require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'name_kanji_namaeが空では登録できない' do
      @user.name_kanji_namae = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kanji namae can't be blank"

    end

    it 'name_kanji_myojiが空では登録できない' do
      @user.name_kanji_myoji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kanji myoji can't be blank"

    end

    it 'name_katakana_namaeが空では登録できない' do
      @user.name_katakana_namae = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name katakana namae can't be blank"

    end

    it 'name_katakana_myojiが空では登録できない' do
      @user.name_katakana_myoji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name katakana myoji can't be blank"

    end
    
    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"

    end
  end
end