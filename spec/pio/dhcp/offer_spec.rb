require 'pio'

describe Pio::DHCP::Offer do
  Pio::DHCP::Offer == Pio::Dhcp::Offer
end

describe Pio::Dhcp::Offer, '.new' do
  context 'with optional options' do
    subject do
      Pio::Dhcp::Offer.new(
        source_mac: source_mac,
        destination_mac: destination_mac,
        ip_source_address: ip_source_address,
        ip_destination_address: ip_destination_address,
        transaction_id: 0xdeadbeef,
        renewal_time_value: 0xdeadbeef,
        rebinding_time_value: 0xdeadbeef,
        ip_address_lease_time: 0xdeadbeef,
        subnet_mask: subnet_mask
      )
    end

    dhcp_offer_dump =
      [
        # Destination MAC Address
        0x11, 0x22, 0x33, 0x44, 0x55, 0x66,
        # Source MAC Address
        0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
        # Ethernet Type
        0x08, 0x00,
        # IP version and IP Header Length
        0x45,
        # DSCP
        0x00,
        # IP Total Length
        0x01, 0x48,
        # IP Identifier
        0x00, 0x00,
        # IP Flags and IP Fragmentation
        0x00, 0x00,
        # IP TTL
        0x80,
        # IP Protocol
        0x11,
        # IP Header Checksum
        0xb8, 0x49,
        # IP Source Address
        0xc0, 0xa8, 0x00, 0x0a,
        # IP Destination Address
        0xc0, 0xa8, 0x00, 0x01,
        # UDP Source Port
        0x00, 0x43,
        # UDP Destination Port
        0x00, 0x44,
        # UDP Total Length
        0x01, 0x34,
        # UDP Header Checksum
        0x1e, 0x64,
        # Bootp Msg Type
        0x02,
        # Hw Type
        0x01,
        # Hw Address Length
        0x06,
        # Hops
        0x00,
        # Transaction ID
        0xde, 0xad, 0xbe, 0xef,
        # Seconds
        0x00, 0x00,
        # Bootp Flags
        0x00, 0x00,
        # Client IP Address
        0x00, 0x00, 0x00, 0x00,
        # Your IP Address
        0xc0, 0xa8, 0x00, 0x01,
        # Next Server IP Address
        0x00, 0x00, 0x00, 0x00,
        # Relay Agent IP Address
        0x00, 0x00, 0x00, 0x00,
        # Client MAC Address
        0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
        # Client Hw Address Padding
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        # Server Host Name
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        # Boot File Name
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        # Magic Cookie
        0x63, 0x82, 0x53, 0x63,
        # DHCP Msg Type
        0x35, 0x01, 0x02,
        # Renewal Time Value
        0x3a, 0x04, 0xde, 0xad, 0xbe, 0xef,
        # Rebinding Time Value
        0x3b, 0x04, 0xde, 0xad, 0xbe, 0xef,
        # IP Address Lease Time Value
        0x33, 0x04, 0xde, 0xad, 0xbe, 0xef,
        # DHCP Server Identifier
        0x36, 0x04, 0xc0, 0xa8, 0x00, 0x0a,
        # Subnet Mask
        0x01, 0x04, 0xff, 0xff, 0xff, 0x00,
        # End Option
        0xff,
        # Padding Field
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00
      ]

    context 'with Pio::MAC Address and Pio::IPv4Address Address' do
      let(:source_mac) { Pio::Mac.new('aa:bb:cc:dd:ee:ff') }
      let(:destination_mac) { Pio::Mac.new('11:22:33:44:55:66') }
      let(:ip_source_address) { Pio::IPv4Address.new('192.168.0.10') }
      let(:ip_destination_address) { Pio::IPv4Address.new('192.168.0.1') }
      let(:subnet_mask) { Pio::IPv4Address.new('255.255.255.0') }

      context '#to_binary' do
        it 'returns a DHCP ack binary string' do
          expect(subject.to_binary.unpack('C*')).to eq dhcp_offer_dump
        end

        it 'returns a valid ether frame with size = 342' do
          expect(subject.to_binary.size).to eq 342
        end
      end
    end

    context 'with String MAC Address' do
      let(:source_mac) { 'aa:bb:cc:dd:ee:ff' }
      let(:destination_mac) { '11:22:33:44:55:66' }
      let(:ip_source_address) { '192.168.0.10' }
      let(:ip_destination_address) { '192.168.0.1' }
      let(:subnet_mask) { '255.255.255.0' }

      context '#to_binary' do
        it 'returns a DHCP ack binary string' do
          expect(subject.to_binary.unpack('C*')).to eq dhcp_offer_dump
        end

        it 'returns a valid ether frame with size = 342' do
          expect(subject.to_binary.size).to eq 342
        end
      end
    end
  end

  context 'without optional options' do
    subject do
      Pio::Dhcp::Offer.new(
        source_mac: 'aa:bb:cc:dd:ee:ff',
        destination_mac: '11:22:33:44:55:66',
        ip_source_address: '192.168.0.10',
        ip_destination_address: '192.168.0.1'
      )
    end

    describe '#to_binary' do
      it 'returns a valid ether frame with size = 342' do
        expect(subject.to_binary.size).to eq 342
      end
    end
  end
end
