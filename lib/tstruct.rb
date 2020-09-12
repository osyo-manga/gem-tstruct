require "tstruct/version"

def TStruct(sig)
  Module.new {
    sig.each { |name, type|
      define_method(:"#{name}=") { |value|
        raise TypeError unless type === value
        method(:"#{name}=").super_method.call value
      }
    }
  }
end

module TStruct
  def self.new(sig)
    Struct.new(*sig.keys).prepend TStruct(sig)
  end
end
