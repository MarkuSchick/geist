//
//  Network.swift
//  Geist
//
//  Created by Jann Driessen on 13.05.23.
//

import Foundation

enum ChainId: UInt {
    case Ethereum = 1
    case Localhost = 31337
}

struct Network {
    let chainId: ChainId
    let rpc: String
}

extension Network {
    var rpcUrl: URL {
        return URL(string: rpc)!
    }
}

enum EtherumNetwork {
    static var mainnet: Network {
        return Network(
            chainId: ChainId.Ethereum,
            rpc: Constants.providerUrl
        )
    }

    static var localhost: Network {
        return Network(
            chainId: ChainId.Localhost,
            rpc: Constants.providerUrl
        )
    }
}
