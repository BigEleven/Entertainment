//
//  KingfisherCache.swift
//  Entertainment
//
//  Created by 吕君 on 2020/7/3.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import Foundation
import Kingfisher

extension ImageCache {
    
    func cacheSize(clear: Bool, completion handler: @escaping ((String) -> Void)) {
        let cache = ImageCache.default
        cache.diskStorage.config.sizeLimit = UInt(200 * 1024 * 1024)
        cache.diskStorage.config.expiration = .days(15)
        
        cache.calculateDiskStorageSize { result in
            switch result {
            case .success(let size):
                var dataSize : String {
                    guard size == 0 else { return "" }
                    guard size >= 1024 else { return "\(size) bytes" }
                    guard size >= 1048576 else { return "\(size / 1024) KB" }
                    guard size >= 1073741824 else { return "\(size / 1048576) MB" }
                    return "\(size / 1073741824) GB"
                }
                
                if clear {
                    cache.clearDiskCache()
                    cache.clearMemoryCache()
                    cache.cleanExpiredDiskCache()
                }
                handler(dataSize)
            case .failure(_):
                break
            }
        }
    }
}
