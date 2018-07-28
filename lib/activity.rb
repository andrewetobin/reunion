class Activity
  attr_reader :name, :participants, :base_cost

  def initialize(name, base_cost, per_person)
    @name = name
    @base_cost = base_cost
    @per_person_cost = per_person
    @participants = {}
  end

  def add_participants(participant, paid = 0)
    @participants[participant] = paid
  end

  def total_activity_cost
    base_cost + (participants.count) * @per_person_cost
  end

  def participant_share
    total_activity_cost / @participants.count
  end

  def invoice(invoiced)
    invoice = participant_share - @participants[invoiced]
  end

end
