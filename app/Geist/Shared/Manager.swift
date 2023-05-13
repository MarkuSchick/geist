//
//  Manager.swift
//  Geist
//
//  Created by Ümit Gül on 12.05.23.
//

import Foundation

final class Manager {
    static let shared = Manager()
    let accountProvider = AccountProvider()
    let linkBuilder = LinkBuilder()

    var balanceProvider: BalanceProvider!
    var provider: Web3Provider!

    var senderAccount: Wallet!
    var receiverAccount: Wallet!

    func configSender() async {
        let account = try! accountProvider.createSenderAccount()
        self.senderAccount = account
        self.provider = await Web3Provider(with: senderAccount, chain: EtherumNetwork.mainnet)
        self.balanceProvider = BalanceProvider(provider: provider)
    }

    func configReceiver() async {
        let account = try! accountProvider.createReceiverAccount()
        self.receiverAccount = account
        self.provider = await Web3Provider(with: receiverAccount, chain: EtherumNetwork.mainnet)
        self.balanceProvider = BalanceProvider(provider: provider)
    }
}
