//
//  SubmitTransactionTests.swift
//  PirateLightClientKit-Unit-Tests
//
//  Created by Francisco Gindre on 12/10/19.
//

import XCTest
@testable import PirateLightClientKit
@testable import SwiftProtobuf

// swiftlint:disable implicitly_unwrapped_optional
class RawTransactionTests: XCTestCase {
    var rawTx: Data!
    var transactionRepository: TransactionSQLDAO!

    override func setUp() {
        super.setUp()
        rawTx = Data(base64Encoded: txBase64String)
    }
    
    func testDeserialize() {
        guard let raw = Data(base64Encoded: txFromAndroidSDK) else {
            XCTFail("no raw data")
            return
        }
        
        let rawTransaction = RawTransaction.with({ rawTr in
            rawTr.data = raw
        })
        
        XCTAssertNotNil(rawTransaction)
    }

    let txFromAndroidSDK =
        // swiftlint:disable:next line_length
        "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"
    
    let txBase64String =
        // swiftlint:disable:next line_length
        "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"
}
