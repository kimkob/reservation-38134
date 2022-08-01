require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録可能' do
      it '全て正しく入力できている' do
        expect(@user).to be_valid
      end
    end

    context '新規登録不可' do
      #email
      it 'email必須' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'email一意性' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailが@を含む' do
        @user.email = 'testtesttest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      #password
      it 'password必須' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordとpassword_confirmationが一致' do
        @user.password_confirmation = '123456q'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it '' do
      end
      it '' do
      end
      it '' do
      end
      
      # birthdya#
      it 'birthday必須' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
