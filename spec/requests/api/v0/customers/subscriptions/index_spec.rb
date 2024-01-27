describe "Customer Subscriptions Index" do
  before(:each) do
    test_data
  end

  it "customer subscriptions index" do
    get "/api/v0/customers/#{@customer1.id}/subscriptions"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(subscriptions).to be_a Array

    # Test the first subscription
    first_subscription = subscriptions.first
    expect(first_subscription[:id].to_i).to be_a Integer
    expect(first_subscription[:id].to_i).to_not eq(0)
    expect(first_subscription[:type]).to eq("subscription")

    attributes = first_subscription[:attributes]
    expect(attributes[:tea_id]).to eq(@tea1.id)
    expect(attributes[:customer_id]).to eq(@customer1.id)
    expect(attributes[:title]).to eq("Black Tea Sub")
    expect(attributes[:price]).to eq(50)
    expect(attributes[:frequency]).to eq(30)
    expect(attributes[:status]).to eq("active")

    # Test the second subscription
    second_subscription = subscriptions[1]
    expect(second_subscription[:id].to_i).to be_a Integer
    expect(second_subscription[:id].to_i).to_not eq(0)
    expect(second_subscription[:type]).to eq("subscription")

    attributes = second_subscription[:attributes]
    expect(attributes[:tea_id]).to eq(@tea2.id)
    expect(attributes[:customer_id]).to eq(@customer1.id)
    expect(attributes[:title]).to eq("Green Tea Sub")
    expect(attributes[:price]).to eq(25)
    expect(attributes[:frequency]).to eq(60)
    expect(attributes[:status]).to eq("cancelled")
  end

  it "sad path" do
    get "/api/v0/customers/1/subscriptions"

    expect(response).to_not be_successful
    expect(response.status).to eq(404)

    error = JSON.parse(response.body, symbolize_names: true)[:errors]

    expect(error.first[:detail]).to eq("Couldn't find Customer with 'id'=1")
  end
end