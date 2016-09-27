module Salary
  class Rule

    def run(annual_salary, super_rate)
      gross_income = (annual_salary/12.0).round
      income_tax = ((3572.0 + (annual_salary - 37000.0) * 0.325)/12.0).round
      net_income = (gross_income - income_tax).round
      _super = (gross_income * super_rate).round
      [ gross_income, income_tax, net_income, _super ]
    end

  end
end
