FactoryBot.define do


  factory :product do
     name "test book"
     description "lovely book"
    price "200"
    color "red"
    image_url "hello.jpg"

  end

  factory :comment do
    rating "3"
    body "decent"
  end

end