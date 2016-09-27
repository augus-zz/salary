require "salary"

describe "salary version" do
  it "Salary version should be '0.0.1'" do
    expect(Salary::Version).to eq("0.0.1")
  end
end
