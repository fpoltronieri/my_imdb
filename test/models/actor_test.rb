require "test_helper"

describe Actor do
  let(:actor) { Actor.new }

  it "must be valid" do
    value(actor).must_be :valid?
  end
end
