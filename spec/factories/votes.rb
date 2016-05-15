FactoryGirl.define do
  factory :vote do
		factory :keep do
			vote true
		end
		factory :kill do
			vote false
		end    
  end
end
