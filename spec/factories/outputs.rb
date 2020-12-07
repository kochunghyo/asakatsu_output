FactoryBot.define do
  factory :output do
    title             {"朝散歩最高！"}
    type_id           {1}
    text              {"fff"}
    after(:build) do |output|
      output.images << FactoryBot.build(:image, output_id: output.id)
    end
  end

  factory :type do
    name              {"朝散歩"}
  end

end