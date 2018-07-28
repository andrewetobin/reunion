require_relative 'activity'

class Reunion
  attr_reader :location, :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum do |activity|
      activity.total_activity_cost
    end
  end

  def calculate_total_amounts_owed
    amounts_owed = Hash.new(0)
    @activities.each do |activity|
      activity.participants.each do |participant|
        amounts_owed[participant[0]] += activity.invoice(participant[0])
      end
    end
    return amounts_owed
  end

  def individual_invoice(name)
    "#{name}'s amount owed from the #{@location} reunion is #{calculate_total_amounts_owed[name]}."
  end

end
