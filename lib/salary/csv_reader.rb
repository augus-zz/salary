require "csv"

module Salary
  class CSVReader < FileReader

    def all()
      open.to_a
    end

    def open()
      CSV.open(@path)
    end

  end
end
