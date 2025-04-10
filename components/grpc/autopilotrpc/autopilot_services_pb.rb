# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: autopilotrpc/autopilot.proto for package 'autopilotrpc'

require 'grpc'
require_relative 'autopilot_pb'

module Autopilotrpc
  module Autopilot
    # Autopilot is a service that can be used to get information about the current
    # state of the daemon's autopilot agent, and also supply it with information
    # that can be used when deciding where to open channels.
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'autopilotrpc.Autopilot'

      #
      # Status returns whether the daemon's autopilot agent is active.
      rpc :Status, ::Autopilotrpc::StatusRequest, ::Autopilotrpc::StatusResponse
      #
      # ModifyStatus is used to modify the status of the autopilot agent, like
      # enabling or disabling it.
      rpc :ModifyStatus, ::Autopilotrpc::ModifyStatusRequest, ::Autopilotrpc::ModifyStatusResponse
      #
      # QueryScores queries all available autopilot heuristics, in addition to any
      # active combination of these heruristics, for the scores they would give to
      # the given nodes.
      rpc :QueryScores, ::Autopilotrpc::QueryScoresRequest, ::Autopilotrpc::QueryScoresResponse
      #
      # SetScores attempts to set the scores used by the running autopilot agent,
      # if the external scoring heuristic is enabled.
      rpc :SetScores, ::Autopilotrpc::SetScoresRequest, ::Autopilotrpc::SetScoresResponse
    end

    Stub = Service.rpc_stub_class
  end
end
