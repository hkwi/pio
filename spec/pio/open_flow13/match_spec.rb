require 'pio/open_flow13/match'

# rubocop:disable LineLength
describe Pio::OpenFlow13::Match do
  describe '.new' do
    When(:match) { Pio::OpenFlow13::Match.new }
    Then { match.match_fields == [] }
    And { match.class == Pio::OpenFlow13::Match }
    And { match.length == 8 }
    And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
    And { match.match_length == 4 }

    context 'with in_port: 1' do
      When(:match) { Pio::OpenFlow13::Match.new(in_port: 1) }
      Then { match.in_port == 1 }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 16 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 12 }
      And { match.match_fields.size == 1 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::InPort::OXM_FIELD
      end
      And { match.match_fields[0].masked? == false }
      And { match.match_fields[0].oxm_length == 4 }
    end

    context "with ether_source_address: '01:02:03:04:05:06'" do
      When(:match) do
        Pio::OpenFlow13::Match.new(ether_source_address: '01:02:03:04:05:06')
      end
      Then { match.ether_source_address == '01:02:03:04:05:06' }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 16 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 14 }
      And { match.match_fields.size == 1 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::EtherSourceAddress::OXM_FIELD
      end
      And { match.match_fields[0].masked? == false }
      And { match.match_fields[0].oxm_length == 6 }
    end

    context 'with metadata: 1' do
      When(:match) do
        Pio::OpenFlow13::Match.new(metadata: 1)
      end
      Then { match.metadata == 1 }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 16 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 16 }
      And { match.match_fields.size == 1 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::Metadata::OXM_FIELD
      end
      And { match.match_fields[0].masked? == false }
      And { match.match_fields[0].oxm_length == 8 }
    end

    context 'with metadata: 1, metadata_mask: 1' do
      When(:match) do
        Pio::OpenFlow13::Match.new(metadata: 1, metadata_mask: 1)
      end
      Then { match.metadata == 1 }
      Then { match.metadata_mask == 1 }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 24 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 24 }
      And { match.match_fields.size == 1 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::Metadata::OXM_FIELD
      end
      And { match.match_fields[0].masked? == true }
      And { match.match_fields[0].oxm_length == 16 }
    end

    context "with ether_source_address: '01:02:03:04:05:06', ether_source_address_mask: 'ff:ff:ff:00:00:00'" do
      When(:match) do
        Pio::OpenFlow13::Match.new(ether_source_address: '01:02:03:04:05:06',
                                   ether_source_address_mask: 'ff:ff:ff:00:00:00')
      end
      Then { match.ether_source_address == '01:02:03:04:05:06' }
      Then { match.ether_source_address_mask == 'ff:ff:ff:00:00:00' }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 24 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 20 }
      And { match.match_fields.size == 1 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::EtherSourceAddress::OXM_FIELD
      end
      And { match.match_fields[0].masked? == true }
      And { match.match_fields[0].oxm_length == 12 }
    end

    context 'with ether_type: 0x0800' do
      When(:match) { Pio::OpenFlow13::Match.new(ether_type: 0x0800) }
      Then { match.ether_type == 0x0800 }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 16 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 10 }
      And { match.match_fields.size == 1 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::EtherType::OXM_FIELD
      end
      And { match.match_fields[0].masked? == false }
      And { match.match_fields[0].oxm_length == 2 }
    end

    context "with ether_type: 0x0800, ipv4_source_address: '1.2.3.4'" do
      When(:match) do
        Pio::OpenFlow13::Match.new(ether_type: 0x0800,
                                   ipv4_source_address: '1.2.3.4')
      end
      Then { match.ether_type == 0x0800 }
      Then { match.ipv4_source_address == '1.2.3.4' }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 24 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 18 }
      And { match.match_fields.size == 2 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::EtherType::OXM_FIELD
      end
      And { match.match_fields[0].masked? == false }
      And { match.match_fields[0].oxm_length == 2 }
      And do
        match.match_fields[1].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[1].oxm_field ==
          Pio::OpenFlow13::Match::Ipv4SourceAddress::OXM_FIELD
      end
      And { match.match_fields[1].masked? == false }
      And { match.match_fields[1].oxm_length == 4 }
    end

    context "with ether_type: 0x0800, ipv4_destination_address: '1.2.3.4'" do
      When(:match) do
        Pio::OpenFlow13::Match.new(ether_type: 0x0800,
                                   ipv4_destination_address: '1.2.3.4')
      end
      Then { match.ether_type == 0x0800 }
      Then { match.ipv4_destination_address == '1.2.3.4' }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 24 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 18 }
      And { match.match_fields.size == 2 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::EtherType::OXM_FIELD
      end
      And { match.match_fields[0].masked? == false }
      And { match.match_fields[0].oxm_length == 2 }
      And do
        match.match_fields[1].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[1].oxm_field ==
          Pio::OpenFlow13::Match::Ipv4DestinationAddress::OXM_FIELD
      end
      And { match.match_fields[1].masked? == false }
      And { match.match_fields[1].oxm_length == 4 }
    end
  end

  def read_raw_data_file(name)
    IO.read File.join(__dir__, '..', '..', '..', name)
  end

  describe '.read' do
    When(:match) { Pio::OpenFlow13::Match.read(raw_data) }

    context 'with file "features/open_flow13/oxm_no_fields.raw"' do
      Given(:raw_data) do
        read_raw_data_file 'features/open_flow13/oxm_no_fields.raw'
      end
      Then { match.match_fields == [] }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 8 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 4 }
    end

    context 'with file "features/open_flow13/oxm_in_port_field.raw"' do
      Given(:raw_data) do
        read_raw_data_file 'features/open_flow13/oxm_in_port_field.raw'
      end
      Then { match.in_port == 1 }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 16 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 12 }
      And { match.match_fields.size == 1 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::InPort::OXM_FIELD
      end
      And { match.match_fields[0].masked? == false }
      And { match.match_fields[0].oxm_length == 4 }
    end

    context 'with file "features/open_flow13/oxm_ether_destination_field.raw"' do
      Given(:raw_data) do
        read_raw_data_file 'features/open_flow13/oxm_ether_destination_field.raw'
      end
      Then { match.ether_destination_address == 'ff:ff:ff:ff:ff:ff' }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 16 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 14 }
      And { match.match_fields.size == 1 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::EtherDestinationAddress::OXM_FIELD
      end
      And { match.match_fields[0].masked? == false }
      And { match.match_fields[0].oxm_length == 6 }
    end

    context 'with file "features/open_flow13/oxm_ether_source_field.raw"' do
      Given(:raw_data) do
        read_raw_data_file 'features/open_flow13/oxm_ether_source_field.raw'
      end
      Then { match.ether_source_address == '01:02:03:04:05:06' }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 16 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 14 }
      And { match.match_fields.size == 1 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::EtherSourceAddress::OXM_FIELD
      end
      And { match.match_fields[0].masked? == false }
      And { match.match_fields[0].oxm_length == 6 }
    end

    context 'with file "features/open_flow13/oxm_masked_ether_destination_field.raw"' do
      Given(:raw_data) do
        read_raw_data_file 'features/open_flow13/oxm_masked_ether_destination_field.raw'
      end
      Then { match.ether_destination_address == 'ff:ff:ff:ff:ff:ff' }
      Then { match.ether_destination_address_mask == 'ff:ff:ff:00:00:00' }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 24 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 20 }
      And { match.match_fields.size == 1 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::EtherDestinationAddress::OXM_FIELD
      end
      And { match.match_fields[0].masked? == true }
      And { match.match_fields[0].oxm_length == 12 }
    end

    context 'with file "features/open_flow13/oxm_masked_ether_source_field.raw"' do
      Given(:raw_data) do
        read_raw_data_file 'features/open_flow13/oxm_masked_ether_source_field.raw'
      end
      Then { match.ether_source_address == '01:02:03:04:05:06' }
      Then { match.ether_source_address_mask == 'ff:ff:ff:00:00:00' }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 24 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 20 }
      And { match.match_fields.size == 1 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::EtherSourceAddress::OXM_FIELD
      end
      And { match.match_fields[0].masked? == true }
      And { match.match_fields[0].oxm_length == 12 }
    end

    context 'with file "features/open_flow13/oxm_ether_type_field.raw"' do
      Given(:raw_data) do
        read_raw_data_file 'features/open_flow13/oxm_ether_type_field.raw'
      end
      Then { match.ether_type == 0 }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 16 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 10 }
      And { match.match_fields.size == 1 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::EtherType::OXM_FIELD
      end
      And { match.match_fields[0].masked? == false }
      And { match.match_fields[0].oxm_length == 2 }
    end

    context 'with file "features/open_flow13/oxm_ipv4_source_field.raw"' do
      Given(:raw_data) do
        read_raw_data_file 'features/open_flow13/oxm_ipv4_source_field.raw'
      end
      Then { match.ether_type == 0x0800 }
      Then { match.ipv4_source_address == '1.2.3.4' }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 24 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 18 }
      And { match.match_fields.size == 2 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::EtherType::OXM_FIELD
      end
      And { match.match_fields[0].masked? == false }
      And { match.match_fields[0].oxm_length == 2 }
      And do
        match.match_fields[1].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[1].oxm_field ==
          Pio::OpenFlow13::Match::Ipv4SourceAddress::OXM_FIELD
      end
      And { match.match_fields[1].masked? == false }
      And { match.match_fields[1].oxm_length == 4 }
    end

    context 'with file "features/open_flow13/oxm_ipv4_destination_field.raw"' do
      Given(:raw_data) do
        read_raw_data_file 'features/open_flow13/oxm_ipv4_destination_field.raw'
      end
      Then { match.ether_type == 0x0800 }
      Then { match.ipv4_destination_address == '11.22.33.44' }
      And { match.class == Pio::OpenFlow13::Match }
      And { match.length == 24 }
      And { match.match_type == Pio::OpenFlow13::MATCH_TYPE_OXM }
      And { match.match_length == 18 }
      And { match.match_fields.size == 2 }
      And do
        match.match_fields[0].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[0].oxm_field ==
          Pio::OpenFlow13::Match::EtherType::OXM_FIELD
      end
      And { match.match_fields[0].masked? == false }
      And { match.match_fields[0].oxm_length == 2 }
      And do
        match.match_fields[1].oxm_class ==
          Pio::OpenFlow13::Match::OXM_CLASS_OPENFLOW_BASIC
      end
      And do
        match.match_fields[1].oxm_field ==
          Pio::OpenFlow13::Match::Ipv4DestinationAddress::OXM_FIELD
      end
      And { match.match_fields[1].masked? == false }
      And { match.match_fields[1].oxm_length == 4 }
    end
  end
end
# rubocop:enable LineLength