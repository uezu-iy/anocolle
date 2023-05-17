require 'rails_helper'

RSpec.describe "Anomalies", type: :system do
  describe '異常の投稿' do
    let(:user) { create(:user) }
    let!(:anomaly) { create(:anomaly) }
    let!(:anomaly_tag) { create(:anomaly_tag) }

    before do
      driven_by(:rack_test)
      sign_in user
    end

    context '異常一覧ページでクリックしたとき' do
      it '投稿の新規作成ページに移行' do
        visit anomalys_path
        click_on '投稿する'
        expect(current_path).to eq new_anomaly_path
      end

      it 'タイトルをクリックしたとき投稿詳細ページに移行' do
        visit anomalys_path
        click_link anomaly.title
        expect(current_path).to eq anomaly_path(anomaly.id)
      end

      it 'ユーザー名をクリックしたときマイページに移行' do
        visit anomalys_path
        click_link anomaly.user.name
        expect(current_path).to eq users_path(anomaly.user.id)
      end

      it 'タグ名をクリックしたときタグを含む一覧ページに移行' do
        visit anomalys_path
        click_link anomaly_tag.tag.tag_name
        expect(current_path).to eq search_tag_path
      end
    end

    context '新規作成画面でクリックしたとき' do
      it '投稿を新規作成したとき異常一覧ページに移行' do
        visit new_anomaly_path
        click_button '投稿'
        expect(current_path).to eq anomalys_path
      end
    end

    context '投稿詳細ページでクリックしたとき' do
      it '編集のリンクをクリックしたとき投稿の編集ページに移行' do
        sign_in anomaly.user
        visit anomaly_path(anomaly.id)
        click_on '編集'
        expect(current_path).to eq edit_anomaly_path(anomaly)
      end

      it '削除のリンクをクリックしたとき異常一覧ページに移行' do
        sign_in anomaly.user
        visit anomaly_path(anomaly.id)
        click_on '削除'
        delete anomaly_path(anomaly.id)
        expect(current_path).to eq anomalys_path
      end
    end

    context 'キーワードの検索をしたとき' do
      it '投稿の検索ができること' do
        visit anomalys_path
        fill_in 'q[title_cont]', with: anomaly.title
        find('.btn-search').click
        expect(page).to have_content anomaly.title
      end

      it '対象外の投稿が検索されないこと' do
        other_anomaly = create(:anomaly)
        visit anomalys_path
        fill_in 'q[title_cont]', with: anomaly.title
        find('.btn-search').click
        expect(page).not_to have_content other_anomaly.title
      end
    end
  end
end
