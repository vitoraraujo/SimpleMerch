require 'test_helper'

class GoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @good = goods(:one)
  end

  test "should get index" do
    get goods_url
    assert_response :success
  end

  test "should get new" do
    get new_good_url
    assert_response :success
  end

  test "should create good" do
    assert_difference('Good.count') do
      post goods_url, params: { good: { buy_day: @good.buy_day, buy_month: @good.buy_month, buy_price: @good.buy_price, buy_year: @good.buy_year, buyed_from: @good.buyed_from, description: @good.description, quantity: @good.quantity, sell_day: @good.sell_day, sell_month: @good.sell_month, sell_price: @good.sell_price, sell_year: @good.sell_year, sold_to: @good.sold_to, type: @good.type, user_id: @good.user_id } }
    end

    assert_redirected_to good_url(Good.last)
  end

  test "should show good" do
    get good_url(@good)
    assert_response :success
  end

  test "should get edit" do
    get edit_good_url(@good)
    assert_response :success
  end

  test "should update good" do
    patch good_url(@good), params: { good: { buy_day: @good.buy_day, buy_month: @good.buy_month, buy_price: @good.buy_price, buy_year: @good.buy_year, buyed_from: @good.buyed_from, description: @good.description, quantity: @good.quantity, sell_day: @good.sell_day, sell_month: @good.sell_month, sell_price: @good.sell_price, sell_year: @good.sell_year, sold_to: @good.sold_to, type: @good.type, user_id: @good.user_id } }
    assert_redirected_to good_url(@good)
  end

  test "should destroy good" do
    assert_difference('Good.count', -1) do
      delete good_url(@good)
    end

    assert_redirected_to goods_url
  end
end
