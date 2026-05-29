require "test_helper"

class ItemVendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_venda = item_vendas(:one)
  end

  test "should get index" do
    get item_vendas_url
    assert_response :success
  end

  test "should get new" do
    get new_item_venda_url
    assert_response :success
  end

  test "should create item_venda" do
    assert_difference("ItemVenda.count") do
      post item_vendas_url, params: { item_venda: { preco_unitario: @item_venda.preco_unitario, produto_id: @item_venda.produto_id, quantidade: @item_venda.quantidade, venda_id: @item_venda.venda_id } }
    end

    assert_redirected_to item_venda_url(ItemVenda.last)
  end

  test "should show item_venda" do
    get item_venda_url(@item_venda)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_venda_url(@item_venda)
    assert_response :success
  end

  test "should update item_venda" do
    patch item_venda_url(@item_venda), params: { item_venda: { preco_unitario: @item_venda.preco_unitario, produto_id: @item_venda.produto_id, quantidade: @item_venda.quantidade, venda_id: @item_venda.venda_id } }
    assert_redirected_to item_venda_url(@item_venda)
  end

  test "should destroy item_venda" do
    assert_difference("ItemVenda.count", -1) do
      delete item_venda_url(@item_venda)
    end

    assert_redirected_to item_vendas_url
  end
end
