require 'spec_helper'

describe Car do

  it { should belong_to(:manufacturer)}

  it { should have_valid(:color).when('red', 'blue') }
  it { should_not have_valid(:color).when('', nil) }

  it { should have_valid(:year).when(1980, 2013) }
  it { should_not have_valid(:year).when('', nil, 1979, 2015) }

  it { should have_valid(:mileage).when(1, 0, 100000, 40000) }
  it { should_not have_valid(:mileage).when('', nil, '-1',) }



end
