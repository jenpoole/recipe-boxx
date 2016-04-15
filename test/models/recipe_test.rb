require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(name: "Chicken Parm", summary: "Best chicken parm recipe ever", description: "Heat oil, add onions,          add tomato sauce, add chicken, cook for 25 minutes")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name should not be longer than 100 characters" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name should not be shorter than 5 characters" do
    @recipe.name = "a" * 4
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "summary should not be longer than 150 characters" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "summary should not be shorter than 10 characters" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description should not be longer than 500 characters" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "description should not be shorter than 20 characters" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
  
end