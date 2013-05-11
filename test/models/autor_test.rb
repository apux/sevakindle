require "test_helper"

describe Autor do
  before do
    @autor = Autor.new nombre: 'aaa bbb'
  end

  it "must be valid" do
    @autor.valid?.must_equal true
  end

  describe '#to_s' do
    it "must respond with the autor's name" do
      @autor.to_s.must_equal 'aaa bbb'
    end
  end
end
