require "salary"

ROW = ["qilin", "zou", "60050", "9%", "01 March - 31 March"]

describe Salary::Account do
  let(:me) { Salary::Account.new(*ROW)}
  let(:rule) { Salary::Rule.new() }

  describe :valid? do
    it { me.valid?.should == true }
  end

  describe :rate do
    it { me.rate.should == 0.09 }
  end


  describe :update do
    before {
      me.update { |annual_salary, super_rate|
        rule.run(annual_salary, super_rate)
      }
    }

    it { me.gross_income.should == 5004 }
    it { me.income_tax.should == 922 }
    it { me.net_income.should == 4082 }
    it { me.super.should == 450 }
  end
end
