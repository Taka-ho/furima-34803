require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができるとき' do
      it 'すべてを入力したら保存できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録ができないとき' do
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

    it 'passwordが6文字以下では登録できない' do
      @user.password = '1a1'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it 'passwordが半角数字のみの場合は登録できない' do
      @user.password = '11'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end

    it 'passwordが半角英字のみの場合は登録できない' do
      @user.password = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end

    it 'passwordが全角の場合は登録できない' do
      @user.password = '１１ａａ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end

    it 'passwordとpassword_confirmationが一致していないと登録できない' do
      @user.password = 'aa11bb'
      @user.password_confirmation = 'aa22bb'
      @user.valid?
      expect( @user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'name_kanji_namaeが空では登録できない' do
      @user.name_kanji_namae = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kanji namae can't be blank"

    end

    it 'name_kanji_namaeが漢字・平仮名・片仮名以外だと登録出来ない。' do
      @user.name_kanji_namae = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kanji namae is invalid"
    end

    it 'name_kanji_myojiが空では登録できない' do
      @user.name_kanji_myoji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kanji myoji can't be blank"

    end

    it 'name_kanji_myojiが漢字・平仮名・片仮名以外だと登録出来ない。' do
      @user.name_kanji_myoji = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kanji myoji is invalid"

    end

    it 'name_katakana_namaeが空では登録できない' do
      @user.name_katakana_namae = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name katakana namae can't be blank"

    end

    it 'name_katakana_namaeが片仮名以外だと登録出来ない' do
      @user.name_katakana_namae = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Name katakana namae is invalid"

    end

    it 'name_katakana_myojiが空では登録できない' do
      @user.name_katakana_myoji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name katakana myoji can't be blank"

    end

    it 'name_katakana_myojiが片仮名以外だと登録出来ない' do
      @user.name_katakana_myoji = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include "Name katakana myoji is invalid"
    end
    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"

    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
end