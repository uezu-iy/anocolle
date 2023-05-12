require 'rails_helper'

RSpec.describe Anomaly, type: :model do
  describe "正常なとき" do
    context "タイトルと本文が存在するとき" do
      let(:anomaly) { build(:anomaly) }
      it "投稿が作成される" do
        expect(anomaly).to be_valid
      end
    end
  end

  describe "異常なとき" do
    context "投稿のtitleが無いとき" do
      let(:anomaly) { build(:anomaly, title: nil) }
      it "投稿の作成に失敗する" do
        expect(anomaly).to be_invalid
        expect(anomaly.errors.full_messages).to include('タイトルを入力してください')
      end
    end

    context "投稿のcontentが無いとき" do
      let(:anomaly) { build(:anomaly, content: nil) }
      it "投稿の作成に失敗する" do
        expect(anomaly).to be_invalid
        expect(anomaly.errors.full_messages).to include('本文を入力してください')
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Anomaly.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'AnomalyTagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Anomaly.reflect_on_association(:anomaly_tags).macro).to eq :has_many
      end
    end

    context 'Tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Anomaly.reflect_on_association(:tags).macro).to eq :has_many
      end
    end

    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Anomaly.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
  end
end
