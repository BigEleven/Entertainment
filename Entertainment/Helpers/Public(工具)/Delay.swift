//
//  Delay.swift
//  Entertainment
//
//  Created by Eleven on 2018/5/29.
//  Copyright © 2018年 Eleven. All rights reserved.
//

import Foundation

typealias Task = (_ cancel: Bool) -> Void

@discardableResult
func delay(time: TimeInterval, execute work: @escaping () -> Void) -> DispatchWorkItem {
    let workItem = DispatchWorkItem(block: work)
    DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: workItem)
    return workItem
}
