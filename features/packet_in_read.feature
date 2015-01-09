Feature: Pio::PacketIn.read
  Scenario: packet_in.raw
    Given a packet data file "packet_in.raw"
    When I try to parse the file with "PacketIn" class
    Then it should finish successfully
    And the parsed data have the following field and value:
    | field          |         value |
    | class          | Pio::PacketIn |
    | ofp_version    |             1 |
    | message_type   |            10 |
    | message_length |            78 |
    | transaction_id |             0 |
    | xid            |             0 |
    | buffer_id      |    4294967040 |
    | total_len      |            60 |
    | in_port        |             1 |
    | reason         |      no_match |
    | data.length    |            60 |
