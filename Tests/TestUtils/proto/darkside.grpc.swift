//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: darkside.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf
@testable import PirateLightClientKit

/// Usage: instantiate DarksideStreamerClient, then call methods of this protocol to make API calls.
internal protocol DarksideStreamerClientProtocol: GRPCClient {
  func reset(
    _ request: DarksideMetaState,
    callOptions: CallOptions?
  ) -> UnaryCall<DarksideMetaState, Empty>

  func stageBlocksStream(
    callOptions: CallOptions?
  ) -> ClientStreamingCall<DarksideBlock, Empty>

  func stageBlocks(
    _ request: DarksideBlocksURL,
    callOptions: CallOptions?
  ) -> UnaryCall<DarksideBlocksURL, Empty>

  func stageBlocksCreate(
    _ request: DarksideEmptyBlocks,
    callOptions: CallOptions?
  ) -> UnaryCall<DarksideEmptyBlocks, Empty>

  func stageTransactionsStream(
    callOptions: CallOptions?
  ) -> ClientStreamingCall<RawTransaction, Empty>

  func stageTransactions(
    _ request: DarksideTransactionsURL,
    callOptions: CallOptions?
  ) -> UnaryCall<DarksideTransactionsURL, Empty>

  func applyStaged(
    _ request: DarksideHeight,
    callOptions: CallOptions?
  ) -> UnaryCall<DarksideHeight, Empty>

  func getIncomingTransactions(
    _ request: Empty,
    callOptions: CallOptions?,
    handler: @escaping (RawTransaction) -> Void
  ) -> ServerStreamingCall<Empty, RawTransaction>

  func clearIncomingTransactions(
    _ request: Empty,
    callOptions: CallOptions?
  ) -> UnaryCall<Empty, Empty>

  func addAddressUtxo(
    _ request: GetAddressUtxosReply,
    callOptions: CallOptions?
  ) -> UnaryCall<GetAddressUtxosReply, Empty>

  func clearAddressUtxo(
    _ request: Empty,
    callOptions: CallOptions?
  ) -> UnaryCall<Empty, Empty>

}

extension DarksideStreamerClientProtocol {

  /// Reset reverts all darksidewalletd state (active block range, latest height,
  /// staged blocks and transactions) and lightwalletd state (cache) to empty,
  /// the same as the initial state. This occurs synchronously and instantaneously;
  /// no reorg happens in lightwalletd. This is good to do before each independent
  /// test so that no state leaks from one test to another.
  /// Also sets (some of) the values returned by GetLightdInfo(). The Sapling
  /// activation height specified here must be where the block range starts.
  ///
  /// - Parameters:
  ///   - request: Request to send to Reset.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func reset(
    _ request: DarksideMetaState,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<DarksideMetaState, Empty> {
    return self.makeUnaryCall(
      path: "/pirate.wallet.sdk.rpc.DarksideStreamer/Reset",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// StageBlocksStream accepts a list of blocks and saves them into the blocks
  /// staging area until ApplyStaged() is called; there is no immediate effect on
  /// the mock zcashd. Blocks are hex-encoded. Order is important, see ApplyStaged.
  ///
  /// Callers should use the `send` method on the returned object to send messages
  /// to the server. The caller should send an `.end` after the final message has been sent.
  ///
  /// - Parameters:
  ///   - callOptions: Call options.
  /// - Returns: A `ClientStreamingCall` with futures for the metadata, status and response.
  internal func stageBlocksStream(
    callOptions: CallOptions? = nil
  ) -> ClientStreamingCall<DarksideBlock, Empty> {
    return self.makeClientStreamingCall(
      path: "/pirate.wallet.sdk.rpc.DarksideStreamer/StageBlocksStream",
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// StageBlocks is the same as StageBlocksStream() except the blocks are fetched
  /// from the given URL. Blocks are one per line, hex-encoded (not JSON).
  ///
  /// - Parameters:
  ///   - request: Request to send to StageBlocks.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func stageBlocks(
    _ request: DarksideBlocksURL,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<DarksideBlocksURL, Empty> {
    return self.makeUnaryCall(
      path: "/pirate.wallet.sdk.rpc.DarksideStreamer/StageBlocks",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// StageBlocksCreate is like the previous two, except it creates 'count'
  /// empty blocks at consecutive heights starting at height 'height'. The
  /// 'nonce' is part of the header, so it contributes to the block hash; this
  /// lets you create identical blocks (same transactions and height), but with
  /// different hashes.
  ///
  /// - Parameters:
  ///   - request: Request to send to StageBlocksCreate.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func stageBlocksCreate(
    _ request: DarksideEmptyBlocks,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<DarksideEmptyBlocks, Empty> {
    return self.makeUnaryCall(
      path: "/pirate.wallet.sdk.rpc.DarksideStreamer/StageBlocksCreate",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// StageTransactionsStream stores the given transaction-height pairs in the
  /// staging area until ApplyStaged() is called. Note that these transactions
  /// are not returned by the production GetTransaction() gRPC until they
  /// appear in a "mined" block (contained in the active blockchain presented
  /// by the mock zcashd).
  ///
  /// Callers should use the `send` method on the returned object to send messages
  /// to the server. The caller should send an `.end` after the final message has been sent.
  ///
  /// - Parameters:
  ///   - callOptions: Call options.
  /// - Returns: A `ClientStreamingCall` with futures for the metadata, status and response.
  internal func stageTransactionsStream(
    callOptions: CallOptions? = nil
  ) -> ClientStreamingCall<RawTransaction, Empty> {
    return self.makeClientStreamingCall(
      path: "/pirate.wallet.sdk.rpc.DarksideStreamer/StageTransactionsStream",
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// StageTransactions is the same except the transactions are fetched from
  /// the given url. They are all staged into the block at the given height.
  /// Staging transactions to different heights requires multiple calls.
  ///
  /// - Parameters:
  ///   - request: Request to send to StageTransactions.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func stageTransactions(
    _ request: DarksideTransactionsURL,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<DarksideTransactionsURL, Empty> {
    return self.makeUnaryCall(
      path: "/pirate.wallet.sdk.rpc.DarksideStreamer/StageTransactions",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// ApplyStaged iterates the list of blocks that were staged by the
  /// StageBlocks*() gRPCs, in the order they were staged, and "merges" each
  /// into the active, working blocks list that the mock zcashd is presenting
  /// to lightwalletd. Even as each block is applied, the active list can't
  /// have gaps; if the active block range is 1000-1006, and the staged block
  /// range is 1003-1004, the resulting range is 1000-1004, with 1000-1002
  /// unchanged, blocks 1003-1004 from the new range, and 1005-1006 dropped.
  ///
  /// After merging all blocks, ApplyStaged() appends staged transactions (in
  /// the order received) into each one's corresponding (by height) block
  /// The staging area is then cleared.
  ///
  /// The argument specifies the latest block height that mock zcashd reports
  /// (i.e. what's returned by GetLatestBlock). Note that ApplyStaged() can
  /// also be used to simply advance the latest block height presented by mock
  /// zcashd. That is, there doesn't need to be anything in the staging area.
  ///
  /// - Parameters:
  ///   - request: Request to send to ApplyStaged.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func applyStaged(
    _ request: DarksideHeight,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<DarksideHeight, Empty> {
    return self.makeUnaryCall(
      path: "/pirate.wallet.sdk.rpc.DarksideStreamer/ApplyStaged",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Calls to the production gRPC SendTransaction() store the transaction in
  /// a separate area (not the staging area); this method returns all transactions
  /// in this separate area, which is then cleared. The height returned
  /// with each transaction is -1 (invalid) since these transactions haven't
  /// been mined yet. The intention is that the transactions returned here can
  /// then, for example, be given to StageTransactions() to get them "mined"
  /// into a specified block on the next ApplyStaged().
  ///
  /// - Parameters:
  ///   - request: Request to send to GetIncomingTransactions.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  internal func getIncomingTransactions(
    _ request: Empty,
    callOptions: CallOptions? = nil,
    handler: @escaping (RawTransaction) -> Void
  ) -> ServerStreamingCall<Empty, RawTransaction> {
    return self.makeServerStreamingCall(
      path: "/pirate.wallet.sdk.rpc.DarksideStreamer/GetIncomingTransactions",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      handler: handler
    )
  }

  /// Clear the incoming transaction pool.
  ///
  /// - Parameters:
  ///   - request: Request to send to ClearIncomingTransactions.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func clearIncomingTransactions(
    _ request: Empty,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Empty, Empty> {
    return self.makeUnaryCall(
      path: "/pirate.wallet.sdk.rpc.DarksideStreamer/ClearIncomingTransactions",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Add a GetAddressUtxosReply entry to be returned by GetAddressUtxos().
  /// There is no staging or applying for these, very simple.
  ///
  /// - Parameters:
  ///   - request: Request to send to AddAddressUtxo.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func addAddressUtxo(
    _ request: GetAddressUtxosReply,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<GetAddressUtxosReply, Empty> {
    return self.makeUnaryCall(
      path: "/pirate.wallet.sdk.rpc.DarksideStreamer/AddAddressUtxo",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Clear the list of GetAddressUtxos entries (can't fail)
  ///
  /// - Parameters:
  ///   - request: Request to send to ClearAddressUtxo.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func clearAddressUtxo(
    _ request: Empty,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Empty, Empty> {
    return self.makeUnaryCall(
      path: "/pirate.wallet.sdk.rpc.DarksideStreamer/ClearAddressUtxo",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

internal final class DarksideStreamerClient: DarksideStreamerClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions

  /// Creates a client for the pirate.wallet.sdk.rpc.DarksideStreamer service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  internal init(channel: GRPCChannel, defaultCallOptions: CallOptions = CallOptions()) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
  }
}

