# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: verrpc/verrpc.proto for package 'verrpc'

require 'grpc'
require_relative 'verrpc/verrpc_pb'

module Verrpc
  module Versioner
    # Versioner is a service that can be used to get information about the version
    # and build information of the running daemon.
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'verrpc.Versioner'

      # lncli: `version`
      # GetVersion returns the current version and build information of the running
      # daemon.
      rpc :GetVersion, ::Verrpc::VersionRequest, ::Verrpc::Version
    end

    Stub = Service.rpc_stub_class
  end
end
