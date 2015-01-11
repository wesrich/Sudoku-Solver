describe Spot do
  describe "Known Spot" do
    def setup
      @spot = Spot.new('1')
    end

    it "has a value" do
      assert_equal 1, @spot
    end

    it "is not empty" do
      refute @spot.empty?
    end

    it "has only one possibility" do
      assert_equal ["1"], @spot.possible
    end
  end

  describe "Unknown Spot" do
    def setup
      @spot = Spot.new
    end

    it "does not have a value" do
      assert_equal 0, @spot
    end

    it "is empty" do
      assert @spot.empty?
    end

    it "has all possibilities" do
      assert_equal ("1".."9").to_a, @spot.possible
    end
  end
end
