require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "lake", price: 2, description: "Yum Yum", supplier_id: Supplier.first.id }
      assert_response 200
    end
    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal [ "id", "name", "price", "description", "created_at", "updated_at", "is_discounted?", "tax", "total", "supplier", "images" ], data.keys
  end

  test "update" do
    product = Product.first
    # p product
    patch "/products/#{product.id}.json", params: { name: "Updated name", supplier_id: Supplier.first.id }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.price.to_s, data["price"]
    assert_equal product.description, data["description"]
    assert_equal product.supplier_id, data["supplier_id"]

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
