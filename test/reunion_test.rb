require 'minitest/autorun'
require 'minitest/emoji'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def setup
    @reunion = Reunion.new("Crested Butte")
    @activity_1 = Activity.new("Bowling", 100, 10)
    @activity_2 = Activity.new("Volleyball", 40, 5)
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_a_location
    assert_equal "Crested Butte", @reunion.location
  end

  def test_it_starts_with_no_activities
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_activities
    assert_equal [@activity_1], @reunion.add_activity(@activity_1)
    assert_equal [@activity_1, @activity_2], @reunion.add_activity(@activity_2)
  end

  def test_reunions_total_cost
    @reunion.add_activity(@activity_1)
    @reunion.add_activity(@activity_2)
    assert_equal 140, @reunion.total_cost
  end

  def test_it_can_list_what_people_owe
    @activity_1.add_participants("Jennifer", 65)
    @activity_1.add_participants("Jessica", 15)
    @activity_1.add_participants("Stephanie", 90)
    @activity_1.add_participants("Phillip", 74)
    @activity_2.add_participants("Jennifer", 65)
    @activity_2.add_participants("Jessica", 15)
    @activity_2.add_participants("Stephanie", 90)
    @activity_2.add_participants("Phillip", 74)
    @reunion.add_activity(@activity_1)
    @reunion.add_activity(@activity_2)

    assert_equal ({"Jennifer"=>-80, "Jessica"=>20, "Stephanie"=>-130, "Phillip"=>-98}), @reunion.calculate_total_amounts_owed
    expected = "Jennifer's amount owed from the Crested Butte reunion is -80."
    assert_equal expected, @reunion.individual_invoice("Jennifer")
  end

end
