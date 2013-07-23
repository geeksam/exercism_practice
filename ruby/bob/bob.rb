class Bob
  def hey(message_of_critical_importance)
    case
    when silent?(message_of_critical_importance)
      "Fine. Be that way."
    when shouty?(message_of_critical_importance)
      "Woah, chill out!"
    when asking_a_question?(message_of_critical_importance)
      "Sure."
    else
      "Whatever."
    end
  end

  private

  def shouty?(message)
    message !~ /[a-z]/
  end

  def asking_a_question?(message)
    message =~ /\?\Z/
  end

  def silent?(message)
    message.to_s.empty?
  end
end
