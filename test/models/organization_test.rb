require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase

  def setup
    @organization = Organization.new(name: "Hideaway Pizza", address1: "1601 South Boston", address2:"", city: "Tulsa", state: "OK", zip: "74133", phone: "918-627-7447", url: "http://www.hideawaypizza.com", active: true)
  end

  test "should be valid" do
    assert @organization.valid?
  end

  test "name should be present" do
    @organization.name = " "
    assert_not @organization.valid?
  end

  test "name should not be too long" do
    @organization.name = "a" * 76
    assert_not @organization.valid?
  end

  test "name should be unique" do
    duplicate_org = @organization.dup
    duplicate_org.name = @organization.name.upcase
    @organization.save
    assert_not duplicate_org.valid?
  end
  
  test "address1 should be present" do
    @organization.address1 = " "
    assert_not @organization.valid?
  end

  test "address1 should not be too long" do
    @organization.address1 = "a" * 176
    assert_not @organization.valid?
  end

  test "city should be present" do
    @organization.city = " "
    assert_not @organization.valid?
  end

  test "city should not be too long" do
    @organization.city = "a" * 76
    assert_not @organization.valid?
  end

  test "state should be present" do
    @organization.state = " "
    assert_not @organization.valid?
  end

  test "state should not be too long" do
    @organization.state = "a" * 3
    assert_not @organization.valid?
  end

  test "url should not be too long" do
    @organization.url = "a" * 256
    assert_not @organization.valid?
  end

  test "url validation should accept valid addresses" do
    invalid_addresses = %w[httpx://www.good.com. ww.good.com, www,good.com, www.good.col, www.good, good]

    invalid_addresses.each do |invalid_address|
      @organization.url = invalid_address
      assert_not @organization.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "phone should be present" do
    @organization.phone = " "
    assert_not @organization.valid?
  end

  test "phone should not be too long" do
    @organization.phone = "a" * 13
    assert_not @organization.valid?
  end
end
