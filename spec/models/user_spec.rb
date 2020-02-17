require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do
  describe '#create' do
    #個人情報が全て存在すれば、保存可
    it "is valid with a nickname, email, encrypted_password, lastname, firstname, lastname_kana, firstnaem_kana, birthday" do
      user = build(:user)
      expect(user).to be_valid
    end
    #nicknameが空なら保存不可
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    #emailが空なら、保存不可
    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    #encrypted_passwordが空なら、保存不可
    it "is invalid without an encrypted_password" do
      user = build(:user, encrypted_password: nil)
      user.valid?
      expect(user.errors[:encrypted_password]).to include("can't be blank")
    end

    #名字が空なら、保存不可
    it "is invalid without lastname" do
      user = build(:user, lastname: nil)
      user.valid?
      expect(user.errors[:lastname]).to include("can't be blank")
    end

    #名前が空なら、保存不可
    it "is invalid without a firstname" do
      user = build(:user, firstname: nil)
      user.valid?
      expect(user.errors[:firstname]).to include("can't be blank")
    end

    #名字のフリガナが空なら、保存不可
    it "is invalid without lastname_kana" do
      user = build(:user, lastname_kana: nil)
      user.valid?
      expect(user.errors[:lastname_kana]).to include("can't be blank")
    end

    #名前のフリガナが空なら、保存不可
    it "is invalid without firstname_kana" do
      user = build(:user, firstname_kana: nil)
      user.valid?
      expect(user.errors[:firstname_kana]).to include("can't be blank")
    end
    #生年月日が空なら、保存不可
    it "is invalid without birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    #nicknameが11文字以上だと保存不可
    it "is invalid with a nickname that has more than 11 characters " do
      user = build(:user, nickname: "aaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 10 characters)")
    end

    #10文字以下なら保存可
    it "is valid with a nickname that has less than 10 characters " do
      user = build(:user, nickname: "aaaaaaaaaa")
      expect(user).to be_valid
    end

    #同じemail addressが存在する場合、保存不可
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    #パスワードが6文字以上なら保存可
    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000")
      user.valid?
      expect(user).to be_valid
    end

    #5文字以下なら保存不可
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    #名字が11文字以上なら保存不可
    it "is invalid with a lastname that has more than 11 characters " do
      user = build(:user, lastname: "あああああああああああ")
      user.valid?
      expect(user.errors[:lastname]).to include("is too long (maximum is 10 characters)")
    end

    #10文字以下なら保存可
    it "is valid with a lastkname that has less than 10 characters " do
      user = build(:user, lastname: "ああああああああああ")
      expect(user).to be_valid
    end

    #名前が11文字以上なら保存不可
    it "is invalid with a firstname that has more than 11 characters " do
      user = build(:user, firstname: "いいいいいいいいいいい")
      user.valid?
      expect(user.errors[:firstname]).to include("is too long (maximum is 10 characters)")
    end

    #10文字以下なら保存可
    it "is valid with a firstname that has less than 10 characters " do
      user = build(:user, firstname: "いいいいいいいいいい")
      expect(user).to be_valid
    end

    #苗字のフリガナが11文字以上なら保存不可
    it "is invalid with a lastname_kana that has more than 10characters " do
      user = build(:user, lastname_kana: "アアアアアアアアアアア")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("is too long (maximum is 10 characters)")
    end

    #10文字以下なら保存可
    it "is valid with a lastname_kana that has less than 10 characters " do
      user = build(:user, lastname_kana: "アアアアアアアアアア")
      expect(user).to be_valid
    end

    #名前のフリガナが11文字以上なら保存不可
    it "is invalid with a firstname_kana that has more than 10characters " do
      user = build(:user, firstname_kana: "イイイイイイイイイイイ")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("is too long (maximum is 10 characters)")
    end

    #10文字以下なら保存可
    it "is valid with a firstname_kana that has less than 10 characters " do
      user = build(:user, firstname_kana: "イイイイイイイイイイ")
      expect(user).to be_valid
    end
  end
end
