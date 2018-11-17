//
//  Tools.swift
//  Tools
//
//  Created by 王延磊 on 2018/11/14.
//  Copyright © 2018 追@寻. All rights reserved.
//

import UIKit

class ExtensionTools: NSObject {

}
extension UIColor{
    
    public static func RGB(R:Float,G:Float,B:Float,Alp:Float) -> UIColor {
        print(CGFloat(R/255))
        return UIColor.init(red: CGFloat(R/255.0), green: CGFloat(G/255.0), blue: CGFloat(B/255.0), alpha: CGFloat(Alp));
    }
    public static func colorWithString(colorStr:NSString) -> UIColor{
        var cString = colorStr.trimmingCharacters(in: CharacterSet.ReferenceType.whitespacesAndNewlines) as String
        if (cString.count < 6) {
            return UIColor.clear
        }
        if cString.hasPrefix("0X") {
            cString  = String(cString[cString.index(cString.startIndex, offsetBy: 2)...])
        }
        if cString.hasPrefix("#") {
            cString  = String(cString[cString.index(cString.startIndex, offsetBy: 1)...])
        }
        
        if (cString.count != 6) {
            return UIColor.clear
        }
        let rstr = cString.mySubstring(start: 0, length: 2)
        let gstr = cString.mySubstring(start: 2, length: 2)
        let bstr = cString.mySubstring(start: 4, length: 2)
        
        var R = CUnsignedInt(),G = CUnsignedInt(),B = CUnsignedInt()
        Scanner.init(string: rstr).scanHexInt32(&R)
        Scanner.init(string: gstr).scanHexInt32(&G)
        Scanner.init(string: bstr).scanHexInt32(&B)
        return UIColor.init(red: CGFloat(R)/255.0, green: CGFloat(G)/255.0, blue: CGFloat(B)/255.0, alpha: CGFloat(1));
    }
    
}

extension String{
    
    /*
     在index = 0开始截取字符串到指定下标位置,(不包含下标)
     */
    func mySubstring(to index:NSInteger) -> String {
        return String(self[..<self.index(self.startIndex, offsetBy: index)])
    }
    
    /*
     在 index = index 指定下标开始截取字符串,(包含指定下标)
     */
    func mySubstring(from index:NSInteger) -> String{
        return String(self[self.index(self.startIndex, offsetBy: index)...])
    }
    
    /*
     截取指定开始位置,指定长度
     */
    func mySubstring(start location:NSInteger, length long:NSInteger) -> String {
        var len = long
        if len == -1 {
            len = self.count - location
        }
        let st = self.index(startIndex, offsetBy:location)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
    
    /*
     第一个满足指定字符条件前边的文字,(不包含指定字符)
     */
    func mySubstring(before str:Character) -> String {
        return String(self[..<(self.index(of: str) ?? self.endIndex)])
    }
    /*
     第一个满足指定字符条件后边的字,(不包含指定字符)
     */
    func mySubstring(after str:Character) -> String {
        let st = self.index((self.index(of: str) ?? self.endIndex), offsetBy: 1)
        return String(self[st..<self.endIndex])
    }
    
    //判断是否是手机号
    func isMobileNumber() -> Bool {
        if self.count != 11 {
            return false
        }
        /**
         * 手机号码:
         * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
         * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
         * 联通号段: 130,131,132,155,156,185,186,145,176,1709
         * 电信号段: 133,153,180,181,189,177,1700
         */
        let MOBILE = "^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$"
        
        
        /**
         * 中国移动：China Mobile
         * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
         */
        let CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)"
        
        
        /**
         * 中国联通：China Unicom
         * 130,131,132,155,156,185,186,145,176,1709
         */
        let CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)"
        
        /**
         * 中国电信：China Telecom
         * 133,153,180,181,189,177,1700
         */
        let CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)"
        
        
        let regextestmobile = NSPredicate.init(format: "SELF MATCHES %@", MOBILE)
        
        let regextestcm = NSPredicate.init(format: "SELF MATCHES %@", CM)
        
        let regextestcu = NSPredicate.init(format: "SELF MATCHES %@", CU)
        
        let regextestct = NSPredicate.init(format: "SELF MATCHES %@", CT)
        
        
        if (regextestmobile.evaluate(with: self) == true) ||
            (regextestcm.evaluate(with: self) == true) ||
            (regextestcu.evaluate(with: self) == true) ||
            (regextestct.evaluate(with: self) == true){
            
            return true
        }else{
            return false
        }
    }
    
    //邮箱
    func isEmailAddress() -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return self.isValidateByRegex(regex: emailRegex)
    }
    
    //身份证号
    func simpleVerifyIdentityCardNum() -> Bool {
        let regex2 = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        return self.isValidateByRegex(regex: regex2)
    }
    
    //判断是否是连接
    func isValidUrl() -> Bool {
        let regex = "[a-zA-z]+://[^\\s]*"
        return self.isValidateByRegex(regex: regex)
    }
    
    func isValidateByRegex(regex:String) -> Bool {
        let pre = NSPredicate.init(format: "SELF MATCHES %@", regex)
        return pre.evaluate(with:self)
    }
}
extension UIImageView{
    //图片放大
    func showImage() -> Void {
        let image = self.image
        let window = UIApplication.shared.keyWindow
        let backgroundView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: (window?.frame.size.width)!, height: (window?.frame.size.height)!))
        
        backgroundView.backgroundColor = UIColor.init(white: 0.441, alpha: 1.00)
        backgroundView.alpha = 0.0
        
        
        let imageView = UIImageView.init(frame: self.convert(self.bounds, to: window))
        imageView.image = image
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.tag = 1
        backgroundView.addSubview(imageView)
        window?.addSubview(backgroundView)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.hideImage(tap:)))
        backgroundView.addGestureRecognizer(tap)
        
        UIView.animate(withDuration: 0.3, animations: {
            imageView.center = backgroundView.center
            backgroundView.alpha = 1
        }) { (finished) in
        }
    }
    //隐藏图片
    @objc func hideImage(tap:UITapGestureRecognizer) -> Void {
        let backgroundView = tap.view
        let imageView = backgroundView?.viewWithTag(1) as! UIImageView
        let window = UIApplication.shared.keyWindow
        UIView.animate(withDuration: 0.3, animations: {
            imageView.frame = self.convert(self.bounds, to: window)
            backgroundView?.alpha = 0
        }) { (finished) in
            backgroundView?.removeFromSuperview()
        }
    }
    
}

extension NSObject{
    //获取日期人选type YYYY-MM-DD
    func getDateWith(type:NSString) -> NSString {
        let currentDate = NSDate()
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = type as String!
        let dateString = dateFormatter.string(from: currentDate as Date)
        return dateString as NSString
    }
}









