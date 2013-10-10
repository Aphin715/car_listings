require 'spec_helper'

describe Manufacturer do


  it { should have_many(:cars).dependent(:destroy) }
  it { should have_valid(:name).when('Ford', 'Chevy') }
  it { should_not have_valid(:name).when('', nil) }

  it { should have_valid(:country).when('USA', 'China') }
  it { should_not have_valid(:country).when('', nil) }
end
