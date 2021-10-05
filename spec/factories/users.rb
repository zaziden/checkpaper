FactoryBot.define do
  factory :user do
    name                   { 'test' }
    email                  { 'nnnn@nnnn'}
    encrypted_password     { 111111 }
  end
end
