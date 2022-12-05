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
// swiftlint:disable line_length force_try
enum DemoAppConfig {
    static var host = PirateSDK.isMainnet ? "lightd1.pirate.black" : "testlightd.pirate.black"
    static var port: Int = 443
    static var birthdayHeight: BlockHeight = PirateSDK.isMainnet ? 850000 : 1386000

    static var seed = try! Mnemonic.deterministicSeedBytes(from: "live combine flight accident slow soda mind bright absent bid hen shy decade biology amazing mix enlist ensure biology rhythm snap duty soap armor")
    static var address: String {
        "\(host):\(port)"
    }

    static var processorConfig: CompactBlockProcessor.Configuration  = {
        CompactBlockProcessor.Configuration(
            cacheDb: try! cacheDbURLHelper(),
            dataDb: try! dataDbURLHelper(),
            walletBirthday: Self.birthdayHeight,
            network: kPirateNetwork
        )
    }()

    static var endpoint: LightWalletEndpoint {
        return LightWalletEndpoint(address: self.host, port: self.port, secure: true)
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
