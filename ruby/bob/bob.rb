class Bob
  def hey(message_of_critical_importance)
    message = message_interpreter.new(message_of_critical_importance)
    message.interpret(self)
  end

  def message_silent
    "Fine. Be that way."
  end

  def message_shouty
    "Woah, chill out!"
  end

  def message_interrogative
    "Sure."
  end

  def message_not_understood
    "Whatever."
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

  def interpret(receiver)
    case
    when silent?
      receiver.message_silent
    when shouty?
      receiver.message_shouty
    when asking_a_question?
      receiver.message_interrogative
    else
      receiver.message_not_understood
    end
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
