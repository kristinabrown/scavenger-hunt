FactoryGirl.define do

  factory :team do
    name            'team 1'
    slug            '1d5b2b3d2454b24e20ed42c6b6557465'
    phone_number    '13035142588'
  end

  factory :team_2, class: Team do
    name            'team 2'
    slug            '2d5b2b3d2454b24e20ed42c6b6557465'
    phone_number    '12223334444'
  end


  factory :team_3, class: Team do
    name            'team 3'
    slug            '3d5b2b3d2454b24e20ed42c6b6557465'
    phone_number    '13334445555'
  end

end