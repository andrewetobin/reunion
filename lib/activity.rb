class Activity
  attr_reader :activity_name,
              :participants,
              :participant_name,
              :base_cost

  def initialize(name, base_cost = 0)
    @activity_name = name
    @participants = []
    @base_cost = base_cost
  end

  def add_participants(participants)
    @participants = participants
  end

  def participant_cost
    base_cost.to_f / participants.length
  end
end
