FactoryBot.define do

  factory :user do
    nickname              {"aいuえo1"}
    email                 {"kkk@gmail.com"}
    encrypted_password    {"aaa111"}
    lastname              {"安倍"}
    firstname             {"一郎"}
    lastname_kana         {"アベ"}
    firstname_kana        {"イチロウ"}
    birthday              {"2020.10.31"}
  end

end