module Salary
  class Company
    attr_accessor :data_source, :accounts

    def initialize(data_source)
      @data_source = data_source
    end

    def compute(rule)
      @accounts.each{ |account|
        account.update{ |annual_salary, super_rate|
          rule.run(annual_salary, super_rate)
        }
      }
    end

    def accounts
      @accounts || load!
    end

    def load!
      @accounts = @data_source.all.map{|e| Salary::Account.new(*e) }
    end

    def report
      # puts @accounts
      @accounts.map(&:to_s).join("\n")
    end
  end
end
