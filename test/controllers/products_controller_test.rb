require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Create a controlled supplier first
    @supplier = Supplier.create!(
      name: "Test Supplier",
      email: "supplier@test.com",
      phone_number: "123-456-7890"
    )

    # Create a product with our known supplier
    @product = Product.create!(
      name: "Test Product",
      price: 19.99,
      description: "Test Description",
      supplier_id: @supplier.id,
      status: "active"
    )

    @admin = User.create!(
      name: "Admin User",
      email: "admin@test.com",
      password: "password",
      role: :admin
    )

    post "/sessions.json", params: { email: "admin@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json",
           params: { name: "lake", price: 2, description: "Yum Yum", supplier_id: Supplier.first.id },
           headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end

    assert_difference "Product.count", 0 do
      post "/products.json",
           params: {},
           headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 422
    end
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    expected_keys = [ "id", "name", "price", "description", "created_at", "updated_at",
                    "is_discounted?", "tax", "total", "supplier", "supplier_id", "categories", "images_with_default" ]
    assert_equal expected_keys.sort, data.keys.sort
  end

  test "update" do
    patch "/products/#{@product.id}.json",
          params: { name: "Updated name", supplier_id: @supplier.id },
          headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal @product.price.to_s, data["price"]
    assert_equal @product.description, data["description"]
    assert_equal @supplier.id, data["supplier_id"]
  end

  test "destroy" do
    product = Product.first
    delete "/products/#{product.id}.json",
           headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    product.reload
    assert_equal "archived", product.status
  end
end
