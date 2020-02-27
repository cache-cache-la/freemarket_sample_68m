FactoryBot.define do

  #各項目の値が入力された状態のインスタンス
  factory :brand do
    sequence(:id)
    sequence(:name)
  end

end