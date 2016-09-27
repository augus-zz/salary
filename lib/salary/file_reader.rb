module Salary
  class FileReader
    attr_accessor :path

    def initialize(path)
      @path = path
    end

    def all()
      raise "abstract method class could'nt be called".freeze
    end

    def open()
      raise "abstract method class could'nt be called".freeze
    end

  end
end
