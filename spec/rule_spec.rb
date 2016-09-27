require "salary"

describe Salary::Rule do
  let(:rule) { Salary::Rule.new() }
  describe "run" do
    it { expect(rule.run(60050, 0.09)).to eq([5004, 922, 4082, 450]) }
  end
end
