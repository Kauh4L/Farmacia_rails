require "application_system_test_case"

class ItemVendasTest < ApplicationSystemTestCase
  setup do
    @item_venda = item_vendas(:one)
  end

  test "visiting the index" do
    visit item_vendas_url
    assert_selector "h1", text: "Item vendas"
  end

  test "should create item venda" do
    visit item_vendas_url
    click_on "New item venda"

    fill_in "Preco unitario", with: @item_venda.preco_unitario
    fill_in "Produto", with: @item_venda.produto_id
    fill_in "Quantidade", with: @item_venda.quantidade
    fill_in "Venda", with: @item_venda.venda_id
    click_on "Create Item venda"

    assert_text "Item venda was successfully created"
    click_on "Back"
  end

  test "should update Item venda" do
    visit item_venda_url(@item_venda)
    click_on "Edit this item venda", match: :first

    fill_in "Preco unitario", with: @item_venda.preco_unitario
    fill_in "Produto", with: @item_venda.produto_id
    fill_in "Quantidade", with: @item_venda.quantidade
    fill_in "Venda", with: @item_venda.venda_id
    click_on "Update Item venda"

    assert_text "Item venda was successfully updated"
    click_on "Back"
  end

  test "should destroy Item venda" do
    visit item_venda_url(@item_venda)
    click_on "Destroy this item venda", match: :first

    assert_text "Item venda was successfully destroyed"
  end
end
