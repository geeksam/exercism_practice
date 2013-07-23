class Bob
  def hey(message_of_critical_importance)
    if shouty?(message_of_critical_importance)
      "Woah, chill out!"
    else
      "Whatever."
    end
  end

  private

  def shouty?(message)
    message !~ /[a-z]/
  end
end
