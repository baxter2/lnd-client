# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: neutrinorpc/neutrino.proto for package 'neutrinorpc'

require 'grpc'
require_relative './neutrino_pb'

module Neutrinorpc
  module NeutrinoKit
    # NeutrinoKit is a service that can be used to get information about the
    # current state of the neutrino instance, fetch blocks and add/remove peers.
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'neutrinorpc.NeutrinoKit'

      #
      # Status returns the status of the light client neutrino instance,
      # along with height and hash of the best block, and a list of connected
      # peers.
      rpc :Status, ::Neutrinorpc::StatusRequest, ::Neutrinorpc::StatusResponse
      #
      # AddPeer adds a new peer that has already been connected to the server.
      rpc :AddPeer, ::Neutrinorpc::AddPeerRequest, ::Neutrinorpc::AddPeerResponse
      #
      # DisconnectPeer disconnects a peer by target address. Both outbound and
      # inbound nodes will be searched for the target node. An error message will
      # be returned if the peer was not found.
      rpc :DisconnectPeer, ::Neutrinorpc::DisconnectPeerRequest, ::Neutrinorpc::DisconnectPeerResponse
      #
      # IsBanned returns true if the peer is banned, otherwise false.
      rpc :IsBanned, ::Neutrinorpc::IsBannedRequest, ::Neutrinorpc::IsBannedResponse
      #
      # GetBlockHeader returns a block header with a particular block hash.
      rpc :GetBlockHeader, ::Neutrinorpc::GetBlockHeaderRequest, ::Neutrinorpc::GetBlockHeaderResponse
      #
      # GetBlock returns a block with a particular block hash.
      rpc :GetBlock, ::Neutrinorpc::GetBlockRequest, ::Neutrinorpc::GetBlockResponse
      #
      # GetCFilter returns a compact filter from a block.
      rpc :GetCFilter, ::Neutrinorpc::GetCFilterRequest, ::Neutrinorpc::GetCFilterResponse
      #
      # GetBlockHash returns the header hash of a block at a given height.
      rpc :GetBlockHash, ::Neutrinorpc::GetBlockHashRequest, ::Neutrinorpc::GetBlockHashResponse
    end

    Stub = Service.rpc_stub_class
  end
end
