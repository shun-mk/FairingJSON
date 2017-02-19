//
//  JsonManager.swift
//  FairingJSON
//
//  Created by Shunsaku Miki on 2017/02/19.
//  Copyright © 2017年 Shunsaku Miki. All rights reserved.
//

import Cocoa

class JsonManager: NSObject {
    
    // MARK: - methods
    
    /**
     JsonObject生成
     
     - parameter data: データ
     
     - returns: JsonObject
     */
    class func genJsonObject(_ data: Data?) -> Any? {
        
        guard let data = data else {
            return nil
        }
        
        let object: Any?
        do {
            object = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        } catch {
            object = nil
        }
        return object
    }
}
