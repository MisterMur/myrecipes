require 'test_helper'

class ChefTest < ActiveSupport::TestCase
    def setup
        @chef = Chef.new(chefname: "Brian",email: "brian@me.com")

    end
    test "should be valid" do
        assert @chef.valid?
    end
    test "name should be present" do
        @chef.chefname = " "
        assert_not @chef.valid?
    end

    test "name should be less than 30 characters" do
        @chef.chefname = "a" * 31
        assert_not @chef.valid?
    end

    test "email should be present" do 
        @chef.email = " "
        assert_not @chef.valid?
    end
    test "emial shouldnt be long" do
        @chef.email = "a" *245 +"example.com"
        assert_not @chef.valid?
    end

    test "email should be unique" do
        duplicate_chef = @chef.dup
        duplicate_chef.email = @chef.email.upcase
        @chef.save
        assert_not duplicate_chef.valid?
    end

    test "email should be lowercase before hitting db" do
        mixed_email="John@Example.com"
        @chef.email = mixed_email
        @chef.save
        assert_equal mixed_email.downcase,@chef.reload.email
    end


end