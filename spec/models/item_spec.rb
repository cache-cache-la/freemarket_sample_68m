require 'rails_helper'
require 'factory/items.rb'

RSpec.describe Item, type: :model do

  describe '商品登録' do

    context 'バリデーション' do
      context '各項目が空欄なら出品無効' do
        it "商品名" do
          item = build(:item, name: nil)
          item.valid?
          expect(item.errors[:name]).to include("を入力してください")
        end

        it "商品説明" do
          item = build(:item, text: nil)
          item.valid?
          expect(item.errors[:text]).to include("を入力してください")
        end

        it "価格" do
          item = build(:item, price: nil)
          item.valid?
          expect(item.errors[:price]).to include("を入力してください")
        end
      end
    end
  end
end
