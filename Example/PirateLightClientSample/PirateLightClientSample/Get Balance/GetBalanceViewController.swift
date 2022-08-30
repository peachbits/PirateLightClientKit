//
//  GetBalanceViewController.swift
//  PirateLightClientSample
//
//  Created by Francisco Gindre on 11/26/19.
//  Copyright © 2019 Electric Coin Company. All rights reserved.
//

import UIKit
import PirateLightClientKit

class GetBalanceViewController: UIViewController {
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var verified: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Account 0 Balance"
        self.balance.text = "\(Initializer.shared.getBalance().asHumanReadableArrrBalance()) ARRR"
        self.verified.text = "\(Initializer.shared.getVerifiedBalance().asHumanReadableArrrBalance()) ARRR"
    }
}

extension Int64 {
    func asHumanReadableArrrBalance() -> Double {
        Double(self) / Double(PirateSDK.zatoshiPerARRR)
    }
}

extension Double {
    func toZatoshi() -> Int64 {
        Int64(self * Double(PirateSDK.zatoshiPerARRR))
    }
}
