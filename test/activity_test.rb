require 'minitest/autorun'
require 'minitest/emoji'
require './lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @activity_1 = Activity.new("Bowling", 100, 10)
    @activity_2 = Activity.new("Volleyball", 40, 5)
    # @participant_1 = ("Jennifer", 65)
    # @participant_2 = ("Phillip", 15)
  end

  def test_it_exists
    assert_instance_of Activity, @activity_1
  end

  def test_it_has_a_name
    assert_equal "Bowling", @activity_1.name
  end

  def test_it_starts_with_no_participants
    assert_equal ({}), @activity_1.participants
  end

  def test_it_can_add_participants
    @activity_1.add_participants("Jennifer", 65)
    assert_equal ({"Jennifer"=>65}), @activity_1.participants
  end

  def test_it_can_calculate_total_activity_cost
    @activity_1.add_participants("Jennifer", 65)
    @activity_1.add_participants("Phillip", 15)
    assert_equal 120, @activity_1.total_activity_cost
  end

  def test_it_can_calculate_each_persons_share
    @activity_1.add_participants("Jennifer", 65)
    @activity_1.add_participants("Phillip", 15)
    assert_equal 60, @activity_1.participant_share
  end

  def test_it_can_invoice_people
    @activity_1.add_participants("Jennifer", 65)
    @activity_1.add_participants("Phillip", 15)
    assert_equal -5, @activity_1.invoice("Jennifer")
    assert_equal 45, @activity_1.invoice("Phillip")
  end


end
