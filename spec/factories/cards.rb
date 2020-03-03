FactoryBot.define do

  #各項目の値が入力された状態のインスタンス
  factory :card do
    user              {1}
    customer_id       {"String"}
    card_id           {"String"}
  end

end