# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: peersrpc/peers.proto for package 'peersrpc'

require 'grpc'
require_relative 'peers_pb'

module Peersrpc
  module Peers
    # Peers is a service that can be used to get information and interact
    # with the other nodes of the network.
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'peersrpc.Peers'

      # lncli: peers updatenodeannouncement
      # UpdateNodeAnnouncement allows the caller to update the node parameters
      # and broadcasts a new version of the node announcement to its peers.
      rpc :UpdateNodeAnnouncement, ::Peersrpc::NodeAnnouncementUpdateRequest, ::Peersrpc::NodeAnnouncementUpdateResponse
    end

    Stub = Service.rpc_stub_class
  end
end
