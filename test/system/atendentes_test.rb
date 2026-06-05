require "application_system_test_case"

class AtendentesTest < ApplicationSystemTestCase
  setup do
    @atendente = atendentes(:one)
  end

  test "visiting the index" do
    visit atendentes_url
    assert_selector "h1", text: "Atendentes"
  end

  test "should create atendente" do
    visit atendentes_url
    click_on "New atendente"

    fill_in "Cpf", with: @atendente.cpf
    fill_in "Nome", with: @atendente.nome
    fill_in "Telefone", with: @atendente.telefone
    click_on "Create Atendente"

    assert_text "Atendente was successfully created"
    click_on "Back"
  end

  test "should update Atendente" do
    visit atendente_url(@atendente)
    click_on "Edit this atendente", match: :first

    fill_in "Cpf", with: @atendente.cpf
    fill_in "Nome", with: @atendente.nome
    fill_in "Telefone", with: @atendente.telefone
    click_on "Update Atendente"

    assert_text "Atendente was successfully updated"
    click_on "Back"
  end

  test "should destroy Atendente" do
    visit atendente_url(@atendente)
    click_on "Destroy this atendente", match: :first

    assert_text "Atendente was successfully destroyed"
  end
end
