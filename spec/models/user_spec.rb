require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全てのユーザー情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nick_nameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'first_name_kannjiが空では登録できない' do
        @user.first_name_kannji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kannji can't be blank")
      end
      it 'second_name_kannjiが空では登録できない' do
        @user.second_name_kannji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name kannji can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'second_name_kanaが空では登録できない' do
        @user.second_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name kana can't be blank")
      end
      it 'date_birthが空では登録できない' do
        @user.date_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date birth can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'passwordは全角文字だと登録できない' do
        @user.password = '９９９ｚｚｚ'
        @user.password_confirmation = '９９９ｚｚｚ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'first_name_kannjiは数字では登録できない' do
        @user.first_name_kannji = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kannji は全角ひらがな、全角カタカナ、漢字で入力して下さい。')
      end
      it 'first_name_kannjiは半角文字では登録できない' do
        @user.first_name_kannji = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kannji は全角ひらがな、全角カタカナ、漢字で入力して下さい。')
      end
      it 'second_name_kannjiは数字では登録できない' do
        @user.second_name_kannji = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name kannji は全角ひらがな、全角カタカナ、漢字で入力して下さい。')
      end
      it 'second_name_kannjiは半角文字では登録できない' do
        @user.second_name_kannji = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name kannji は全角ひらがな、全角カタカナ、漢字で入力して下さい。')
      end
      it 'first_name_kanaは漢字では登録できない' do
        @user.first_name_kana = '小山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana はカタカナで入力して下さい。')
      end
      it 'first_name_kanaはひらがなでは登録できない' do
        @user.first_name_kana = 'おやまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana はカタカナで入力して下さい。')
      end
      it 'first_name_kanaは数字では登録できない' do
        @user.first_name_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana はカタカナで入力して下さい。')
      end
      it 'second_name_kanaは漢字では登録できない' do
        @user.second_name_kana = '小山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name kana はカタカナで入力して下さい。')
      end
      it 'second_name_kanaはひらがなでは登録できない' do
        @user.second_name_kana = 'おやまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name kana はカタカナで入力して下さい。')
      end
      it 'second_name_kanaは数字では登録できない' do
        @user.second_name_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name kana はカタカナで入力して下さい。')
      end
    end
  end
end
