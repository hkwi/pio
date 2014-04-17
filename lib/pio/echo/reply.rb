# encoding: utf-8

require 'pio/echo/format'
require 'pio/echo/message'

module Pio
  # OpenFlow Echo Request and Reply message parser.
  class Echo
    # OpenFlow 1.0 Echo Reply message.
    class Reply < Message
      # Creates an EchoReply OpenFlow message. This message can be
      # used to measure the bandwidth of a controller/switch
      # connection as well as to verify its liveness.
      #
      # @overload initialize()
      #   @example
      #     Pio::Echo::Reply.new
      #
      # @overload initialize(transaction_id)
      #   @example
      #     Pio::Echo::Reply.new(123)
      #   @param [Number] transaction_id
      #     An unsigned 32-bit integer number associated with this
      #     message.
      #
      # @overload initialize(user_options)
      #   @example
      #     Pio::Echo::Reply.new(
      #       transaction_id: transaction_id,
      #       user_data: 'Thu Aug 25 13:09:00 +0900 2011'
      #     )
      #   @param [Hash] user_options The options to create a message with.
      #   @option user_options [Number] :transaction_id
      #   @option user_options [Number] :xid An alias to transaction_id.
      #   @option user_options [String] :user_data
      #     The user data field specified as a String may be a message
      #     timestamp to check latency, various lengths to measure
      #     bandwidth or zero-size(nil) to verify liveness between the
      #     switch and controller.
      def initialize(user_options = {})
        super REPLY, user_options
      end
    end
  end
end