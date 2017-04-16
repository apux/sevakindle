require "test_helper"

describe CuentosController do
  it "should get index" do
    get cuentos_path
    assert_response :success
  end

end
