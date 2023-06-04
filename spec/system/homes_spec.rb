require 'rails_helper'

RSpec.describe "Homes", type: :system do
  let(:user) { create(:user) }

  before do
    driven_by(:rack_test)
    sign_in user
  end

  describe 'トップページでクリックしたとき' do
    context '投稿を見るボタンをクリックしたとき' do
      it '投稿を見るボタンをクリックしたとき異常一覧ページに移行' do
        visit root_path
        click_on '投稿を見る'
        expect(current_path).to eq anomalys_path
      end
    end

    context 'ヘッダーをクリックしたとき' do
      it 'ヘッダーの異常一覧をクリックしたとき異常一覧ページに移行' do
        visit root_path
        click_on '異常一覧'
        expect(current_path).to eq anomalys_path
      end
    end
  end
end
