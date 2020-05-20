//
//  Appdelegate_Voip.swift
//  Entertainment
//
//  Created by 吕君 on 2020/5/8.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import Foundation

extension AppDelegate {
    func voipRegistration() {
        
        let regis = PKPushRegistry(queue: .main)
        regis.delegate = self
        regis.desiredPushTypes = [PKPushType.voIP]
    }
}

extension AppDelegate: PKPushRegistryDelegate {
    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        JPUSHService.registerVoipToken(pushCredentials.token)
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        LJDebug("45234567")
        playVoice()
    }
}
