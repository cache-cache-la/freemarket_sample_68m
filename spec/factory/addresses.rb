FactoryBot.define do

  #各項目の値が入力された状態のインスタンス
  factory :address do
    postal_code              {"111-1111"}
    prefecture               {"東京都"}
    municipality             {"渋谷区道玄坂"}
    number                   {"1-9-5"}
    building                 {"渋谷スクエアビル"}
    telephone_number         {"000-0000-0000"}
  end

end