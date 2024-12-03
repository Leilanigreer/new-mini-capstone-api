require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Create a test user
    @user = User.create(name: "Test", email: "test@test.com", password: "password")

    # Create a product for our cart
    @product = Product.first

    # Updated to use product_quantity instead of quantity
    @carted_product = CartedProduct.create(
      user_id: @user.id,
      product_id: @product.id,
      product_quantity: 2,  # Changed from quantity to product_quantity
      status: "carted"
    )

    @order = Order.create(
      user_id: @user.id,
      subtotal: 19.98,
      tax: 1.99,
      total: 21.97,
      payment_method: "credit_card"
    )

    # Authenticate the user
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/orders.json", headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200
  end

  test "create" do
    assert_difference "Order.count", 1 do
      # Updated to use product_quantity in the cart creation
      CartedProduct.create(
        user_id: @user.id,
        product_id: @product.id,
        product_quantity: 2,  # Changed from quantity to product_quantity
        status: "carted"
      )

      post "/orders.json", headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end

  test "show" do
    get "/orders/#{@order.id}.json", headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    expected_keys = [ "id", "user_id", "subtotal", "tax", "total", "ordered_date", "updated_date", "carted_products" ]
    assert_equal expected_keys.sort, data.keys.sort
  end
end
