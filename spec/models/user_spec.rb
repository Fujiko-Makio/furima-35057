require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる時' do
      it '全ての情報が正しく入力できていれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword(確認用)が一致すれば、登録できる' do
        @user.password = '1111mm'
        @user.password_confirmation = '1111mm'
        expect(@user).to be_valid
      end
      it '苗字は全角(漢字、ひらがな、カタカナ)であれば登録できる' do
        @user.first_name = '間ひキ'
        expect(@user).to be_valid
      end
      it '名前は全角(漢字、ひらがな、カタカナ)であれば登録できる' do
        @user.last_name = '期てサ'
        expect(@user).to be_valid
      end
      it '苗字(カナ)は全角(カタカナ)であれば登録できる' do
        @user.first_name_kana = 'キキキキ'
        expect(@user).to be_valid
      end
      it '名前(カナ)は全角(カタカナ)であれば登録できる' do
        @user.last_name_kana = 'キキキキ'
        expect(@user).to be_valid
      end
    end

    context '登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが一意性でなければ登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれなければ登録できない' do
        @user.email = 'aaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00aaa'
        @user.password_confirmation = '00aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは全角のみでは登録できない' do
        @user.password = 'うううううう'
        @user.password_confirmation = 'うううううう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '333333'
        @user.password_confirmation = '333333'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '苗字が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '苗字が半角では登録できない' do
        @user.first_name = 'doooooooooo'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end 
      it '名前が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前は半角では登録できない' do
        @user.last_name = 'sssssssssssss'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it '苗字(カナ)が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '苗字(カナ)が半角では登録できない' do
        @user.first_name_kana = 'ddddddddddd'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it '名前(カナ)が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '名前(カナ)が半角では登録できない' do
        @user.last_name_kana = 'ddddddddddd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

  end

end
