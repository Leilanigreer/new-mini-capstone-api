json.id order.id
json.user_id order.user_id
json.subtotal order.subtotal
json.tax order.tax
json.total order.total
json.ordered_date order.ordered_date
json.updated_date order.updated_date
json.carted_products order.carted_products.each do |cp|
  json.id cp.id
  json.product_quantity cp.product_quantity
  json.purchased_price cp.purchased_price
  json.total_carted_price cp.product.price * cp.product_quantity
  json.product cp.product
end
