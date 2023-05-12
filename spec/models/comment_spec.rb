require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "異常なとき" do
    context '有効な値の場合' do
      let(:comment) { create(:comment) }
      it 'commentが有効であること' do
        expect(comment).to be_valid
      end
    end
  end

  describe "異常なとき" do
    context "anomaly_idが存在しないこと" do
      let(:comment) { build(:comment, anomaly_id: nil) }
      it "エラーになる" do
        expect(comment).to be_invalid
      end
    end

    context "user_idが存在しないこと" do
      let(:comment) { build(:comment, user_id: nil) }
      it "エラーになる" do
        expect(comment).to be_invalid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Anomalyモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:anomaly).macro).to eq :belongs_to
      end
    end

    context 'Tagモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
