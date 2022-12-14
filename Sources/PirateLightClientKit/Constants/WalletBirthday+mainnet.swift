//
//  WalletBirthday+mainnet.swift
//  PirateLightClientKit
//
//  Created by Francisco Gindre on 7/28/21.
//
// swiftlint:disable function_body_length line_length cyclomatic_complexity
import Foundation

extension WalletBirthday {
  static let mainnetMin = WalletBirthday(
    height: 152_855,
    hash: "00000001500922f7db74b9d82b745f84ebec28b0d5ea00d2a8af53207f3a63c1",
    time: 1544836549,
    tree: "000000"
  )

  static let mainnetCheckpointDirectory = Bundle.module.bundleURL.appendingPathComponent("piratesaplingtree-checkpoints/mainnet/")

}
