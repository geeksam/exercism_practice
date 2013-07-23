class Bob
  def hey(message_of_critical_importance)
    message = message_interpreter.new(message_of_critical_importance)
    case
    when message.silent?
      "Fine. Be that way."
    when message.shouty?
      "Woah, chill out!"
    when message.asking_a_question?
      "Sure."
    else
      "Whatever."
    end
  end

  private

  # Bob appears to be evaluating incoming communiques according to some
  # fairly crude criteria.  Since the field of psychology does not yet
  # appear to have a general solution for dependency injection
  # (methadone notwithstanding), we'll just leave this here for Bob to
  # replace as he matures...
  def message_interpreter
    TeenSpirit
  end
end

class TeenSpirit
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def shouty?
    Moods::Shouty.new(message).well_is_it?
  end

  def asking_a_question?
    Moods::Asky.new(message).well_is_it?
  end

  def silent?
    Moods::Silent.new(message).well_is_it?
  end
end

module Moods
  class Mood
    attr_reader :message
    def initialize(message)
      @message = message
    end
  end

  class Shouty < Mood
    def well_is_it?
      message !~ /[a-z]/
    end
  end

  class Asky < Mood
    def well_is_it?
      message =~ /\?\Z/
    end
  end

  class Silent < Mood
    def well_is_it?
      message.to_s.empty?
    end
  end
end
