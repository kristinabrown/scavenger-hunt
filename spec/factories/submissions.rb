FactoryGirl.define do
  factory :submission_1, class: Submission do
    correct false
    responded_to false
  end
  
  factory :submission_2, class: Submission do
    correct true
    responded_to true
  end
  
  factory :submission_3, class: Submission do
    correct false
    responded_to true
  end
  
  factory :submission_4, class: Submission do
    correct false
    responded_to false
  end
end
