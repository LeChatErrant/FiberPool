module Async
  def await(promise : Promise)
  end

  private abstract class Promise
    abstract def initialize
    abstract def then
    abstract def catch
    abstract def resolve
    abstract def reject
  end
end
