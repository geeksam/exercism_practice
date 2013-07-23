class Bob
  def hey(message_of_critical_importance)
    if message_of_critical_importance !~ /[a-z]/
      "Woah, chill out!"
    else
      "Whatever."
    end
  end
end
