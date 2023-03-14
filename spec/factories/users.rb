FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'abc000'}
    password_confirmation {password}
    last_name             {'原'}
    first_name            {'ゆたか'}
    last_name_kana        {'ハラ'}
    first_name_kana       {'ユタカ'}
    user_birth_date       {'2000-01-01'}
  end
end