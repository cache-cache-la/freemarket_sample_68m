require 'rails_helper'
require 'factory/addresses.rb'

RSpec.describe Address do
  describe '住所情報登録のテスト' do
    context '登録が有効' do
      it '住所情報が全て入力済なら有効' do
        address = build(:address)
        expect(address).to be_valid
      end
    end

    context '登録が無効' do  #ビル名や電話番号は任意
      context '各項目が空欄なら無効' do
        it '郵便番号' do
          address = build(:address, postal_code: nil)
          address.valid?
          expect(address.errors[:postal_code]).to include("を入力してください", "は不正な値です")
        end

        it '都道府県' do
          address = build(:address, prefecture: nil)
          address.valid?
          expect(address.errors[:prefecture]).to include("を入力してください", "は不正な値です")
        end

        it '市区町村' do
          address = build(:address, municipality: nil)
          address.valid?
          expect(address.errors[:municipality]).to include("を入力してください", "は不正な値です")
        end

        it '番地' do
          address = build(:address, number: nil)
          address.valid?
          expect(address.errors[:number]).to include("は不正な値です")
        end

      end
    end
  end
end