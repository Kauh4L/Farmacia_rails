require "test_helper"

class MedicamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medicamento = medicamentos(:one)
  end

  test "should get index" do
    get medicamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_medicamento_url
    assert_response :success
  end

  test "should create medicamento" do
    assert_difference("Medicamento.count") do
      post medicamentos_url, params: { medicamento: { estoque: @medicamento.estoque, nome: @medicamento.nome, preco: @medicamento.preco } }
    end

    assert_redirected_to medicamento_url(Medicamento.last)
  end

  test "should show medicamento" do
    get medicamento_url(@medicamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_medicamento_url(@medicamento)
    assert_response :success
  end

  test "should update medicamento" do
    patch medicamento_url(@medicamento), params: { medicamento: { estoque: @medicamento.estoque, nome: @medicamento.nome, preco: @medicamento.preco } }
    assert_redirected_to medicamento_url(@medicamento)
  end

  test "should destroy medicamento" do
    assert_difference("Medicamento.count", -1) do
      delete medicamento_url(@medicamento)
    end

    assert_redirected_to medicamentos_url
  end
end
