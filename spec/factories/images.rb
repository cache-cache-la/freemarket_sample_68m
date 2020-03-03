FactoryBot.define do

  #各項目の値が入力された状態のインスタンス
  factory :image do
    picture {File.open("#{Rails.root}/public/images/test_image.jpg")}
  end
end 