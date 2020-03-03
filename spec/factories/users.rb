FactoryBot.define do

  #各項目の値が入力された状態のインスタンス
  factory :user do
    nickname              {"aいuえo1"}
    email                 {"kkk@gmail.com"}
    password              {"aaa111"}
    lastname              {"安倍"}
    firstname             {"一郎"}
    lastname_kana         {"アベ"}
    firstname_kana        {"イチロウ"}
    birthday              {"2020.10.31"}
  end

end