require 'rails_helper'

RSpec.describe User, type: :model do
  context "必要な情報が揃っているとき" do
    let(:user) { build(:user) }
    it "ユーザー登録できる" do
      expect(user).to be_valid
    end
  end

  context "ユーザーネームがないとき" do
    let(:user) { build(:user, name: nil) }
    it "ユーザーの作成に失敗する" do
      expect(user).to be_invalid
    end
  end

  context "メールアドレスがないとき" do
    let(:user) { build(:user, email: nil) }
    it "ユーザーの作成に失敗する" do
      expect(user).to be_invalid
    end
  end

  context "passwordがないとき" do
    let(:user) { build(:user, password: nil) }
    it "ユーザーの作成に失敗する" do
      expect(user).to be_invalid
    end
  end

  context "password確認が違うとき" do
    let(:user) { build(:user, password_confirmation: "hogehoge") }
    it "ユーザーの作成に失敗する" do
      expect(user).to be_invalid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'AnomalyTagモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:anomalys).macro).to eq :has_many
      end
    end

    context 'Tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
  end
end
