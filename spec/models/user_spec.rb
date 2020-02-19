require 'rails_helper'
require 'factory/users.rb'

RSpec.describe User do
  describe 'ユーザー登録時のバリデーションテスト' do

    context '登録が有効' do
      it "個人情報が全て入力済なら有効" do
        user = build(:user)
        expect(user).to be_valid
      end

      context '各項目の字数が10文字以下なら有効' do
        it "ニックネーム" do
          user = build(:user, nickname: "aaaaaaaaaa")
          expect(user).to be_valid
        end

        it "名字" do
          user = build(:user, lastname: "阿阿阿阿阿阿阿阿阿阿")
          expect(user).to be_valid
        end

        it "名前" do
          user = build(:user, firstname: "井井井井井井井井井井")
          expect(user).to be_valid
        end

        it "名字のフリガナ" do
          user = build(:user, lastname_kana: "アアアアアアアアアア")
          expect(user).to be_valid
        end

        it "名前のフリガナ" do
          user = build(:user, firstname_kana: "イイイイイイイイイイ")
          expect(user).to be_valid
        end
      end
    end

    context '登録が無効' do
      context '各項目が空欄なら無効' do
        it "ニックネーム" do
          user = build(:user, nickname: nil)
          user.valid?
          expect(user.errors[:nickname]).to include("を入力してください", "を入力してください", "は不正な値です")
        end

        it "email" do
          user = build(:user, email: nil)
          user.valid?
          expect(user.errors[:email]).to include("を入力してください")
        end

        it "パスワード" do
          user = build(:user, password: nil)
          user.valid?
          expect(user.errors[:password]).to include("を入力してください")
        end

        it "名字" do
          user = build(:user, lastname: nil)
          user.valid?
          expect(user.errors[:lastname]).to include("を入力してください")
        end

        it "名前" do
          user = build(:user, firstname: nil)
          user.valid?
          expect(user.errors[:firstname]).to include("を入力してください")
        end

        it "名字のフリガナ" do
          user = build(:user, lastname_kana: nil)
          user.valid?
          expect(user.errors[:lastname_kana]).to include("を入力してください")
        end

        it "名前のフリガナ" do
          user = build(:user, firstname_kana: nil)
          user.valid?
          expect(user.errors[:firstname_kana]).to include("を入力してください")
        end

        it "生年月日" do
          user = build(:user, birthday: nil)
          user.valid?
          expect(user.errors[:birthday]).to include("を入力してください")
        end
      end

      context '各項目の字数が11文字以上だと無効' do
        it "ニックネーム" do
          user = build(:user, nickname: "aaaaaaaaaaa")
          user.valid?
          expect(user.errors[:nickname]).to include("は10文字以内で入力してください")
        end

        it "名字" do
          user = build(:user, lastname: "あああああああああああ")
          user.valid?
          expect(user.errors[:lastname]).to include("は10文字以内で入力してください")
        end

        it "名前" do
          user = build(:user, firstname: "いいいいいいいいいいい")
          user.valid?
          expect(user.errors[:firstname]).to include("は10文字以内で入力してください")
        end

        it "名字のフリガナ" do
          user = build(:user, lastname_kana: "アアアアアアアアアアア")
          user.valid?
          expect(user.errors[:lastname_kana]).to include("は10文字以内で入力してください")
        end

        it "名前のフリガナ" do
          user = build(:user, firstname_kana: "イイイイイイイイイイイ")
          user.valid?
          expect(user.errors[:firstname_kana]).to include("は10文字以内で入力してください")
        end
      end

      it "同じemailが存在すると無効" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end

    end
  end
end