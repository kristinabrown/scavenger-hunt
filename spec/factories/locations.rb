FactoryGirl.define do
  
  factory :location do
    name "Turing Basement"
  end
  
  factory :location_2, class: Location do
    name "Chipotle"
  end
  
  factory :location_3, class: Location do
    name "Starbucks"
  end
  
  factory :location_4, class: Location do
    name "Illegal Pete's"
  end


end
