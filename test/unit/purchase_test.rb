require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  test "should ensure an amount" do
    attrs = { description: "Empty amount",
              amount: nil }
    purchase = Purchase.new(attrs)
    assert !purchase.valid?
  end

  test "assertions" do
    assert true
    assert 1 == 1
    assert 1 != 2
    assert_equal 1, 1
    assert_equal "hi mom",
                 ['hi', 'mom'].join(" ")
    assert_raises RuntimeError do
      raise "omg!"
    end
    data = "hi"
    assert_difference "data.size", 4 do
      data += " mom"
    end
  end
end
