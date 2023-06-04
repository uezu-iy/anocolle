require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'ユーザー新規登録' do
    context 'フォームに正しく入力されたとき' do
      it 'アカウント作成ができること' do
        visit root_path
        click_link 'ユーザー登録'
        fill_in '名前', with: 'username'
        fill_in 'メールアドレス', with: 'email@example.com'
        fill_in 'パスワード(6文字以上)', with: 'password1'
        fill_in 'パスワード確認', with: 'password1'
        click_button '新しいアカウントを作成'
        expect(current_path).to eq anomalys_path
      end
    end

    context 'フォームが未入力であるとき' do
      it 'アカウント作成に失敗すること' do
        visit new_user_registration_path
        fill_in '名前', with: ''
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード(6文字以上)', with: ''
        fill_in 'パスワード確認', with: ''
        click_button '新しいアカウントを作成'
        expect(page).to have_content 'Eメールを入力してください'
        expect(page).to have_content 'パスワードを入力してください'
        expect(page).to have_content 'Nameを入力してください'
        expect(current_path).to eq users_path
      end
    end

    context '登録済みのメールアドレスを使用したとき' do
      it 'アカウント作成に失敗すること' do
        other_user = create(:user)
        visit new_user_registration_path
        fill_in '名前', with: 'username'
        fill_in 'メールアドレス', with: other_user.email
        fill_in 'パスワード(6文字以上)', with: 'password1'
        fill_in 'パスワード確認', with: 'password1'
        click_button '新しいアカウントを作成'
        expect(page).to have_content 'Eメールはすでに存在します'
        expect(current_path).to eq users_path
      end
    end
  end

  describe 'ユーザー編集' do
    let(:user) { create(:user) }
    before do
      sign_in user
    end

    it 'メールアドレス変更が成功すること' do
      visit root_path
      click_link 'マイページ'
      click_link '編集'
      fill_in 'メールアドレス', with: 'email2a@example.com'
      click_button '更新'
      expect(current_path).to eq users_path
    end

    it 'パスワード変更が成功すること' do
      visit root_path
      click_link 'マイページ'
      click_link '編集'
      fill_in 'パスワード(6文字以上)', with: 'password2'
      fill_in 'パスワード確認', with: 'password2'
      click_button '更新'
      expect(current_path).to eq users_path
    end
  end
end
