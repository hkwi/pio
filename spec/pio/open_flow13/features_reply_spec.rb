require 'pio/open_flow13/features_reply'

describe Pio::Features::Reply do
  describe '.new' do
    it_should_behave_like('an OpenFlow message with Datapath ID',
                          Pio::Features::Reply)
  end
end
