//
//  Const.swift
//  LearSwift
//
//  Created by 王延磊 on 2018/11/16.
//  Copyright © 2018 追@寻. All rights reserved.
//

import UIKit

class Const: NSObject {
    // 屏幕的宽
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    // 屏幕的高
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    
    //屏幕宽高比例
    let ProportionW = UIScreen.main.bounds.size.width/667
    let ProportionH = UIScreen.main.bounds.size.height/667
    
    //获取当前版本号
    let BUNDLE_VERSION = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")
    
    //获取设备版本的UUID
    let DIV_UUID = UIDevice.current.identifierForVendor?.uuidString
    
    //判断是否是iPhoneX
    let kIs_iPhoneX = (UIScreen.instanceMethod(for: #selector(getter: UIScreen.currentMode)) != nil) ? __CGSizeEqualToSize(CGSize.init(width: 375.0, height: 812.0), UIScreen.main.bounds.size):false
    
    //iPhoneX顶部安全区域
    let kTopBarSafeHeight = ((UIScreen.instanceMethod(for: #selector(getter: UIScreen.currentMode)) != nil) ? __CGSizeEqualToSize(CGSize.init(width: 375.0, height: 812.0), UIScreen.main.bounds.size):false) ? 30:0
    
    //iPhoneX底部安全区域
    let kBottomSafeHeight = ((UIScreen.instanceMethod(for: #selector(getter: UIScreen.currentMode)) != nil) ? __CGSizeEqualToSize(CGSize.init(width: 375.0, height: 812.0), UIScreen.main.bounds.size):false) ? 44:0
    
    //本地化导航栏标题
    static func navtitle(name:NSString,controller:UIViewController) -> Void {
        controller.navigationItem.title = NSLocalizedString(name as String, comment:"导航栏标题" )
    }
    
    
    //本地化导航栏标题
    static func WYLLocalString(name:NSString) -> NSString {
        return NSLocalizedString(name as String, comment:"本地化" ) as NSString
    }
    
    //判断字符串是否为空
    static func IsYESStrEmpty(obj:NSString?) -> Bool{
        var result = Bool()

        result = obj == nil||(obj?.isEqual(NSNull()))!||(obj?.isEqual(""))!||(obj?.isEqual("null"))!
        return result
    }
    
    class func IsNotStrEmpty( obj:NSString?) -> Bool{
        let result = !(obj == nil) && !(obj?.isEqual(NSNull()))! && !(obj?.isEqual(""))! && !(obj?.isEqual("null"))!
        return result
    }
    
    
}
