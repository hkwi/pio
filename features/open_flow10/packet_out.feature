Feature: Pio::PacketOut
  Scenario: read
    When I try to parse a file named "open_flow10/packet_out.raw" with "PacketOut" class
    Then it should finish successfully
    And the message have the following fields and values:
    | field                     |            value |
    | class                     |   Pio::PacketOut |
    | ofp_version               |                1 |
    | message_type              |               13 |
    | message_length            |               88 |
    | transaction_id            |               22 |
    | xid                       |               22 |
    | buffer_id                 |       4294967295 |
    | in_port                   |            65535 |
    | actions.length            |                1 |
    | actions.first.class       | Pio::SendOutPort |
    | actions.first.port_number |                2 |
    | actions.first.max_len     |            65535 |
    | raw_data.length           |               64 |
