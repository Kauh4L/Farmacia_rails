require "test_helper"

class AtendentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atendente = atendentes(:one)
  end

  test "should get index" do
    get atendentes_url
    assert_response :success
  end

  test "should get new" do
    get new_atendente_url
    assert_response :success
  end

  test "should create atendente" do
    assert_difference("Atendente.count") do
      post atendentes_url, params: { atendente: { cpf: @atendente.cpf, nome: @atendente.nome, telefone: @atendente.telefone } }
    end

    assert_redirected_to atendente_url(Atendente.last)
  end

  test "should show atendente" do
    get atendente_url(@atendente)
    assert_response :success
  end

  test "should get edit" do
    get edit_atendente_url(@atendente)
    assert_response :success
  end

  test "should update atendente" do
    patch atendente_url(@atendente), params: { atendente: { cpf: @atendente.cpf, nome: @atendente.nome, telefone: @atendente.telefone } }
    assert_redirected_to atendente_url(@atendente)
  end

  test "should destroy atendente" do
    assert_difference("Atendente.count", -1) do
      delete atendente_url(@atendente)
    end

    assert_redirected_to atendentes_url
  end
end
