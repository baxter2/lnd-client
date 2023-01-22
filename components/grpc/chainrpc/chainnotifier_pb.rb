# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: chainrpc/chainnotifier.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("chainrpc/chainnotifier.proto", :syntax => :proto3) do
    add_message "chainrpc.ConfRequest" do
      optional :txid, :bytes, 1
      optional :script, :bytes, 2
      optional :num_confs, :uint32, 3
      optional :height_hint, :uint32, 4
      optional :include_block, :bool, 5
    end
    add_message "chainrpc.ConfDetails" do
      optional :raw_tx, :bytes, 1
      optional :block_hash, :bytes, 2
      optional :block_height, :uint32, 3
      optional :tx_index, :uint32, 4
      optional :raw_block, :bytes, 5
    end
    add_message "chainrpc.Reorg" do
    end
    add_message "chainrpc.ConfEvent" do
      oneof :event do
        optional :conf, :message, 1, "chainrpc.ConfDetails"
        optional :reorg, :message, 2, "chainrpc.Reorg"
      end
    end
    add_message "chainrpc.Outpoint" do
      optional :hash, :bytes, 1
      optional :index, :uint32, 2
    end
    add_message "chainrpc.SpendRequest" do
      optional :outpoint, :message, 1, "chainrpc.Outpoint"
      optional :script, :bytes, 2
      optional :height_hint, :uint32, 3
    end
    add_message "chainrpc.SpendDetails" do
      optional :spending_outpoint, :message, 1, "chainrpc.Outpoint"
      optional :raw_spending_tx, :bytes, 2
      optional :spending_tx_hash, :bytes, 3
      optional :spending_input_index, :uint32, 4
      optional :spending_height, :uint32, 5
    end
    add_message "chainrpc.SpendEvent" do
      oneof :event do
        optional :spend, :message, 1, "chainrpc.SpendDetails"
        optional :reorg, :message, 2, "chainrpc.Reorg"
      end
    end
    add_message "chainrpc.BlockEpoch" do
      optional :hash, :bytes, 1
      optional :height, :uint32, 2
    end
  end
end

module Chainrpc
  ConfRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("chainrpc.ConfRequest").msgclass
  ConfDetails = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("chainrpc.ConfDetails").msgclass
  Reorg = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("chainrpc.Reorg").msgclass
  ConfEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("chainrpc.ConfEvent").msgclass
  Outpoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("chainrpc.Outpoint").msgclass
  SpendRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("chainrpc.SpendRequest").msgclass
  SpendDetails = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("chainrpc.SpendDetails").msgclass
  SpendEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("chainrpc.SpendEvent").msgclass
  BlockEpoch = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("chainrpc.BlockEpoch").msgclass
end
