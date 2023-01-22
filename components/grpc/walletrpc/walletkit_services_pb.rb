# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: walletrpc/walletkit.proto for package 'walletrpc'

require 'grpc'
require_relative 'walletrpc/walletkit_pb'

module Walletrpc
  module WalletKit
    # WalletKit is a service that gives access to the core functionalities of the
    # daemon's wallet.
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'walletrpc.WalletKit'

      #
      # ListUnspent returns a list of all utxos spendable by the wallet with a
      # number of confirmations between the specified minimum and maximum. By
      # default, all utxos are listed. To list only the unconfirmed utxos, set
      # the unconfirmed_only to true.
      rpc :ListUnspent, ::Walletrpc::ListUnspentRequest, ::Walletrpc::ListUnspentResponse
      #
      # LeaseOutput locks an output to the given ID, preventing it from being
      # available for any future coin selection attempts. The absolute time of the
      # lock's expiration is returned. The expiration of the lock can be extended by
      # successive invocations of this RPC. Outputs can be unlocked before their
      # expiration through `ReleaseOutput`.
      rpc :LeaseOutput, ::Walletrpc::LeaseOutputRequest, ::Walletrpc::LeaseOutputResponse
      #
      # ReleaseOutput unlocks an output, allowing it to be available for coin
      # selection if it remains unspent. The ID should match the one used to
      # originally lock the output.
      rpc :ReleaseOutput, ::Walletrpc::ReleaseOutputRequest, ::Walletrpc::ReleaseOutputResponse
      #
      # ListLeases lists all currently locked utxos.
      rpc :ListLeases, ::Walletrpc::ListLeasesRequest, ::Walletrpc::ListLeasesResponse
      #
      # DeriveNextKey attempts to derive the *next* key within the key family
      # (account in BIP43) specified. This method should return the next external
      # child within this branch.
      rpc :DeriveNextKey, ::Walletrpc::KeyReq, ::Signrpc::KeyDescriptor
      #
      # DeriveKey attempts to derive an arbitrary key specified by the passed
      # KeyLocator.
      rpc :DeriveKey, ::Signrpc::KeyLocator, ::Signrpc::KeyDescriptor
      #
      # NextAddr returns the next unused address within the wallet.
      rpc :NextAddr, ::Walletrpc::AddrRequest, ::Walletrpc::AddrResponse
      #
      # ListAccounts retrieves all accounts belonging to the wallet by default. A
      # name and key scope filter can be provided to filter through all of the
      # wallet accounts and return only those matching.
      rpc :ListAccounts, ::Walletrpc::ListAccountsRequest, ::Walletrpc::ListAccountsResponse
      #
      # RequiredReserve returns the minimum amount of satoshis that should be kept
      # in the wallet in order to fee bump anchor channels if necessary. The value
      # scales with the number of public anchor channels but is capped at a maximum.
      rpc :RequiredReserve, ::Walletrpc::RequiredReserveRequest, ::Walletrpc::RequiredReserveResponse
      #
      # ListAddresses retrieves all the addresses along with their balance. An
      # account name filter can be provided to filter through all of the
      # wallet accounts and return the addresses of only those matching.
      rpc :ListAddresses, ::Walletrpc::ListAddressesRequest, ::Walletrpc::ListAddressesResponse
      #
      # ImportAccount imports an account backed by an account extended public key.
      # The master key fingerprint denotes the fingerprint of the root key
      # corresponding to the account public key (also known as the key with
      # derivation path m/). This may be required by some hardware wallets for
      # proper identification and signing.
      #
      # The address type can usually be inferred from the key's version, but may be
      # required for certain keys to map them into the proper scope.
      #
      # For BIP-0044 keys, an address type must be specified as we intend to not
      # support importing BIP-0044 keys into the wallet using the legacy
      # pay-to-pubkey-hash (P2PKH) scheme. A nested witness address type will force
      # the standard BIP-0049 derivation scheme, while a witness address type will
      # force the standard BIP-0084 derivation scheme.
      #
      # For BIP-0049 keys, an address type must also be specified to make a
      # distinction between the standard BIP-0049 address schema (nested witness
      # pubkeys everywhere) and our own BIP-0049Plus address schema (nested pubkeys
      # externally, witness pubkeys internally).
      #
      # NOTE: Events (deposits/spends) for keys derived from an account will only be
      # detected by lnd if they happen after the import. Rescans to detect past
      # events will be supported later on.
      rpc :ImportAccount, ::Walletrpc::ImportAccountRequest, ::Walletrpc::ImportAccountResponse
      #
      # ImportPublicKey imports a public key as watch-only into the wallet. The
      # public key is converted into a simple address of the given type and that
      # address script is watched on chain. For Taproot keys, this will only watch
      # the BIP-0086 style output script. Use ImportTapscript for more advanced key
      # spend or script spend outputs.
      #
      # NOTE: Events (deposits/spends) for a key will only be detected by lnd if
      # they happen after the import. Rescans to detect past events will be
      # supported later on.
      rpc :ImportPublicKey, ::Walletrpc::ImportPublicKeyRequest, ::Walletrpc::ImportPublicKeyResponse
      #
      # ImportTapscript imports a Taproot script and internal key and adds the
      # resulting Taproot output key as a watch-only output script into the wallet.
      # For BIP-0086 style Taproot keys (no root hash commitment and no script spend
      # path) use ImportPublicKey.
      #
      # NOTE: Events (deposits/spends) for a key will only be detected by lnd if
      # they happen after the import. Rescans to detect past events will be
      # supported later on.
      #
      # NOTE: Taproot keys imported through this RPC currently _cannot_ be used for
      # funding PSBTs. Only tracking the balance and UTXOs is currently supported.
      rpc :ImportTapscript, ::Walletrpc::ImportTapscriptRequest, ::Walletrpc::ImportTapscriptResponse
      #
      # PublishTransaction attempts to publish the passed transaction to the
      # network. Once this returns without an error, the wallet will continually
      # attempt to re-broadcast the transaction on start up, until it enters the
      # chain.
      rpc :PublishTransaction, ::Walletrpc::Transaction, ::Walletrpc::PublishResponse
      #
      # SendOutputs is similar to the existing sendmany call in Bitcoind, and
      # allows the caller to create a transaction that sends to several outputs at
      # once. This is ideal when wanting to batch create a set of transactions.
      rpc :SendOutputs, ::Walletrpc::SendOutputsRequest, ::Walletrpc::SendOutputsResponse
      #
      # EstimateFee attempts to query the internal fee estimator of the wallet to
      # determine the fee (in sat/kw) to attach to a transaction in order to
      # achieve the confirmation target.
      rpc :EstimateFee, ::Walletrpc::EstimateFeeRequest, ::Walletrpc::EstimateFeeResponse
      #
      # PendingSweeps returns lists of on-chain outputs that lnd is currently
      # attempting to sweep within its central batching engine. Outputs with similar
      # fee rates are batched together in order to sweep them within a single
      # transaction.
      #
      # NOTE: Some of the fields within PendingSweepsRequest are not guaranteed to
      # remain supported. This is an advanced API that depends on the internals of
      # the UtxoSweeper, so things may change.
      rpc :PendingSweeps, ::Walletrpc::PendingSweepsRequest, ::Walletrpc::PendingSweepsResponse
      #
      # BumpFee bumps the fee of an arbitrary input within a transaction. This RPC
      # takes a different approach than bitcoind's bumpfee command. lnd has a
      # central batching engine in which inputs with similar fee rates are batched
      # together to save on transaction fees. Due to this, we cannot rely on
      # bumping the fee on a specific transaction, since transactions can change at
      # any point with the addition of new inputs. The list of inputs that
      # currently exist within lnd's central batching engine can be retrieved
      # through the PendingSweeps RPC.
      #
      # When bumping the fee of an input that currently exists within lnd's central
      # batching engine, a higher fee transaction will be created that replaces the
      # lower fee transaction through the Replace-By-Fee (RBF) policy. If it
      #
      # This RPC also serves useful when wanting to perform a Child-Pays-For-Parent
      # (CPFP), where the child transaction pays for its parent's fee. This can be
      # done by specifying an outpoint within the low fee transaction that is under
      # the control of the wallet.
      #
      # The fee preference can be expressed either as a specific fee rate or a delta
      # of blocks in which the output should be swept on-chain within. If a fee
      # preference is not explicitly specified, then an error is returned.
      #
      # Note that this RPC currently doesn't perform any validation checks on the
      # fee preference being provided. For now, the responsibility of ensuring that
      # the new fee preference is sufficient is delegated to the user.
      rpc :BumpFee, ::Walletrpc::BumpFeeRequest, ::Walletrpc::BumpFeeResponse
      #
      # ListSweeps returns a list of the sweep transactions our node has produced.
      # Note that these sweeps may not be confirmed yet, as we record sweeps on
      # broadcast, not confirmation.
      rpc :ListSweeps, ::Walletrpc::ListSweepsRequest, ::Walletrpc::ListSweepsResponse
      #
      # LabelTransaction adds a label to a transaction. If the transaction already
      # has a label the call will fail unless the overwrite bool is set. This will
      # overwrite the exiting transaction label. Labels must not be empty, and
      # cannot exceed 500 characters.
      rpc :LabelTransaction, ::Walletrpc::LabelTransactionRequest, ::Walletrpc::LabelTransactionResponse
      #
      # FundPsbt creates a fully populated PSBT that contains enough inputs to fund
      # the outputs specified in the template. There are two ways of specifying a
      # template: Either by passing in a PSBT with at least one output declared or
      # by passing in a raw TxTemplate message.
      #
      # If there are no inputs specified in the template, coin selection is
      # performed automatically. If the template does contain any inputs, it is
      # assumed that full coin selection happened externally and no additional
      # inputs are added. If the specified inputs aren't enough to fund the outputs
      # with the given fee rate, an error is returned.
      #
      # After either selecting or verifying the inputs, all input UTXOs are locked
      # with an internal app ID.
      #
      # NOTE: If this method returns without an error, it is the caller's
      # responsibility to either spend the locked UTXOs (by finalizing and then
      # publishing the transaction) or to unlock/release the locked UTXOs in case of
      # an error on the caller's side.
      rpc :FundPsbt, ::Walletrpc::FundPsbtRequest, ::Walletrpc::FundPsbtResponse
      #
      # SignPsbt expects a partial transaction with all inputs and outputs fully
      # declared and tries to sign all unsigned inputs that have all required fields
      # (UTXO information, BIP32 derivation information, witness or sig scripts)
      # set.
      # If no error is returned, the PSBT is ready to be given to the next signer or
      # to be finalized if lnd was the last signer.
      #
      # NOTE: This RPC only signs inputs (and only those it can sign), it does not
      # perform any other tasks (such as coin selection, UTXO locking or
      # input/output/fee value validation, PSBT finalization). Any input that is
      # incomplete will be skipped.
      rpc :SignPsbt, ::Walletrpc::SignPsbtRequest, ::Walletrpc::SignPsbtResponse
      #
      # FinalizePsbt expects a partial transaction with all inputs and outputs fully
      # declared and tries to sign all inputs that belong to the wallet. Lnd must be
      # the last signer of the transaction. That means, if there are any unsigned
      # non-witness inputs or inputs without UTXO information attached or inputs
      # without witness data that do not belong to lnd's wallet, this method will
      # fail. If no error is returned, the PSBT is ready to be extracted and the
      # final TX within to be broadcast.
      #
      # NOTE: This method does NOT publish the transaction once finalized. It is the
      # caller's responsibility to either publish the transaction on success or
      # unlock/release any locked UTXOs in case of an error in this method.
      rpc :FinalizePsbt, ::Walletrpc::FinalizePsbtRequest, ::Walletrpc::FinalizePsbtResponse
    end

    Stub = Service.rpc_stub_class
  end
end
