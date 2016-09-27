module Salary
  class Account
    attr_accessor :first_name, :last_name, :annual_salary, :gross_income, :income_tax, :net_income, :super_rate, :super, :pay_period

    def initialize(*args)
      @first_name, @last_name, @annual_salary, @super_rate, @pay_period = args
      @annual_salary = @annual_salary.to_i
      @super_rate = @super_rate
    end

    def valid?
      !(@first_name.nil? || @first_name.empty? || @last_name.nil? || @last_name.empty? || @annual_salary < 0 || rate < 0.0 || rate > 0.50 || !@pay_period =~ /\d{1,2}\s* (.*?)\s*-\s*\d{1,2}\s*\1/ )
    end

    def update(&block)
      @gross_income, @income_tax, @net_income, @super = block.call(@annual_salary, rate)
    end

    def rate
      @rate ||= (@super_rate.to_f/100.0)
    end

    def inspect
      "<class Account>{@first_name=>#{@first_name},@last_name:#{@last_name},@annual_salary=>#{@annual_salary},@gross_income=>#{@gross_income},@income_tax:#{@income_tax},@net_income:#{@net_income},@super_rate:#{@super_rate},@super:#{@rate},@pay_period:#{@pay_period}}"
    end

    def to_s
      "#{@first_name} #{@last_name},#{@pay_period},#{@gross_income},#{@income_tax},#{@net_income},#{@super}"
    end
  end
end
