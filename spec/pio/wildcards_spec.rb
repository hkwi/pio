require 'bindata'
require 'pio/match'

describe Pio::Match::Wildcards do
  # This class has wildcards field.
  class WildcardTest < BinData::Record
    wildcards :wildcards
  end

  describe '.new' do
    When(:binary) { WildcardTest.new(wildcards: parameters).to_binary_s }

    context 'with no wildcard' do
      Given(:parameters) { {} }

      Then { binary == ['00000000000000000000000000000000'].pack('B*') }
    end

    context 'with in_port: true' do
      Given(:parameters) { { in_port: true } }

      Then { binary == ['00000000000000000000000000000001'].pack('B*') }
    end

    context 'with nw_src: 0b10101' do
      Given(:parameters) { { nw_src: 0b10101 } }

      Then { binary == ['00000000000000000001010100000000'].pack('B*') }
    end

    context 'with nw_src_all: true' do
      Given(:parameters) { { nw_src_all: true } }

      Then { binary == ['00000000000000000010000000000000'].pack('B*') }
    end

    context 'with nw_dst: 010101' do
      Given(:parameters) { { nw_dst: 0b10101 } }

      Then { binary == ['00000000000001010100000000000000'].pack('B*') }
    end

    context 'with nw_dst_all: true' do
      Given(:parameters) { { nw_dst_all: true } }

      Then { binary == ['00000000000010000000000000000000'].pack('B*') }
    end

    context 'with in_port: false' do
      Given(:parameters) { { in_port: false } }

      Then { binary == ['00000000000000000000000000000000'].pack('B*') }
    end

    context 'with INVALID_FLAG: true' do
      Given(:parameters) { { INVALID_FLAG: true } }

      Then do
        binary == Failure(KeyError, 'key not found: :INVALID_FLAG')
      end
    end
  end

  describe '.read' do
    When(:wildcards) { Pio::Match::Wildcards.read(binary) }

    context 'with all 0' do
      Given(:binary) { ['00000000000000000000000000000000'].pack('B*') }

      Then { wildcards == {} }
    end

    context 'with in_port: true' do
      Given(:binary) { ['00000000000000000000000000000001'].pack('B*') }

      Then { wildcards == { in_port: true } }
    end

    context 'with dl_vlan: true' do
      Given(:binary) { ['00000000000000000000000000000010'].pack('B*') }

      Then { wildcards == { dl_vlan: true } }
    end

    context 'with nw_src: 010101' do
      Given(:binary) { ['00000000000000000001010100000000'].pack('B*') }

      Then { wildcards == { nw_src: 0b10101 } }
    end

    context 'with nw_src: 100000' do
      Given(:binary) { ['00000000000000000010000000000000'].pack('B*') }

      Then { wildcards == { nw_src_all: true } }
    end

    context 'with nw_dst: 010101' do
      Given(:binary) { ['00000000000001010100000000000000'].pack('B*') }

      Then { wildcards == { nw_dst: 0b10101 } }
    end

    context 'with nw_dst: 100000' do
      Given(:binary) { ['00000000000010000000000000000000'].pack('B*') }

      Then { wildcards == { nw_dst_all: true } }
    end

    context 'with in_port: true, nw_src: 010101, nw_tos: true' do
      Given(:binary) { ['00000000001000000001010100000001'].pack('B*') }

      Then { wildcards == { in_port: true, nw_src: 0b10101, nw_tos: true } }
    end
  end
end