require 'rails_helper'

RSpec.describe Tag, type: :model do
  context "タグが入力されている時" do
    let(:tag) { build(:tag) }
    it "タグが生成できる" do
      expect(tag).to be_valid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Anomalyモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:anomalys).macro).to eq :has_many
      end
    end

    context 'AnomalyTagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:anomaly_tags).macro).to eq :has_many
      end
    end
  end
end
