class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes  :tea_id,
              :customer_id,
              :title,
              :price,
              :frequency,
              :status 
end