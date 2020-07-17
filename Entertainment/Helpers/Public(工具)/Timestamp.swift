//
//  Timestamp.swift
//  Entertainment
//
//  Created by 吕君 on 2020/7/2.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import Foundation

extension String {

    enum RequestTimeType {
        case TimeNormal
        case TimeMSNormal
        case TimeStamp
        case TimeYYYYMMdd
        case TimeAndTimeZone
        
        var dateFormat: String {
            switch self {
            case .TimeNormal:
                return "yyyy-MM-dd HH:mm:ss"
            case .TimeMSNormal:
                return "yyyy-MM-dd HH:mm:ss.SSS"
            case .TimeYYYYMMdd:
                return "yyyy-MM-dd"
            case .TimeAndTimeZone:
                return "yyyy-MM-dd HH:mm:ss ZZZZ"
            case .TimeStamp:
                return ""
            }
        }
    }
    
    func timeStampParsing(_ timeType : RequestTimeType = .TimeNormal) -> String {
        var timeStamp : TimeInterval = 0
        if count >= 10 {
            let tempTimeStamp = prefix(10)
            timeStamp = TimeInterval(tempTimeStamp)!
        } else {
            return ""
        }
        
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = timeType.dateFormat
        let time = dateFormatter.string(from: date)
        return time
    }
    
    func timeStamp(_ timeType : RequestTimeType = .TimeNormal) -> Date {
        var timeStamp : TimeInterval = 0
        if count >= 10 {
            let tempTimeStamp = prefix(10)
            timeStamp = TimeInterval(tempTimeStamp)!
        } else {
            return Date()
        }
    
        return Date(timeIntervalSince1970: timeStamp)
    }
}

extension Int {
    func secondsToTime() -> [Int] {
        let allSecond = self / 1000
        //天数计算
        let days = allSecond / (24 * 3600)
        
        //小时计算
        let hours = allSecond % (24 * 3600) / 3600
        
        //分钟计算
        let minutes = allSecond % 3600 / 60
        
        //秒计算
        let second = allSecond % 60
        
        return [(hours + days * 24), minutes, second]
    }
}
