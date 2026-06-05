require "application_system_test_case"

class MedicamentosTest < ApplicationSystemTestCase
  setup do
    @medicamento = medicamentos(:one)
  end

  test "visiting the index" do
    visit medicamentos_url
    assert_selector "h1", text: "Medicamentos"
  end

  test "should create medicamento" do
    visit medicamentos_url
    click_on "New medicamento"

    fill_in "Estoque", with: @medicamento.estoque
    fill_in "Nome", with: @medicamento.nome
    fill_in "Preco", with: @medicamento.preco
    click_on "Create Medicamento"

    assert_text "Medicamento was successfully created"
    click_on "Back"
  end

  test "should update Medicamento" do
    visit medicamento_url(@medicamento)
    click_on "Edit this medicamento", match: :first

    fill_in "Estoque", with: @medicamento.estoque
    fill_in "Nome", with: @medicamento.nome
    fill_in "Preco", with: @medicamento.preco
    click_on "Update Medicamento"

    assert_text "Medicamento was successfully updated"
    click_on "Back"
  end

  test "should destroy Medicamento" do
    visit medicamento_url(@medicamento)
    click_on "Destroy this medicamento", match: :first

    assert_text "Medicamento was successfully destroyed"
  end
end
