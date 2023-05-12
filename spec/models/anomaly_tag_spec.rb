require 'rails_helper'

RSpec.describe AnomalyTag, type: :model do
  describe "正常なとき" do
    context "anomaly_id と tag_idが存在すること" do
      let(:anomaly_tag) { create(:anomaly_tag) }
      it "有効である" do
        expect(anomaly_tag).to be_valid
      end
    end
  end

  describe "異常なとき" do
    context "anomaly_idが存在しないこと" do
      let(:anomaly_tag) { build(:anomaly_tag, anomaly_id: nil) }
      it "エラーになる" do
        expect(anomaly_tag).to be_invalid
      end
    end

    context "tag_idが存在しないこと" do
      let(:anomaly_tag) { build(:anomaly_tag, tag_id: nil) }
      it "エラーになる" do
        expect(anomaly_tag).to be_invalid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Anomalyモデルとの関係' do
      it 'N:1となっている' do
        expect(AnomalyTag.reflect_on_association(:anomaly).macro).to eq :belongs_to
      end
    end

    context 'Tagモデルとの関係' do
      it 'N:1となっている' do
        expect(AnomalyTag.reflect_on_association(:tag).macro).to eq :belongs_to
      end
    end
  end
end
