require "sensu/json"

describe "Sensu::JSON" do
  it "can load a parser for the current platform" do
    Sensu::JSON.setup!
    hash = Sensu::JSON.load('{"foo":"bar"}')
    expect(hash).to eq({:foo => "bar"})
    string = Sensu::JSON.dump({:baz => "qux"})
    expect(string).to eq('{"baz":"qux"}')
  end
end
