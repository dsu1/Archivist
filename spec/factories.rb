FactoryGirl.define do
	factory :user do |f|
		username "test_user"
		email "test_user@domain.com"
		password "secret"
		password_confirmation "secret"
	end
end
