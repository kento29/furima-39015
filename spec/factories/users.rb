# FactoryBot.define do
#   factory :user do
#     nickname              {'test'}
#     email                 {'test@example'}
#     password              {'000000'}
#     password_confirmation {password}
#     last_name             {原}
#     first_name            {ゆたか}
#     last_name_kana        {ハラ}
#     first_name_kana       {ユタカ}

#   end
# end

# FactoryBot.define do
#   factory :user do
#     nickname              {Faker::Name.initials(number: 2)}
#     email                 {Faker::Internet.free_email}
#     password              {Faker::Internet.password(min_length: 6)}
#     password_confirmation {password}
#   end
# end