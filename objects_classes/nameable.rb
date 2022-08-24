class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    # corrected_name = @nameable.correct_name
    # corrected_name = corrected_name[0..9] if corrected_name.size > 10
    # corrected_name
    super[0..9]  if super.size > 10
  end
end

# Compare this snippet from objects_classes\nameable.rb:
# class Nameable
#   def correct_name
#     raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
#   end
# end
#
# class Decorator < Nameable
#   def initialize(nameable)
#     @nameable = nameable
#   end
#
#   def correct_name
#     @nameable.correct_name
#   end
# end
