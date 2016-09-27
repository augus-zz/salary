require "salary"

CSV_PATH = "spec/test.csv"

describe Salary::CSVReader do
  let(:csv) { Salary::CSVReader.new(CSV_PATH) }

  describe "Respond to" do
    subject { csv }

    it { should respond_to(:open)}
    it { should respond_to(:all)}

  end

  describe "open csv successfully" do
    subject { csv.open }
    it {should_not eq(nil) }
  end

  describe "all row" do
    subject { csv.all.size }
    it {should eq(3) }
  end
end
