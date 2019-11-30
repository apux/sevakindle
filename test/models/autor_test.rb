require "test_helper"

describe Autor do
  before do
    @autor = Autor.new nombre: 'aaa bbb'
  end

  it "must be valid" do
    _(@autor.valid?).must_equal true
  end

  describe '#to_s' do
    it "must respond with the autor's name" do
      _(@autor.to_s).must_equal 'aaa bbb'
    end
  end
end
