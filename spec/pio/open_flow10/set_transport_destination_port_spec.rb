require 'pio/open_flow10/set_transport_port'

describe Pio::SetTransportDestinationPort do
  describe '.new' do
    When(:set_transport_destination_port) do
      Pio::SetTransportDestinationPort.new(port_number)
    end

    context 'with 100' do
      When(:port_number) { 100 }

      describe '#port_number' do
        Then { set_transport_destination_port.port_number == 100 }
      end

      describe '#type' do
        Then { set_transport_destination_port.type == 10 }
      end

      describe '#message_length' do
        Then { set_transport_destination_port.message_length == 8 }
      end

      describe '#to_binary' do
        Then { set_transport_destination_port.to_binary.length == 8 }
      end
    end

    context 'with -1' do
      When(:port_number) { -1 }
      Then { set_transport_destination_port == Failure(ArgumentError) }
    end

    context 'with 2**16' do
      When(:port_number) { 2**16 }
      Then { set_transport_destination_port == Failure(ArgumentError) }
    end

    context 'with :INVALID_PORT_NUMBER' do
      When(:port_number) { :INVALID_PORT_NUMBER }
      Then { set_transport_destination_port == Failure(TypeError) }
    end
  end
end
