require 'rails_helper'
require 'factory/images.rb'

RSpec.describe Image, type: :model do
  
  describe '商品登録' do
    context 'バリデーション' do
      context '各項目が空欄なら出品無効' do
        it "画像" do
          image = build(:image, picture: nil)
          image.valid?
          expect(image.errors[:picture]).to include("を入力してください")
        end
      end
    end
  end
end 