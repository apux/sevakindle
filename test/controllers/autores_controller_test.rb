require "test_helper"

describe AutoresController do

  before do
    @autor = autores(:one)
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:autores)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create autor" do
    assert_difference('Autor.count') do
      post :create, autor: {  }
    end

    assert_redirected_to autor_path(assigns(:autor))
  end

  it "must show autor" do
    get :show, id: @autor
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @autor
    assert_response :success
  end

  it "must update autor" do
    put :update, id: @autor, autor: {  }
    assert_redirected_to autor_path(assigns(:autor))
  end

  it "must destroy autor" do
    assert_difference('Autor.count', -1) do
      delete :destroy, id: @autor
    end

    assert_redirected_to autores_path
  end

end
