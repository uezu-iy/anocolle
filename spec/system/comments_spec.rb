require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'コメント投稿' do
    let(:user) { create(:user) }
    let(:anomaly) { create(:anomaly) }
    describe 'ログイン状態' do
      before do
        sign_in user
        visit anomaly_path(anomaly.id)
      end

      it 'コメント投稿ボタンが表示されること' do
        expect(page).to have_selector '.post-comment'
      end

      it 'コメントが入力されてない場合コメント投稿ボタンを押しても投稿されないこと' do
        click_button '投稿'
        expect(page).not_to have_selector '.comment_list'
      end

      context 'コメントを投稿した場合' do
        before do
          fill_in 'comment[comment_content]', with: 'コメント'
          click_button '投稿'
        end

        it '投稿したコメントが表示されること' do
          expect(page).to have_selector '.comment_list'
        end

        it 'ユーザー名が表示されること' do
          expect(page).to have_content user.name
        end

        it '削除アイコンが表示されること' do
          expect(page).to have_selector '.bi-x'
        end
      end

      context 'コメントの削除' do
        before do
          fill_in 'comment[comment_content]', with: 'コメント'
          click_button '投稿'
        end

        it '削除ボタンをクリックするとコメントが削除されること' do
          click_on '削除'
          expect(page).not_to have_selector '.comment_list'
        end
      end
    end

    describe 'ログアウト状態' do
      before do
        visit anomaly_path(anomaly.id)
      end

      it 'コメント削除アイコンが表示されないこと' do
        expect(page).not_to have_selector '.bi-x'
      end
    end
  end
end
