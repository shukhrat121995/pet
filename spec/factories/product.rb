# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    id { 1 }
    name { 'MacBook Pro 14\'' }
    price { 1999.99 }
    description { '14 inch MacBook Pro, 512GB, 16GB RAM' }
    status { 'active' }
    image { 'https://d1fmx1rbmqrxrr.cloudfront.net/cnet/i/edit/2021/10/apple-macbook-pro-14-2021-1200.jpg' }
  end
end
