require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  let(:user) { create(:user) }
  before do
    driven_by(:rack_test)
  end

  describe 'ログイン前' do
    context 'ヘッダー表示' do
      it 'ユーザー登録リンクが表示されること' do
        visit root_path
        expect(page).to have_link 'ユーザー登録'
      end

      it 'ログインリンクが表示されること' do
        visit root_path
        expect(page).to have_link 'ログイン'
      end

      it 'ゲストログインリンクが表示されること' do
        visit root_path
        expect(page).to have_link 'ゲストログイン'
      end
    end

    context 'フォームに正しく入力されたとき' do
      it 'ログインが成功すること' do
        visit root_path
        click_link 'ログイン'
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'
        expect(current_path).to eq root_path
      end
    end

    context 'フォームが未入力であるとき' do
      it 'ログインが失敗すること' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: ''
        click_button 'ログイン'
        expect(current_path).to eq new_user_session_path
      end
    end

    context 'ゲストログインをクリックしたとき' do
      it 'ログインが成功すること' do
        visit root_path
        click_link 'ゲストログイン'
        expect(current_path).to eq root_path
        expect(page).to have_link 'ログアウト'
      end
    end

    context '投稿するボタンの表示' do
      it '投稿するボタンが表示されないこと' do
        visit root_path
        expect(page).not_to have_link '投稿する'
      end
    end
  end

  describe 'ログイン後' do
    before do
      sign_in user
    end

    context 'ヘッダー表示' do
      it 'ユーザー登録リンクが表示されないこと' do
        expect(page).not_to have_link 'ユーザー登録'
      end

      it 'ログインリンクが表示されないこと' do
        expect(page).not_to have_link 'ログイン'
      end
    end

    context '投稿するボタンの表示' do
      it '投稿するボタンが表示されること' do
        visit root_path
        expect(page).to have_link '投稿する'
      end
    end

    context 'ログアウトボタンをクリックしたとき' do
      it 'ログアウトが成功すること' do
        visit root_path
        click_link 'ログアウト'
        expect(current_path).to eq root_path
        expect(page).to have_link 'ログイン'
      end
    end
  end
end
