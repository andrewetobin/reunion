require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity_1 = "kickball"
    activity = Activity.new(activity_1)

    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity_1 = "kickball"
    activity = Activity.new(activity_1)

    assert_equal "kickball", activity.activity_name
  end

  def test_activity_starts_with_no_participants
    activity_1 = "kickball"
    activity = Activity.new(activity_1)

    assert_equal [], activity.participants

  end

  def test_it_has_a_participant
    participant_1 = {"Heather"=> 5}
    activity_1 = "kickball"
    activity = Activity.new(activity_1)

    assert_equal 1, activity.add_participants(participant_1).length
  end

  def test_activity_has_a_base_cost
    participant_1 = {"Heather"=> 5}
    activity_1 = "kickball"
    activity = Activity.new(activity_1, 300)

    assert_equal 300, activity.base_cost
  end

  def test_it_has_price_per_person
    participants = {"Heather"=> 5}, {"Felix"=> 43}, {"Bob"=> 23}
    activity_1 = "kickball"
    activity = Activity.new(activity_1, 300)
    activity.add_participants(participants)

    assert_equal 100, activity.participant_cost
  end
end
