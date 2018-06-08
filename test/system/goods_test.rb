require "application_system_test_case"

class GoodsTest < ApplicationSystemTestCase
  setup do
    @good = goods(:one)
  end

  test "visiting the index" do
    visit goods_url
    assert_selector "h1", text: "Goods"
  end

  test "creating a Good" do
    visit goods_url
    click_on "New Good"

    fill_in "Buy Day", with: @good.buy_day
    fill_in "Buy Month", with: @good.buy_month
    fill_in "Buy Price", with: @good.buy_price
    fill_in "Buy Year", with: @good.buy_year
    fill_in "Buyed From", with: @good.buyed_from
    fill_in "Description", with: @good.description
    fill_in "Quantity", with: @good.quantity
    fill_in "Sell Day", with: @good.sell_day
    fill_in "Sell Month", with: @good.sell_month
    fill_in "Sell Price", with: @good.sell_price
    fill_in "Sell Year", with: @good.sell_year
    fill_in "Sold To", with: @good.sold_to
    fill_in "Type", with: @good.type
    fill_in "User", with: @good.user_id
    click_on "Create Good"

    assert_text "Good was successfully created"
    click_on "Back"
  end

  test "updating a Good" do
    visit goods_url
    click_on "Edit", match: :first

    fill_in "Buy Day", with: @good.buy_day
    fill_in "Buy Month", with: @good.buy_month
    fill_in "Buy Price", with: @good.buy_price
    fill_in "Buy Year", with: @good.buy_year
    fill_in "Buyed From", with: @good.buyed_from
    fill_in "Description", with: @good.description
    fill_in "Quantity", with: @good.quantity
    fill_in "Sell Day", with: @good.sell_day
    fill_in "Sell Month", with: @good.sell_month
    fill_in "Sell Price", with: @good.sell_price
    fill_in "Sell Year", with: @good.sell_year
    fill_in "Sold To", with: @good.sold_to
    fill_in "Type", with: @good.type
    fill_in "User", with: @good.user_id
    click_on "Update Good"

    assert_text "Good was successfully updated"
    click_on "Back"
  end

  test "destroying a Good" do
    visit goods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Good was successfully destroyed"
  end
end
