FactoryBot.define do
  factory :image do
    src {Rack::Test::UploadedFile.new(File.join(Rails.root,"spec/fixtures/test_image.jpg"),'image/jpg')}
    output
  end
end