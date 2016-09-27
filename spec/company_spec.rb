require "salary"

DATA_PATH = "spec/test.csv"

describe Salary::Company do
  let(:rule) { Salary::Rule.new() }
  let(:cvs) { Salary::CSVReader.new(DATA_PATH) }
  let(:company) { Salary::Company.new(cvs) }

  describe :accounts do
    # subject { company.accounts }
    it { company.accounts.should be_kind_of Array }
    it { company.accounts.size.should eq(3) }
    it { company.accounts.first.first_name.should == "qilin"}
    it { company.accounts.last.first_name.should == "d"}
  end

  describe :report do
    before {
      company.load!
      company.compute(rule)
    }

    it { company.report.should == "qilin zou,01 March - 31 March,4167,650,3517,375\nfangyu long,01 March - 31 March,5017,926,4091,401\nd ,01 March - 31 March,6103,1279,4824,610" }

    let(:me) { company.accounts.first }
    it { me.gross_income.should == 4167 }
    it { me.income_tax.should == 650 }
    it { me.net_income.should == 3517 }
    it { me.super.should == 375 }
  end
end
