//
//  Reachability.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Alamofire

class Reachability: ReachabilityProtocol {
    private var reachability: NetworkReachabilityManager?

    init(reachability: NetworkReachabilityManager? = NetworkReachabilityManager(host: AppEnvironment.websiteURL)) {
        self.reachability = reachability
    }

    func addReachabilityObserver() {
        guard !(reachability?.isReachable ?? false) else { return }
        reachability?.startListening(onUpdatePerforming: { _ in
            // TODO: - REDIRECT TO NETWORK STATUS
        })
    }

    func removeReachabilityObserver() {
        reachability?.stopListening()
        reachability = nil
    }

    deinit {
        removeReachabilityObserver()
    }
}
