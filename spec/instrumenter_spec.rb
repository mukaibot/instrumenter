require "spec_helper"

RSpec.describe Instrumenter do
  it "has a version number" do
    expect(Instrumenter::VERSION).not_to be nil
  end

  it "has a request id" do
    expect(Instrumenter.instance.request_id).not_to be nil
  end
end
