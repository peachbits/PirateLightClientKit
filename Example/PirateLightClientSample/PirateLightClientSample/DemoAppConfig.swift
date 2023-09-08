//
//  DemoAppConfig.swift
//  PirateLightClientSample
//
//  Created by Francisco Gindre on 10/31/19.
//  Copyright © 2019 Electric Coin Company. All rights reserved.
//

import Foundation
import PirateLightClientKit
import MnemonicSwift

// swiftlint:disable force_try
enum DemoAppConfig {
    struct SynchronizerInitData {
        let alias: ZcashSynchronizerAlias
        let birthday: BlockHeight
        let seed: [UInt8]
    }

    static let host = PirateSDK.isMainnet ? "lightwalletd.electriccoin.co" : "lightwalletd.testnet.electriccoin.co"
    static let port: Int = 9067
    static let defaultBirthdayHeight: BlockHeight = PirateSDK.isMainnet ? 935000 : 1386000
    static let defaultSeed = try! Mnemonic.deterministicSeedBytes(from: """
    live combine flight accident slow soda mind bright absent bid hen shy decade biology amazing mix enlist ensure biology rhythm snap duty soap armor
    """)

    static let otherSynchronizers: [SynchronizerInitData] = [
        SynchronizerInitData(
            alias: .custom("alt-sync-1"),
            birthday: 2270000,
            seed: try! Mnemonic.deterministicSeedBytes(from: """
            celery very reopen verify cook page cricket shield guilt picnic survey doctor include choice they stairs breeze sort route mask carpet \
            coral clinic glass
            """)
        ),
        SynchronizerInitData(
            alias: .custom("alt-sync-2"),
            birthday: 2270000,
            seed: try! Mnemonic.deterministicSeedBytes(from: """
            horse museum parrot simple scissors head baby december tool donor impose job draw outer photo much minimum door gun vessel matrix vacant \
            magnet lumber
            """)
        )
    ]

    static var address: String {
        "\(host):\(port)"
    }

    static var endpoint: LightWalletEndpoint {
        return LightWalletEndpoint(address: self.host, port: self.port, secure: true, streamingCallTimeoutInMillis: 10 * 60 * 60 * 1000)
    }
}

extension PirateSDK {
    static var isMainnet: Bool {
        switch kPirateNetwork.networkType {
        case .mainnet:  return true
        case .testnet:  return false
        }
    }
}
