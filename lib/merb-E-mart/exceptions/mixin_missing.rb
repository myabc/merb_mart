class MixinMissing < Exception
  attr_accessor :klass, :method, :responsibility

  def initialize(klass, method, responsibility)
    @klass, @method, @responsibility = klass, method, responsibility
  end
end