//
//  FileContent.swift
//  Entertainment
//
//  Created by 吕君 on 2020/6/29.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import Foundation
import SwiftyJSON

extension String {
    /// 在本地查找这个字符串作为文件名的文件的路径
    var path: String {
        guard let path = Bundle.main.path(forResource: self, ofType: "json") else {
            return self
        }

        return path
    }
    
    /// 在本地查找这个字符串作为文件名的文件的内容
    var fileContent: JSON {
        let url = URL(fileURLWithPath: path)
        var jsonArr = [[String: Any]]()
            do {
                let data = try Data(contentsOf: url)
                let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                jsonArr = jsonData as! [[String : Any]]
            } catch {
                    LJDebug("读取本地数据出现错误!")
            }
        return JSON(jsonArr)
    }
}
