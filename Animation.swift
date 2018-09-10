//
//  Animation.swift
//  Filters
//
//  Created by Yogesh on 5/20/16.
//  Copyright © 2016 test. All rights reserved.
//


 //Mark: REFERENCE LINK: http://mathewsanders.com/animations-in-swift-part-two/

import UIKit
import MapKit

public func localisedText (text: String) -> String
{
    return NSLocalizedString(text, comment: "")
}

extension NSURLRequest
{
    static func allowsAnyHTTPSCertificateForHost(host: String) -> Bool
    {
        return true
    }
}

extension String
{
        var length: Int
        {
            return self.characters.count
        }
    
    
    var first: String {
        
        return String(characters.prefix(11))
    }
    var last: String {
        
        return String(characters.suffix(6))
    }
    var uppercaseFirst: String {
        return first.uppercased() + String(characters.dropFirst())
    }
    
    
    
    var firstUpper: String {
        return String(characters.prefix(1))
    }
    var lastUpper: String {
        return String(characters.suffix(1))
    }
    var uppercase: String {
        return firstUpper.uppercased() + String(characters.dropFirst())
    }

    
    
    
    
    func fromBase64() -> String? {
        guard let data = NSData(base64Encoded: self, options: NSData.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }
        
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }
    
    func toBase64() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        return data.base64EncodedString(options: .endLineWithLineFeed)
        //return data.base64EncodedStringWithOptions(NSData.Base64EncodingOptions(rawValue: 0))
    }
}



//http://stackoverflow.com/questions/24666515/how-do-i-make-an-attributed-string-using-swift

   //var boldString:NSMutableAttributedString
    


    



//http://stackoverflow.com/questions/24056205/how-to-use-background-thread-in-swift

extension DispatchQueue {
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
    
}

extension UIFont {
    
    func withTraits(traits:UIFontDescriptorSymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptorSymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
    func normal() -> UIFont {
        return withTraits(traits: .traitVertical)
    }

    
}


extension NSArray
{
    class func getJson(_ jsonName:String) ->NSArray
    {
        //let error:NSError
        var persons : NSArray = []
        let masterDataUrl: URL = Bundle.main.url(forResource: jsonName, withExtension: "json")!
        let jsonData: Data = try! Data(contentsOf: masterDataUrl)
        do{
            
            let jsonResult = try (JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray)!
            persons = jsonResult
            
        }
        catch{
            
        }
        return persons
    }
}

extension UITextField
{
    
    func setImageInTextField(imageName:String)
        {
            self.layer.cornerRadius = 2.0
            self.layer.borderColor = UIColor.RDN_LineColor().cgColor
            self.layer.borderWidth = 1.0
            self.leftViewMode = .always
            let img:UIImageView = UIImageView()
            //            img.frame = CGRect.init(x: 0, y: 0, width: self.frame.height , height: self.frame.height - 10)
            img.frame = CGRect.init(x: 0, y: 0, width: 24.0 , height: 24.0)

            img.image = UIImage.init(named: imageName)
            img.contentMode = .scaleAspectFit
            self.leftView = img
        }
    
    func applyimageintextfield(imageName:String)
    {
        self.leftViewMode = .always
        let img:UIImageView = UIImageView()
        //            img.frame = CGRect.init(x: 0, y: 0, width: self.frame.height , height: self.frame.height - 10)
        img.frame = CGRect.init(x: 0, y: 0, width: 24.0 , height: 24.0)
        img.image = UIImage.init(named: imageName)
        img.contentMode = .scaleAspectFit
        self.leftView = img
    }
    
        
    var textFldBorderColor: UIColor
    {
        set
        {
            self.layer.borderWidth = 1.0
            self.layer.cornerRadius = 5.0
            self.layer.borderColor = newValue.cgColor
        }
        get
        {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
}
extension UICollectionViewCell
{
    var setCollectionCellBorderColor: UIColor
        {
        set
        {
            self.layer.borderWidth = 1
            self.layer.borderColor = newValue.cgColor
        }
        get
        {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }

}

extension UIImageView
{
    var imageViewBorderColorOnly: UIColor
    {
        set
        {
            self.layer.borderWidth = 1
            self.layer.borderColor = newValue.cgColor
        }
        get
        {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
}



extension UILabel
{
    
    var labelBorderColor: UIColor
        {
        set
        {
            self.backgroundColor = UIColor.RDN_BlueColor()
            self.layer.cornerRadius = 5.0
            self.layer.borderWidth = 1
            self.layer.borderColor = newValue.cgColor
        }
        get
        {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    var labelBorderColorOnly: UIColor
        {
        set
        {
            self.layer.borderWidth = 1
            self.layer.borderColor = newValue.cgColor
        }
        get
        {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    func corner_radius_updates(by:CGFloat)
    {
        self.layer.cornerRadius = by
        self.layer.masksToBounds = true
    }
    
    func setPBLabelStandardCornerRadius()
    {
        self.layer.cornerRadius = 4.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.RDN_PermanentBannerBorderColor().cgColor
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat)
    {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = maskLayer
    }
    
}

class VerticalTopAlignLabel: UILabel {
    
    override func drawText(in rect:CGRect) {
        guard let labelText = text else {  return super.drawText(in: rect) }
        
        let attributedText = NSAttributedString(string: labelText, attributes: [NSFontAttributeName: font])
        var newRect = rect
        newRect.size.height = attributedText.boundingRect(with: rect.size, options: .usesLineFragmentOrigin, context: nil).size.height
        
        if numberOfLines != 0 {
            newRect.size.height = min(newRect.size.height, CGFloat(numberOfLines) * font.lineHeight)
        }
        
        super.drawText(in: newRect)
    }
    
}

extension UICollectionView
{
    var collectionBorderColor:UIColor
        {
        set
        {
            self.layer.borderWidth = 1
            self.layer.borderColor = newValue.cgColor
        }
        get
        {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        }
}


extension UIView
{
    var borderColor: UIColor
        {
        set
        {
            self.layer.borderWidth = 1
            self.layer.borderColor = newValue.cgColor
        }
        get
        {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    var containerborderColor: UIColor
    {
        set
        {
            self.layer.borderWidth = 1
            self.layer.cornerRadius = 5.0
            self.layer.borderColor = newValue.cgColor
        }
        get
        {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }

    
    
}



extension UIButton
{
    
    func set_imageinset(top:CGFloat,left:CGFloat,bottom:CGFloat,right:CGFloat)
    {
        self.imageEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right)
    }
    
    func set_titleinset(top:CGFloat,left:CGFloat,bottom:CGFloat,right:CGFloat)
    {
        self.titleEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right)
    }
    
    // -------------------- ARROW IMAGE -------------------
    
//    func setarrow_imageinset(top:CGFloat,left:CGFloat,bottom:CGFloat,right:CGFloat)
//    {
//        self.imageEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right)
//    }
//    func setarrow_textinset(top:CGFloat,left:CGFloat,bottom:CGFloat,right:CGFloat)
//    {
//        self.titleEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right)
//    }

    
    
    var cameraButtonlayout: UIColor
        {
        set
        {
            self.layer.cornerRadius = 4.0
            self.layer.borderWidth = 0.5
            self.backgroundColor = UIColor.white
            self.layer.borderColor = newValue.cgColor
        }
        get
        {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat)
    {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = maskLayer
    }
    
   
}
//extension CALayer
//{
//
//    func required_error()
//    {
//        self.borderWidth = 2.5
//        self.borderColor = UIColor.red.cgColor
//    }
//    func required_complete()
//    {
//        self.borderWidth = 0.5
//        self.borderColor = UIColor.RDN_LineColor().cgColor
//    }
//    
//    func required_complete_clear()
//    {
//        self.borderWidth = 0.5
//        self.borderColor = UIColor.clear.cgColor
//    }
//
////    var required_error: UIColor
////    {
////        set
////        {
////            self.borderWidth = 0.5
////            self.borderColor = newValue.cgColor
////        }
////        get
////        {
////            return UIColor(cgColor: self.borderColor!)
////        }
////    }
//
//
//}
    /*
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        print(edge)
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect.init(x: 0, y: 0, width: thickness, height: frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect.init(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
        
        
    }
 */
extension UIViewController
{

    func dismissview(btn:UIButton)
    {
        btn.removeFromSuperview()
    }
    
    func showtoast(backgroundColor:UIColor, textColor:UIColor, message:String)
    {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let label:InsetLabel = InsetLabel()
        
        label.textAlignment = NSTextAlignment.left
        label.text = message
        label.font = UIFont.systemFont(ofSize: 20)
        
                label.backgroundColor =  backgroundColor //UIColor.whiteColor()
//        label.backgroundColor =  UIColor.red //UIColor.whiteColor()
        
        label.textColor = textColor //TEXT COLOR
        //        let view:UIView = UIView()
        //
        //        view.frame = CGRect(x: appDelegate.window!.frame.size.width, y: 70, width: appDelegate.window!.frame.size.width, height: 50)
        
        //label.sizeToFit()
        //        label.numberOfLines = 4
        //        label.layer.shadowColor = UIColor.gray.cgColor
        //        label.layer.shadowOffset = CGSize(width: 4, height: 3)
        //        label.layer.shadowOpacity = 0.3
        label.frame = CGRect(x: 0, y: 0, width: appDelegate.window!.frame.size.width - 100, height: 50)
        
        
        let btn = UIButton.init(frame: CGRect.zero)
        
        btn.backgroundColor = backgroundColor
        btn.setarrow_textinset(top: 0, left: appDelegate.window!.frame.size.width - 100, bottom: 0, right: 0)
        btn.frame = CGRect.init(x:  appDelegate.window!.frame.size.width, y: 80 , width: appDelegate.window!.frame.size.width, height: 50)
        btn.setTitle("Dismiss X", for: .normal)
        
        btn.addTarget(self, action: #selector(self.dismissview), for: .touchUpInside)
        
        label.alpha = 1
        
        
        btn.addSubview(label)
        appDelegate.window!.addSubview(btn)
        
        var basketTopFrame: CGRect = btn
            .frame;
        basketTopFrame.origin.x = 0;
        
        UIView.animate(withDuration
            :2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                btn.frame = basketTopFrame
        },  completion: {
            (value: Bool) in
            //            UIView.animate(withDuration:2.0, delay: 2.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            //                label.alpha = 0
            //            },  completion: {
            //                (value: Bool) in
            //                label.removeFromSuperview()
            //            })
        })
    }
    
//    func showToast(message : String) {
//        
//        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        let toastLabel = UILabel(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 60))
//        toastLabel.backgroundColor = UIColor.green
//        toastLabel.textColor = UIColor.white
//        toastLabel.textAlignment = .center;
//        //toastLabel.font = UIFont(name: "Montserrat-Light", size: 60)
//        toastLabel.font = UIFont.boldSystemFont(ofSize: 30)
//
//        toastLabel.text = message
//        //toastLabel.alpha = 1.0
//        toastLabel.layer.cornerRadius = 10;
//        toastLabel.clipsToBounds  =  true
//        appDelegate.window!.addSubview(toastLabel)
//        UIView.animate(withDuration
//            :2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.transitionFlipFromTop, animations: { () -> Void in
//                //label.frame = basketTopFrame
//        },  completion: {
//            (value: Bool) in
//            UIView.animate(withDuration:5.0, delay: 2.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.transitionFlipFromBottom, animations: { () -> Void in
//                //label.alpha = 0
//            },  completion: {
//                (value: Bool) in
//                toastLabel.removeFromSuperview()
//            })
//        })
//        
    
    //}
}

extension UIColor {
    static func RDN_BlueColor() -> UIColor
    {
        return UIColor.init(colorLiteralRed: 27.0/255.0, green: 80.0/255.0, blue: 132.0/255.0, alpha: 1)
    }
    static func RDN_StatusBarColor() -> UIColor
    {
        return UIColor.init(colorLiteralRed: 20.0/255.0, green: 64.0/255.0, blue: 108.0/255.0, alpha: 1)
    }
    static func RDN_greenColor() -> UIColor
    {
        return UIColor.init(colorLiteralRed: 53.0/255.0, green: 160.0/255.0, blue: 1.0/255.0, alpha: 1)
    }

    static func RDN_LineColor() -> UIColor
    {
       return UIColor.init(colorLiteralRed: 187.0/255.0, green: 187.0/255.0, blue: 187.0/255.0, alpha: 1)
    }
    static func RDN_LineColorDark() -> UIColor
    {
        return UIColor.init(colorLiteralRed: 147.0/255.0, green: 147.0/255.0, blue: 147.0/255.0, alpha: 1)
    }

    static func RDN_PermanentBannerBorderColor() -> UIColor
    {
        return UIColor.init(colorLiteralRed: 244.0/255.0, green: 199.0/255.0, blue: 191.0/255.0, alpha: 1)
    }
    
    static func RDN_update_close() -> UIColor
    {
        return UIColor.init(colorLiteralRed: 211.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
    }
    static func RDN_update_hold() -> UIColor
    {
        return UIColor.init(colorLiteralRed: 248.0/255.0, green: 216.0/255.0, blue: 48.0/255.0, alpha: 1)
    }
    static func RDN_update_new() -> UIColor
    {
        return UIColor.init(colorLiteralRed: 20.0/255.0, green: 105.0/255.0, blue: 189.0/255.0, alpha: 1)
    }
    static func RDN_update_high() -> UIColor
    {
        return UIColor.init(colorLiteralRed: 241.0/255.0, green: 85.0/255.0, blue: 9.0/255.0, alpha: 1)
    }
    static func RDN_update_medium() -> UIColor
    {
        return UIColor.init(colorLiteralRed: 13.0/255.0, green: 182.0/255.0, blue: 149.0/255.0, alpha: 1)
    }
    static func RDN_update_low() -> UIColor
    {
        return UIColor.init(colorLiteralRed: 9.0/255.0, green: 184.0/255.0, blue: 0.0/255.0, alpha: 1)
    }

    
    
    
}

class Toast:NSObject
{
   

    class private func showAlert_withdismiss(backgroundColor:UIColor, textColor:UIColor, message:String)
    {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let label:InsetLabel = InsetLabel()
        
        label.textAlignment = NSTextAlignment.left
        label.text = message
        label.font = UIFont.systemFont(ofSize: 20)
        
//        label.backgroundColor =  backgroundColor //UIColor.whiteColor()
        label.backgroundColor =  UIColor.red //UIColor.whiteColor()

        label.textColor = textColor //TEXT COLOR
//        let view:UIView = UIView()
//        
//        view.frame = CGRect(x: appDelegate.window!.frame.size.width, y: 70, width: appDelegate.window!.frame.size.width, height: 50)
        
        //label.sizeToFit()
        //        label.numberOfLines = 4
        //        label.layer.shadowColor = UIColor.gray.cgColor
        //        label.layer.shadowOffset = CGSize(width: 4, height: 3)
        //        label.layer.shadowOpacity = 0.3
        label.frame = CGRect(x: 0, y: 0, width: appDelegate.window!.frame.size.width - 100, height: 50)
        
        
        let btn = UIButton.init(frame: CGRect.zero)
        btn.backgroundColor = backgroundColor
        btn.setarrow_textinset(top: 0, left: appDelegate.window!.frame.size.width - 100, bottom: 0, right: 0)
        btn.frame = CGRect.init(x:  appDelegate.window!.frame.size.width, y: 80 , width: appDelegate.window!.frame.size.width, height: 50)
        btn.setTitle("Dismiss X", for: .normal)
        
       // btn.addTarget(appDelegate.window, action: #selector(Toast.dismissview(lbl:)), for: .touchUpInside)
       // btn.addTarget(appDelegate.window, action: #selector(Toast.dismissview), for: .touchUpInside)

        label.alpha = 1
        
       
        btn.addSubview(label)
        appDelegate.window!.addSubview(btn)
        
        var basketTopFrame: CGRect = btn
            .frame;
        basketTopFrame.origin.x = 0;
        
        UIView.animate(withDuration
            :2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                btn.frame = basketTopFrame
        },  completion: {
            (value: Bool) in
//            UIView.animate(withDuration:2.0, delay: 2.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
//                label.alpha = 0
//            },  completion: {
//                (value: Bool) in
//                label.removeFromSuperview()
//            })
        })
    }
    
    //class private func showAlert(backgroundColor:UIColor, textColor:UIColor, message:String)
//    {
//        
//        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//        let label = InsetLabel(frame: CGRect.zero)
//            
//        label.textAlignment = NSTextAlignment.left
//        label.text = message
//        label.font = UIFont.systemFont(ofSize: 20)
//        
//        label.backgroundColor =  backgroundColor //UIColor.whiteColor()
//        label.textColor = textColor //TEXT COLOR
//        
//        
//        //label.sizeToFit()
////        label.numberOfLines = 4
////        label.layer.shadowColor = UIColor.gray.cgColor
////        label.layer.shadowOffset = CGSize(width: 4, height: 3)
////        label.layer.shadowOpacity = 0.3
//        label.frame = CGRect(x: appDelegate.window!.frame.size.width, y: 70, width: appDelegate.window!.frame.size.width, height: 50)
//        
//        
//        let btn = UIButton.init(frame: CGRect.zero)
//
//        btn.frame = CGRect.init(x:  label.frame.size.width - 100, y: label.frame.size.height/2  - 15, width: 100, height: 30)
//        btn.setTitle("Dismiss X", for: .normal)
//        btn.addTarget(self, action: #selector(Toast.dismissview), for: .touchUpInside)
//        label.addSubview(btn)
//        
//        label.alpha = 1
//        
//        appDelegate.window!.addSubview(label)
//        
//        var basketTopFrame: CGRect = label.frame;
//        basketTopFrame.origin.x = 0;
//        
//        UIView.animate(withDuration
//            :2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
//                label.frame = basketTopFrame
//        },  completion: {
//            (value: Bool) in
//            UIView.animate(withDuration:2.0, delay: 2.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
//                label.alpha = 0
//            },  completion: {
//                (value: Bool) in
//                label.removeFromSuperview()
//            })
//        })
//    }
    
    
    
    class func showPositiveMessage(message:String)
    {
        showAlert_withdismiss(backgroundColor: UIColor.RDN_banner_green(), textColor: UIColor.white, message: message)
    }
    class func showNegativeMessage(message:String)
    {
        //showAlert(backgroundColor: UIColor.red, textColor: UIColor.white, message: message)
    }
    class func showupdateinprocess(message:String)
    {
        showAlert_withdismiss(backgroundColor: UIColor.RDN_banner_blue(), textColor: UIColor.white, message: message)
    }
    class func showsuccess_loadsubmitted(message:String)
    {
        showAlert_withdismiss(backgroundColor: UIColor.RDN_banner_green(), textColor: UIColor.white, message: message)
    }
    
    class func showNoInternet(message:String)
    {
//        showAlert(backgroundColor: UIColor.yellow, textColor: UIColor.white, message: message)
    }
}

/**
    Used to show banner on view
 */

public class LoaderOverlay
{
    
    private var loaderOverlayView: UIView!
    var orderid:String = String()
    var orderid_close_hold:String = String()
    
    var receivednotification_id:String = String()
    
   // var agentnotificationmessage:String = String()
    
    class var shared: LoaderOverlay
    {
        struct Static
        {
            static let instance: LoaderOverlay = LoaderOverlay()
        }
        return Static.instance
    }
    
    private func setup(bgcolor:UIColor,title:String,txtcolor:UIColor)
    {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

        loaderOverlayView = UIView.init(frame: CGRect.zero)

        loaderOverlayView = UIView.init(frame: CGRect.init(x: 0, y: 20, width:(appDelegate.window?.frame.size.width)! , height: 60))
        loaderOverlayView.backgroundColor = bgcolor
        
        let lbl_text: UILabel = UILabel()
        lbl_text.frame = CGRect.init(x: 10, y: 5, width: (appDelegate.window?.frame.size.width)! - 100, height: 50)
        lbl_text.text = title
        lbl_text.font = UIFont.systemFont(ofSize: 18)
        lbl_text.textColor = txtcolor
        loaderOverlayView.addSubview(lbl_text)
        
        let btn: UIButton = UIButton()
        btn.frame = CGRect.init(x: (appDelegate.window?.frame.size.width)! - 100, y: 5, width: 100, height: 50)
        btn.setTitle("Dismiss X", for: .normal)
        btn.backgroundColor = bgcolor
        btn.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        
        loaderOverlayView.addSubview(btn)
    }
    
    private func setup_with_undo(bgcolor:UIColor,title:String,txtcolor:UIColor)
    {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        loaderOverlayView = UIView.init(frame: CGRect.zero)
        
        loaderOverlayView = UIView.init(frame: CGRect.init(x: 0, y: 20, width:(appDelegate.window?.frame.size.width)! , height: 60))
        loaderOverlayView.backgroundColor = bgcolor
        
        let lbl_text: UILabel = UILabel()
        lbl_text.frame = CGRect.init(x: 10, y: 5, width: (appDelegate.window?.frame.size.width)! - 100, height: 50)
        lbl_text.text = title
        lbl_text.font = UIFont.systemFont(ofSize: 18)
        lbl_text.textColor = txtcolor
        loaderOverlayView.addSubview(lbl_text)
        
        let btn: UIButton = UIButton()
        btn.frame = CGRect.init(x: (appDelegate.window?.frame.size.width)! - 100, y: 5, width: 100, height: 50)
        btn.setTitle("Dismiss X", for: .normal)
        btn.backgroundColor = bgcolor
        btn.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        loaderOverlayView.addSubview(btn)
        
        
        let btn_undo: UIButton = UIButton()
        btn_undo.frame = CGRect.init(x: (appDelegate.window?.frame.size.width)! - 250, y: 5, width: 100, height: 50)
        btn_undo.setTitle("Undo", for: .normal)
        btn_undo.backgroundColor = bgcolor
        btn_undo.addTarget(self, action: #selector(undo), for: .touchUpInside)
        loaderOverlayView.addSubview(btn_undo)

    }
    
    
    private func setup_with_ASSIGN(bgcolor:UIColor,title:String,txtcolor:UIColor)
    {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        loaderOverlayView = UIView.init(frame: CGRect.zero)
        
        loaderOverlayView = UIView.init(frame: CGRect.init(x: 0, y: 20, width:(appDelegate.window?.frame.size.width)! , height: 60))
        loaderOverlayView.backgroundColor = bgcolor
        
        let lbl_text: UILabel = UILabel()
        lbl_text.frame = CGRect.init(x: 10, y: 5, width: (appDelegate.window?.frame.size.width)! - 100, height: 50)
        lbl_text.text = title
        lbl_text.font = UIFont.systemFont(ofSize: 18)
        lbl_text.textColor = txtcolor
        loaderOverlayView.addSubview(lbl_text)
        
        let btn: UIButton = UIButton()
        btn.frame = CGRect.init(x: (appDelegate.window?.frame.size.width)! - 130, y: 15, width: 100, height: 30)
        btn.setstandardcornerradiusfornotification()
        btn.setTitle("Dismiss X", for: .normal)
        btn.backgroundColor = bgcolor
        btn.addTarget(self, action: #selector(removeNOTIFICATION_ASSIGN), for: .touchUpInside)
        loaderOverlayView.addSubview(btn)
        
    }
    
    private func setup_with_AGENT_NOTIFICATION(bgcolor:UIColor,title:String,txtcolor:UIColor)
    {
        
        /**
         This will pass the message in agentnotification view
        */
        //agentnotificationmessage = title
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        loaderOverlayView = UIView.init(frame: CGRect.zero)
        
        loaderOverlayView = UIView.init(frame: CGRect.init(x: 0, y: 20, width:(appDelegate.window?.frame.size.width)! , height: 60))
        loaderOverlayView.backgroundColor = bgcolor
        
        let lbl_text: UILabel = UILabel()
        lbl_text.frame = CGRect.init(x: 10, y: 5, width: ((appDelegate.window?.frame.size.width)! - 200) - 100, height: 50)
        lbl_text.text = title
        lbl_text.numberOfLines = 3
        lbl_text.font = UIFont.systemFont(ofSize: 18)
        lbl_text.textColor = txtcolor
        loaderOverlayView.addSubview(lbl_text)
        
        
        
        let btn: UIButton = UIButton()
        btn.frame = CGRect.init(x: (appDelegate.window?.frame.size.width)! - 150, y: 15, width: 130, height: 30)
        btn.setstandardcornerradiusfornotification()
        btn.setTitle("Acknowledge", for: .normal)
        btn.backgroundColor = bgcolor
        btn.addTarget(self, action: #selector(removeAGENT_NOTIFICATION), for: .touchUpInside)
        loaderOverlayView.addSubview(btn)
        
    }
    
    
    private func setup_with_HOLD_CLOSE(bgcolor:UIColor,title:String,txtcolor:UIColor)
    {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        loaderOverlayView = UIView.init(frame: CGRect.zero)
        
        loaderOverlayView = UIView.init(frame: CGRect.init(x: 0, y: 20, width:(appDelegate.window?.frame.size.width)! , height: 60))
        loaderOverlayView.backgroundColor = bgcolor
        
        let lbl_text: UILabel = UILabel()
        lbl_text.frame = CGRect.init(x: 10, y: 5, width: (appDelegate.window?.frame.size.width)! - 100, height: 50)
        lbl_text.text = title
        lbl_text.font = UIFont.systemFont(ofSize: 18)
        lbl_text.textColor = txtcolor
        loaderOverlayView.addSubview(lbl_text)
        
        let btn: UIButton = UIButton()
        btn.frame = CGRect.init(x: (appDelegate.window?.frame.size.width)! - 140, y: 15, width: 140, height: 30)
        btn.setstandardcornerradiusfornotification()
        btn.setTitle("Acknowledge", for: .normal)
        btn.backgroundColor = bgcolor
        btn.addTarget(self, action: #selector(removeNOTIFICATION_HOLD_CLOSE), for: .touchUpInside)
        loaderOverlayView.addSubview(btn)
        
        /**
         - This is implemented just to check which view are we in . If present processed case is closed at server we need to stop the processing disable screen
         */
        
        checkcurrentview_UOH()
       // checkcurrentview_reportonhook()
    }
    
    func checkcurrentview_UOH()
    {
        if  ((APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: RDN_UOH.self))! || (APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: RDN_UOH_reportrepossession.self))! || (APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: UOH_preview.self))!)
        {
//            var objcurrentvc_preview:UOH_preview!
//            var objcurrentvc_UOH:RDN_UOH!
//            var objcurrentvc_UOH_reportrepossession:RDN_UOH_reportrepossession!

            if ((APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: UOH_preview.self))!)
            {
                let objcurrentvc_preview = APPDELEGATE.mainViewController?.viewControllers.last as! UOH_preview
                
                if (objcurrentvc_preview.obj_RDNSecureAddress[0].orderID! == orderid_close_hold)
                {
                    objcurrentvc_preview.view.isUserInteractionEnabled = false
                }

            }
            if ((APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: RDN_UOH.self))!)
            {
               let  objcurrentvc_UOH = APPDELEGATE.mainViewController?.viewControllers.last as! RDN_UOH
                
                if (objcurrentvc_UOH.obj_RDNSecureAddress.orderID! == orderid_close_hold)
                {
                    objcurrentvc_UOH.view.isUserInteractionEnabled = false
                }

            }
            if ((APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: RDN_UOH_reportrepossession.self))!)
            {
               let objcurrentvc_UOH_reportrepossession = APPDELEGATE.mainViewController?.viewControllers.last as! RDN_UOH_reportrepossession
                
                if(objcurrentvc_UOH_reportrepossession.obj_RDNSecureAddress_repossessed.orderID! == orderid_close_hold)
                {
                    objcurrentvc_UOH_reportrepossession.view.isUserInteractionEnabled = false
                }
            }
            
            
            
//            if (objcurrentvc_preview.obj_RDNSecureAddress[0].orderID! == orderid_close_hold)
//            {
//                objcurrentvc_preview.view.isUserInteractionEnabled = false
//            }
//            else if (objcurrentvc_UOH.obj_RDNSecureAddress.orderID! == orderid_close_hold)
//            {
//                objcurrentvc_UOH.view.isUserInteractionEnabled = false
//            }
//            else if (objcurrentvc_UOH_reportrepossession.obj_RDNSecureAddress_repossessed.orderID! == orderid_close_hold)
//            {
//                objcurrentvc_UOH_reportrepossession.view.isUserInteractionEnabled = false
//            }
        }
    }

//    func checkcurrentview_reportonhook()
//    {
//        if  ((APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: RDN_reportonhook.self))! )
//        {
//            let objcurrentvc = APPDELEGATE.mainViewController?.viewControllers.last as! RDN_reportonhook
//            if (objcurrentvc.RunSheetSelectedSecureAddress[0].orderID! == orderid_close_hold)
//            {
//                objcurrentvc.view.isUserInteractionEnabled = false
//            }
//        }
//    }
    
    func poptodashboard()
    {
        let viewControllers: [UIViewController] = (APPDELEGATE.mainViewController?.viewControllers)!
        for aViewController in viewControllers
        {
            if aViewController is RDN_Dashboard
            {
                APPDELEGATE.mainViewController?.popToViewController(aViewController, animated: true)
            }
        }

    }
    
    @objc func removeNOTIFICATION_HOLD_CLOSE()
    {
        
        //marknotificationread()
        RDN_notificationstatusupdate.marknotificationread(notificationid: receivednotification_id)

        loaderOverlayView.removeFromSuperview()
        
        let arr_RunSheet:[RDNRunSheet] = RDNRunSheet.getAddressAsPerOrder(orderID: orderid_close_hold, context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext) as! [RDNRunSheet]

        if arr_RunSheet.count>0
        {
            
            if  ((APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: RDN_Dashboard.self))! )
            {
                deleteaddressfrom_runsheet(caseid: orderid_close_hold)
                let objcurrentvc = APPDELEGATE.mainViewController?.viewControllers.last as! RDN_Dashboard
                objcurrentvc.getdatarunsheet()
            }
            
            //RDN_reportonhook
       else if  ((APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: RDN_reportonhook.self))! )
        {
            let objcurrentvc = APPDELEGATE.mainViewController?.viewControllers.last as! RDN_reportonhook
            
            checkfordatain_invalid(caseid: orderid_close_hold)
            checkfordatain_addressvisited(caseid: orderid_close_hold)
            checkfordatain_reportonhook(caseid: orderid_close_hold)
            
//            if( objcurrentvc.RunSheetSelectedSecureAddress[0].orderID! == orderid_close_hold)
//            {
//                let sectionName:String = "secure"
//                var arr_Video : [VideoR] = []
//                var arr_Audio : [AudioRec] = []
//                var str_ImageAudioName:String = String()
//
//                str_ImageAudioName = "\(objcurrentvc.RunSheetSelectedSecureAddress[0].address!) \(objcurrentvc.RunSheetSelectedSecureAddress[0].orderID!) \(sectionName)"
//                Animation.removeAudio(filename: str_ImageAudioName)
//                Animation.removeVideo(filename: str_ImageAudioName)
//
//
//                arr_Video = VideoR.getallData(RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, name: "\(str_ImageAudioName).mp4") as! [VideoR]
//                print(arr_Video.count)
//
//                arr_Audio = AudioRec.getParticularRecordAsPerAudio(RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, audioName: str_ImageAudioName) as! [AudioRec]
//                if arr_Video.count>0
//                {
//                    VideoR.deleteVideo(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, objSelectedVideo: arr_Video[0])
//                }
//                if arr_Audio.count>0
//                {
//                    AudioRec.deleteAudio(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, objSelectedAudio: arr_Audio[0])
//                }
//
//                poptodashboard()
//
//            }
                deleteaddressfrom_runsheet(caseid: orderid_close_hold)

            objcurrentvc.view.isUserInteractionEnabled = true
        }
            
            
            // UOH
        else if ((APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: RDN_UOH.self))! || (APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: RDN_UOH_reportrepossession.self))! || (APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: UOH_preview.self))!)
        {
           // let objcurrentvc:UIViewController!
            var orderid:String = String()

            if  ((APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: RDN_UOH.self))! )
            {
                let objcurrentvc = APPDELEGATE.mainViewController?.viewControllers.last as! RDN_UOH
                orderid = objcurrentvc.obj_RDNSecureAddress.orderID!
            }
           else if  ((APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: RDN_UOH_reportrepossession.self))! )
            {
                let objcurrentvc = APPDELEGATE.mainViewController?.viewControllers.last as! RDN_UOH_reportrepossession
                
                orderid = objcurrentvc.obj_RDNSecureAddress_repossessed.orderID!
            }
            else if  ((APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: UOH_preview.self))! )
            {
                let objcurrentvc = APPDELEGATE.mainViewController?.viewControllers.last as! UOH_preview
                orderid = objcurrentvc.obj_RDNSecureAddress[0].orderID!
            }
            
            checkfordatain_invalid(caseid: orderid_close_hold)
            checkfordatain_addressvisited(caseid: orderid_close_hold)
            checkfordatain_reportonhook(caseid: orderid_close_hold)
            checkfordatain_uoh(caseid: orderid_close_hold)

            if( orderid == orderid_close_hold)
            {
                poptodashboard()
                //APPDELEGATE.mainViewController?.popToRootViewController(animated: true)

            }
            deleteaddressfrom_runsheet(caseid: orderid_close_hold)
        }
            else
            {
                deleteaddressfrom_runsheet(caseid: orderid_close_hold)
            }
    }
            
    else
        {
            Animation.showToastMessage(message: "Case not assigned", contView: (APPDELEGATE.mainViewController?.viewControllers.last)!)
        }
    }
    
    
    
    
    
    
    
    
    func checkfordatain_reportonhook(caseid:String)
    {
        
        let obj_secure:[RDNSecureAddress] = RDNSecureAddress.getAddressAsPerOrder(orderID: caseid, context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext) as! [RDNSecureAddress]
        var arr_Video : [VideoR] = []
        var arr_Audio : [AudioRec] = []

         if obj_secure.count > 0
         {
            arr_Video = VideoR.getallData(RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, name: "\(obj_secure[0].secureVideoName!).mp4") as! [VideoR]
            arr_Audio = AudioRec.getParticularRecordAsPerAudio(RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, audioName: obj_secure[0].secureAudioName!) as! [AudioRec]
            if arr_Video.count>0
            {
                VideoR.deleteVideo(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, objSelectedVideo: arr_Video[0])
            }
            if arr_Audio.count>0
            {
                AudioRec.deleteAudio(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, objSelectedAudio: arr_Audio[0])
            }
            Animation.removeImage(obj_secure[0].secureVehicleImage!)
            Animation.removeImage(obj_secure[0].secureVehicleVINImage!)
            Animation.removeAudio(filename: obj_secure[0].secureAudioName!)
            Animation.removeVideo(filename: obj_secure[0].secureVideoName!)
            RDNSecureAddress.deleteSecureAddress(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, secureAddress: obj_secure[0])
        }
    }
    
    func checkfordatain_uoh(caseid:String)
    {
        let obj_roh:[RDNUnitOnHook] = RDNUnitOnHook.getAddressAsPerOrder(orderID: caseid, context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext) as! [RDNUnitOnHook]
        if obj_roh.count > 0
        {
            RDNUnitOnHook.deleteParticularAddress(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, RDNRunSheetHook: obj_roh[0])
        }
    }
    /**
     - Address will be deleted , as they have status 1 and while fetching the new address status 1 addresses are not deleted from Runsheet DB table .
     */
    func deleteaddressfrom_runsheet(caseid:String)
    {
        let obj_RDNRunSheet:[RDNRunSheet] =   RDNRunSheet.getAddressAsPerOrder(orderID: caseid, context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext) as! [RDNRunSheet]
        
        if obj_RDNRunSheet.count>0
        {
            for i in 0..<obj_RDNRunSheet.count
            {
                RDNRunSheet.delete_runsheet_data(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, runsheet: obj_RDNRunSheet[i])
            }
        }
    }
    
    func checkfordatain_invalid(caseid:String)
    {
        let obj_invalid:[RDNInvalidAddress] = RDNInvalidAddress.getAllOfflineInvalidAddresses(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, orderId: caseid) as! [RDNInvalidAddress]
        
        var arr_Video : [VideoR] = []
        var arr_Audio : [AudioRec] = []

    if obj_invalid.count>0
    {
            
    for i in 0..<obj_invalid.count
        {
            arr_Video = VideoR.getallData(RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, name: "\(obj_invalid[i].invalidVideo!).mp4") as! [VideoR]
            print(arr_Video.count)
            
            arr_Audio = AudioRec.getParticularRecordAsPerAudio(RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, audioName: obj_invalid[i].invalidAudio!) as! [AudioRec]
            
            if arr_Video.count>0
            {
                VideoR.deleteVideo(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, objSelectedVideo: arr_Video[i])
            }
            if arr_Audio.count>0
            {
                AudioRec.deleteAudio(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, objSelectedAudio: arr_Audio[i])
            }
                Animation.removeImage(obj_invalid[i].invalidImageName!)
                Animation.removeAudio(filename: obj_invalid[i].invalidAudio!)
                Animation.removeVideo(filename: obj_invalid[i].invalidVideo!)

                RDNInvalidAddress.deleteInvalidData(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, InvalidAddress: obj_invalid[i])
        }
    }
    }
    
    func checkfordatain_addressvisited(caseid:String)
    {
        let obj_addressvisited:[RDNAddressVisited] = RDNAddressVisited.getAllOfflineVisitedAddresses(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, orderId: caseid) as! [RDNAddressVisited]
        
        var arr_Video : [VideoR] = []
        var arr_Audio : [AudioRec] = []
 if obj_addressvisited.count > 0
    {
            
        for i in 0..<obj_addressvisited.count
        {
            arr_Video = VideoR.getallData(RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, name: "\(obj_addressvisited[i].visitedVideoName!).mp4") as! [VideoR]
            print(arr_Video.count)
            
            arr_Audio = AudioRec.getParticularRecordAsPerAudio(RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, audioName: obj_addressvisited[i].visitedAudioName!) as! [AudioRec]
            
            if arr_Video.count>0
            {
                VideoR.deleteVideo(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, objSelectedVideo: arr_Video[i])
            }
            if arr_Audio.count>0
            {
                AudioRec.deleteAudio(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, objSelectedAudio: arr_Audio[i])
            }
            
            Animation.removeImage(obj_addressvisited[i].visitedAddressImage!)
            Animation.removeAudio(filename: obj_addressvisited[i].visitedAudioName!)
            Animation.removeVideo(filename: obj_addressvisited[i].visitedVideoName!)
 
            RDNAddressVisited.deleteAddressVisitedData(context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext, addressVisited: obj_addressvisited[i])

        }
    }
    }
    
    
    private func setup_with_NOTIFICATION(bgcolor:UIColor,title:String,txtcolor:UIColor)
    {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        loaderOverlayView = UIView.init(frame: CGRect.zero)
        
        loaderOverlayView = UIView.init(frame: CGRect.init(x: 0, y: 20, width:(appDelegate.window?.frame.size.width)! , height: 60))
        loaderOverlayView.backgroundColor = bgcolor
        
        let lbl_text: UILabel = UILabel()
        lbl_text.frame = CGRect.init(x: 10, y: 0, width: (appDelegate.window?.frame.size.width)! - 250, height: 50)
        lbl_text.text = title
        lbl_text.numberOfLines = 2
        lbl_text.font = UIFont.systemFont(ofSize: 18)
        lbl_text.textColor = txtcolor
        loaderOverlayView.addSubview(lbl_text)
        
        let btn: UIButton = UIButton()
        btn.frame = CGRect.init(x: (appDelegate.window?.frame.size.width)! - 130, y: 15, width: 100, height: 30)
        btn.setTitle("Dismiss X", for: .normal)
        btn.backgroundColor = bgcolor
        btn.setstandardcornerradiusfornotification()
        btn.addTarget(self, action: #selector(removeNOTIFICATION), for: .touchUpInside)
        loaderOverlayView.addSubview(btn)
        
        let btn_undo: UIButton = UIButton()
        btn_undo.frame = CGRect.init(x: (appDelegate.window?.frame.size.width)! - 250, y: 15, width: 100, height: 30)
        btn_undo.setTitle("View", for: .normal)
        btn_undo.setstandardcornerradiusfornotification()
        btn_undo.backgroundColor = bgcolor
        btn_undo.addTarget(self, action: #selector(viewnotification), for: .touchUpInside)
        loaderOverlayView.addSubview(btn_undo)
    }
    
    @objc func viewnotification()
    {
       // marknotificationread()
        RDN_notificationstatusupdate.marknotificationread(notificationid: receivednotification_id)

        
        loaderOverlayView.removeFromSuperview()

        var arr_RunSheet:[RDNRunSheet] = RDNRunSheet.getAddressAsPerOrder(orderID: orderid, context: RDN_DatabaseManagerClass.sharedInstance.managedObjectContext) as! [RDNRunSheet]
        
        if arr_RunSheet.count > 0
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //init the firstVC
            let firstVC = APPDELEGATE.mainViewController?.viewControllers.last!
            let secondVC = storyboard.instantiateViewController(withIdentifier: "updates") as! RDN_caseupdate
            secondVC.obj_runsheet = arr_RunSheet[0]
            secondVC.str_viewtype = "update_pn"
            firstVC?.addChildViewController(secondVC)
            secondVC.view.center = (firstVC?.view.center)!
            firstVC?.view.addSubview(secondVC.view)
            secondVC.didMove(toParentViewController: firstVC)
        }
    else
        {
            Animation.showToastMessage(message: "Case id not assigned", contView: (APPDELEGATE.window?.rootViewController)!)
        }
    }
    
    @objc func removeNOTIFICATION_ASSIGN()
    {
       // marknotificationread()
        RDN_notificationstatusupdate.marknotificationread(notificationid: receivednotification_id)

        loaderOverlayView.removeFromSuperview()
        
        if  ((APPDELEGATE.mainViewController?.viewControllers.last! .isKind(of: RDN_Dashboard.self))! )
        {
            let objcurrentvc = APPDELEGATE.mainViewController?.viewControllers.last as! RDN_Dashboard
            
            objcurrentvc.getdatarunsheet()
        }

        //        UIApplication.shared.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber - 1
    }

    @objc func removeAGENT_NOTIFICATION()
    {
       // marknotificationread()
        RDN_notificationstatusupdate.marknotificationread(notificationid: receivednotification_id)

        loaderOverlayView.removeFromSuperview()
        
        /*
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //init the firstVC
        let firstVC = APPDELEGATE.mainViewController?.viewControllers.last!
        let secondVC = storyboard.instantiateViewController(withIdentifier: "agentnotification") as! RDN_agentnotification
        //secondVC.str_agentmessage = agentnotificationmessage
        firstVC?.addChildViewController(secondVC)
        secondVC.view.center = (firstVC?.view.center)!
        firstVC?.view.addSubview(secondVC.view)
        secondVC.didMove(toParentViewController: firstVC)
        */
        
    }

    
    @objc func removeNOTIFICATION()
    {
        loaderOverlayView.removeFromSuperview()
       // marknotificationread()
        RDN_notificationstatusupdate.marknotificationread(notificationid: receivednotification_id)

//        UIApplication.shared.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber - 1
    }

    
    
    
    
    func remove()
    {
        loaderOverlayView.removeFromSuperview()
    }
    
    @objc func undo()
    {
        loaderOverlayView.removeFromSuperview()

        let dict:NSDictionary = ["perform":"undo"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "undodelete"), object: dict)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "personalitem_table"), object: dict)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "personalitem_matrix"), object: dict)

    }
    @objc func dismiss()
    {
        loaderOverlayView.removeFromSuperview()
        
        let dict:NSDictionary = ["perform":"delete"]

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "undodelete"), object: dict)

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "personalitem_table"), object: dict)

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "personalitem_matrix"), object: dict)

    }
    
    // MARK:- Public
    public func show_success(title:String)
    {
        if loaderOverlayView != nil
        {
            DispatchQueue.main.async {
                if let window = UIApplication.shared.delegate?.window
                {
                    if self.loaderOverlayView.isDescendant(of: window!)
                    {
                       self.loaderOverlayView.removeFromSuperview()
                        self.loaderOverlayView = nil
                    }
                }

               // self.loaderOverlayView.removeFromSuperview()
            }
            

        }
        DispatchQueue.main.async(execute: {
            self.setup(bgcolor: UIColor.RDN_banner_green(), title: title, txtcolor: UIColor.white)
        
    
        if let window = UIApplication.shared.delegate?.window
        {
            window!.addSubview(self.loaderOverlayView)
        }
        })
    }
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------
    public func show_NOTIFICATION_ASSIGN(title:String,notificationid:String)
    {
        updatenotificationid(id: notificationid)

        if loaderOverlayView != nil
        {
            loaderOverlayView.removeFromSuperview()
            loaderOverlayView = nil
            
        }
        DispatchQueue.main.async(execute: {
            
            self.setup_with_ASSIGN(bgcolor: UIColor.RDN_banner_green(), title: title, txtcolor: UIColor.white)
            
            if let window = UIApplication.shared.delegate?.window
            {
                window!.addSubview(self.loaderOverlayView)
            }
        })
    }
    
    
    public func show_NOTIFICATION_AGENT_NOTIFICATION(title:String,notificationid:String)
    {
        updatenotificationid(id: notificationid)

        if loaderOverlayView != nil
        {
            loaderOverlayView.removeFromSuperview()
            loaderOverlayView = nil
            
        }
        DispatchQueue.main.async(execute: {
            
            
            self.setup_with_AGENT_NOTIFICATION(bgcolor: UIColor.RDN_banner_green(), title: title, txtcolor: UIColor.white)
            
            
            if let window = UIApplication.shared.delegate?.window
            {
                window!.addSubview(self.loaderOverlayView)
            }
        })
    }
    
    public func show_NOTIFICATION_HOLD_CLOSE(title:String,caseid:String,notificationid:String)
    {
        updatenotificationid(id: notificationid)

        if loaderOverlayView != nil
        {
            loaderOverlayView.removeFromSuperview()
            loaderOverlayView = nil
        }
        DispatchQueue.main.async(execute: {
            
            if self.orderid_close_hold != ""
            {
                self.orderid_close_hold = ""
            }
            self.orderid_close_hold = caseid

            self.setup_with_HOLD_CLOSE(bgcolor: UIColor.RDN_header_btn_red(), title:"\(caseid) - \(title)", txtcolor: UIColor.white)
            
            if let window = UIApplication.shared.delegate?.window
            {
                window!.addSubview(self.loaderOverlayView)
            }
        })
    }
    
    
    /**
     - USE:
        - To store notificationid so notification list can be updated with read and unread . This id will be sent in API "markNotificationRead"
    */
    func updatenotificationid(id:String)
    {
        if receivednotification_id != ""
        {
            receivednotification_id = ""
        }
        receivednotification_id = id
    }
    
    public func show_NOTIFICATION_UPDATE(title:String,caseid:String,notificationid:String)
    {
        updatenotificationid(id: notificationid)
        
        if loaderOverlayView != nil
        {
            loaderOverlayView.removeFromSuperview()
            loaderOverlayView = nil
            
        }
        DispatchQueue.main.async(execute: {
            if self.orderid != ""
            {
                self.orderid = ""
            }
            self.orderid = caseid
            
            self.setup_with_NOTIFICATION(bgcolor: UIColor.RDN_banner_green(), title:"\(caseid) - \(title)", txtcolor: UIColor.white)
            
            if let window = UIApplication.shared.delegate?.window
            {
                window!.addSubview(self.loaderOverlayView)
            }
        })
    }

    //-----------------------------------------------------------------------------------------------------------------------------------
    /*
    public func show_inprogress(title:String)
    {
        if loaderOverlayView != nil
        {
            loaderOverlayView.removeFromSuperview()
            loaderOverlayView = nil


        }
        DispatchQueue.main.async(execute: {
            self.setup(bgcolor: UIColor.RDN_banner_blue(), title: title, txtcolor: UIColor.white)
        
        
        if let window = UIApplication.shared.delegate?.window
        {
            window!.addSubview(self.loaderOverlayView)
        }
        })
    }
    */
    public func show_deleted(title:String)
    {
        if loaderOverlayView != nil
        {
            loaderOverlayView.removeFromSuperview()
            loaderOverlayView = nil
            
            
        }
        DispatchQueue.main.async(execute: {
            self.setup_with_undo(bgcolor: UIColor.RDN_header_btn_red(), title: title, txtcolor: UIColor.white)
            
            
            if let window = UIApplication.shared.delegate?.window
            {
                window!.addSubview(self.loaderOverlayView)
            }
        })
    }

    /*
    func createdictfor_readnotification()-> String
    {
        let dictapns:NSMutableDictionary = [:]
        dictapns.setValue(receivednotification_id, forKey: "notification_id")
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictapns, options: JSONSerialization.WritingOptions.prettyPrinted)
            // now you can export "jsonData" to a file
            let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
            //print(jsonString)
            return jsonString
        }
        catch
        {
            print(error)
            return "Error In Json"
        }
    }
    
    /**
     - Api call updated the notification as read .
     */
    
    func marknotificationread()
    {
        let queue1Offline = DispatchQueue(label: "com.company.app.queue1", attributes: .concurrent)
        let group = DispatchGroup()
        // Group for condition report
        group.enter()
        queue1Offline.async {
            let str_jsonString = self.createdictfor_readnotification()
            if(str_jsonString == "Error In Json")
            {
                group.leave()
            }
            else
            {
                let dict_notificationread:NSMutableDictionary = [:]
                dict_notificationread.setValue(str_jsonString, forKey: "jsonString")
                dict_notificationread.setValue("markNotificationRead", forKey: "ServerAppend")
                
                let WebServiceInterface = RDN_postWebServiceInterface()
                _ = try! WebServiceInterface.callWebRequestWithInputParameter(dict_parameters: RDNCommonApi.createDictForPostingData(dict_Append: dict_notificationread), completion: { (result, error) -> (Void) in
                    if result != nil
                    {
                        print(result!)
                        
                        if let badge = (result as! NSDictionary).value(forKey: "badge")
                        {
                            UIApplication.shared.applicationIconBadgeNumber = badge as! Int
                        }
                        
                        group.leave()
                    }
                    
                    if error != nil {
                        print("error in submission")
                        print("#1 error\(String(describing: error))")
                        DispatchQueue.main.async
                            {
                        }
                        return
                        
                    }
                })
            }
        }
    }
    */
    
//    public func hide() {
//        
//        loaderOverlayView.removeFromSuperview()
//        
//    }
}








/**
 Class Purpose:
- 1: All extensions are created in this class
- 2: Animation on buttons
- 3: Converting string to number OR other concersions are in this class
- 4: Fetching alues from PLIST and displaying it in popover . Method is in this class
- 5: Image logic saveing in Db , getting path 
- 6: Image watermark and text on image logic
- 7: Toast message and bounce effect on buttons
- 8: RDN button color corner radius and basic stuff used in whole app is done in this . 
*/







class Animation: NSObject
{
    
    
    var str_locationNameDate:String = ""
    class func resizeImage(image:UIImage,size:CGSize) ->UIImage
    {
        
        //let sizeconvert:CGSize = CGSize.init(width: 500, height: 300)
        UIGraphicsBeginImageContextWithOptions(size,false,0.0)
        image .draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        let scaledImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        return scaledImage;
    }
    
    // -----------------------------
    
   class func rightLayer(view:UIView)->CALayer
    {
        let rightLayer = CALayer()
        rightLayer.frame = CGRect(x: view.frame.size.width - 1, y: 0, width: 1, height: view.frame.size.height - 14)
        rightLayer.backgroundColor = UIColor.RDN_LineColor().cgColor
        return rightLayer
    }
    
    class func leftLayer(view:UIView)->CALayer
    {
        let leftLayer = CALayer()
        leftLayer.frame = CGRect(x:  0, y: 0, width: 1, height: view.frame.size.height - 14)
        leftLayer.backgroundColor = UIColor.RDN_LineColor().cgColor
        return leftLayer
    }
    
    class func topLayer(view:UIView)->CALayer
    {
        let topLayer = CALayer()
        topLayer.frame = CGRect(x:  0, y: 0, width: view.frame.size.width, height: 1)
        topLayer.backgroundColor = UIColor.RDN_LineColor().cgColor
        return topLayer
    }
    class func bottomLayer(view:UIView)->CALayer
    {
        let topLayer = CALayer()
        topLayer.frame = CGRect(x:  0, y: view.frame.size.height - 1, width: view.frame.size.width, height: 1)
        topLayer.backgroundColor = UIColor.RDN_LineColor().cgColor
        return topLayer
    }


    
    // -----------------------------

    
    
    class func getStringCount(string:String)->Int
    {
        print(string.characters.count)
        return string.characters.count
    }
    
    class func changeStatusBarColor(colorName:String)
    {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if colorName == "white"
        {
            statusBar.backgroundColor = UIColor.clear
            UIApplication.shared.statusBarStyle = .default
        }
        else
        {
            statusBar.backgroundColor = UIColor.RDN_StatusBarColor()
            UIApplication.shared.statusBarStyle = .lightContent
        }
    }
    
    class func resizeOriginalBy()->CGFloat
    {
        var resizeOriginalBy:CGFloat = CGFloat()
        resizeOriginalBy = 10.0
        return resizeOriginalBy
    }
    
    
    class func getPickerValues(resourceName:String)-> NSMutableArray
    {
        var ArrayRoot: NSMutableArray?
        if let path = Bundle.main.path(forResource: resourceName, ofType: "plist")
        {
            ArrayRoot = NSMutableArray(contentsOfFile: path)
        }
        if ArrayRoot != nil
        {
            return ArrayRoot!
        }
        else
        {
            return ArrayRoot!
        }
    }
    
   class func returnBoldString(str:String)->NSMutableAttributedString
    {
        let myAttribute = [ NSFontAttributeName: UIFont.boldSystemFont(ofSize: 28.0) ]
        
        let myString = NSMutableAttributedString(string: str, attributes: myAttribute )
        return myString
    }
    class func returnBoldString_dashboard(str:String)->NSMutableAttributedString
    {
        let myAttribute = [ NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20.0) ]
        
        let myString = NSMutableAttributedString(string: str, attributes: myAttribute )
        return myString
    }
    
//    class func returnBoldString(str:String)->NSMutableAttributedString
//    {
//        let myAttribute = [ NSFontAttributeName: UIFont(name: "Helvetica", size: 28.0)! ]
//        
//        let myString = NSMutableAttributedString(string: str, attributes: myAttribute )
//        return myString
//    }
   class func returnNormal(str:String)->NSMutableAttributedString
    {
        let myAttribute = [ NSFontAttributeName: UIFont(name: "Helvetica", size: 25.0)! ]
        
        let myString = NSMutableAttributedString.init(string: str, attributes: myAttribute)
            //NSMutableAttributedString(string: str, attributes: myAttribute )
        return myString
    }
    
    class func returnNormal_dashboard(str:String)->NSMutableAttributedString
    {
        let myAttribute = [ NSFontAttributeName: UIFont(name: "Helvetica", size: 18.0)! ]
        
        let myString = NSMutableAttributedString.init(string: str, attributes: myAttribute)
        //NSMutableAttributedString(string: str, attributes: myAttribute )
        return myString
    }
    
    class func getConvertedValueStringToNumber(str:String)->NSNumber
    {
        var numb:NSNumber = NSNumber()
        
        if(str == "N")
        {
            numb = 0
        }
        else if(str == "Y")
        {
            numb = 1
        }
        else
        {
            numb = -1
        }
        
        return numb
    }
    class func getConvertedValueNumberToString(num:NSNumber)->String
    {
        var str:String = String()
        if(num == 0)
        {
          str = "N"
        }
        else
        {
            str = "Y"
        }
        return str
    }
    
    
    class func getPickerValuesDict(resourceName:String)-> NSMutableDictionary
    {
        var dictRoot: NSMutableDictionary?
        if let path = Bundle.main.path(forResource: resourceName, ofType: "plist") {
            dictRoot = NSMutableDictionary(contentsOfFile: path)
        }
        
        if dictRoot != nil
        {
            return dictRoot!
        }
        else
        {
            return dictRoot!
        }
    }
    
    class func showAgentNotes(view:UIViewController,agentNote:String)
    {
        
        let alert = RDNCustomAlertController()
        alert.showCloseButton = false
        alert.addButton("OK")
        {
        }
        alert.showInfo(localisedText(text: "ADDITIONAL_INFO"), subTitle:"\(agentNote)" )
        /*
        let alert = UIAlertController(title: localisedText(text: "ADDITIONAL_INFO"), message: "\(agentNote)", preferredStyle: UIAlertControllerStyle.alert)
    
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
    
        view.present(alert, animated: true, completion: nil)
        */
    }
    
    class func getCapitalString(str:String)  ->String
    {
        return str.uppercase
    }
    
    class func saveImageInDocD(fileName:String,image:UIImage)
    {
        var result:String = ""
        
        let fileURL = getAbsolutePath("\(fileName).png")

        if (try? UIImageJPEGRepresentation(image, 1.0)!.write(to: URL(fileURLWithPath: (fileURL?.path)!), options: [.atomicWrite])) != nil
        {
            print("file saved")
            result = "file saved"
        }
        else
        {
            print("error saving file")
            result = "error saving file"
        }
        
    }
    
    class func getlicenseplate_statecombined(licensenumber:String , licensestate:String)->String
    {
//        let str_lplate:String = licensenumber
//        let str_lstate:String = licensestate
        var concatinatedstring:String = String()
        if licensestate == "N/A" && licensenumber == "N/A"
        {
            concatinatedstring = "N/A"
        }
        else
        {
         concatinatedstring  = licensenumber
         concatinatedstring = concatinatedstring.appending(" (")
            //String.appending("(")
        concatinatedstring = concatinatedstring.appending(licensestate)
            //String.appending(licensestate)
        concatinatedstring = concatinatedstring.appending(")")
            //String.appending(")")

        print(concatinatedstring)
        }
        return concatinatedstring

    }

    class func saveImageInDocDirectory(fileName:String,image:UIImage)->String
    {
        var result:String = ""
        
        let fileURL = getAbsolutePath("\(fileName).png")
        
        if (try? UIImageJPEGRepresentation(image, 1.0)!.write(to: URL(fileURLWithPath: fileURL!.path), options: [.atomic])) != nil
        {
            print("file saved")
            result = "file saved"
        }
        else
        {
            print("error saving file")
            result = "error saving file"
        }
        return result
    }
    class func addArrowImage(btn:UIButton)->UIImageView
    {
        let imageView:UIImageView = UIImageView.init(frame: CGRect.init(x: btn.frame.size.width-25, y:btn.frame.size.height/2 - 8, width: 16, height: 16))
        imageView.image = UIImage.init(named: "arrowImage")
        return imageView
    }
    
    class func add_updates_image(btn:UIButton,value:Int)->UILabel
    {
        let lbl_updates_count:UILabel = UILabel.init(frame: CGRect.init(x: btn.frame.size.width - 50 , y:btn.frame.size.height/2 - 12, width: 25, height: 25))
        
        lbl_updates_count.corner_radius_updates(by: 5)
        lbl_updates_count.backgroundColor = UIColor.RDN_BlueColor()
        lbl_updates_count.textAlignment = .center
        lbl_updates_count.textColor = UIColor.white
        lbl_updates_count.text = String(value)
        //imageView.image = UIImage.init(named: "arrowImage")
        
        return lbl_updates_count
    }
    
    
    
    class func getAbsolutePath(_ forString: String!) -> URL!
    {
        let documentsDirectoryURL = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentsDirectoryURL.appendingPathComponent(forString!)
        print(forString)
        print(forString!)
        return fileURL
    }
    
   class func printTimestamp() ->NSArray
    {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
        var  arr:NSArray = []
        arr = timestamp.components(separatedBy: ",") as NSArray
        print(timestamp)
        return arr
    }
    
    class func getorderidandaddress_dashboardselection(selecteddata:String) ->NSArray
    {
//        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
        var  arr:NSArray = []
        arr = selecteddata.components(separatedBy: "/{") as NSArray
        //print(timestamp)
        return arr
    }

    
    
    
    class func getImageFromDB(fileURL:URL) -> UIImage
    {
        if !FileManager.default.fileExists(atPath: fileURL.path)
        {
            //print("no file")
        }
        else
        {
            //print("file already exists")
        }
        return UIImage(contentsOfFile: fileURL.path)!
    }
    
    class func removeAudio(filename:String!)
    {
        let fileManager = FileManager.default
        let fileURL = self.getAbsolutePath("\(filename!).m4a")
        if fileManager.fileExists(atPath: fileURL!.path) {
            //Remove the path
            try! fileManager.removeItem(atPath: fileURL!.path)
        } else {
            //File not available
        }
    }
    class func removeVideo(filename:String!)
    {
        print(filename)
        let fileManager = FileManager.default
        let fileURL = self.getAbsolutePath("\(filename!).mp4")
        if fileManager.fileExists(atPath: fileURL!.path) {
            //Remove the path
            try! fileManager.removeItem(atPath: fileURL!.path)
        } else {
            //File not available
        }
    }
    
    
    class func removeImage(_ fileName: String!)
    {
        print("animation image\(fileName!)")
        let fileManager = FileManager.default
        let fileURL = self.getAbsolutePath("\(fileName!).png")
        if fileManager.fileExists(atPath: fileURL!.path) {
            //Remove the path
            try! fileManager.removeItem(atPath: fileURL!.path)
        } else {
            //File not available
        }
    }
    
    /*
 
     let resizeBy:CGFloat = 3.0
     inImage = Animation.resizeImage(image: inImage, size: CGSize.init(width: inImage.size.width/resizeBy, height: newImage.size.height/resizeBy))
 */
    
    class func textToImageExterior(drawText: String, inImage: UIImage, atPoint:CGPoint , fontSize:CGFloat)->UIImage
    {
        
        let textColor: UIColor = UIColor.white
        let textFont: UIFont   = UIFont(name: "Helvetica Bold", size: fontSize)!
        
        UIGraphicsBeginImageContext(inImage.size)
        
        
        let textFontAttributes = [ NSFontAttributeName: textFont, NSForegroundColorAttributeName: textColor,NSBackgroundColorAttributeName: UIColor.black]
        
        inImage.draw(in: CGRect(x: 0, y: 0, width: inImage.size.width, height: inImage.size.height))
        
        let rect: CGRect = CGRect(x: atPoint.x, y: atPoint.y, width: inImage.size.width, height: inImage.size.height)
        
        drawText.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return newImage
        
    }
    
    
    
    class func textToImage(drawText: String, inImage: UIImage, atPoint:CGPoint , fontSize:CGFloat)->UIImage
    {
        
        
        let textColor: UIColor = UIColor.white
        let textFont: UIFont   = UIFont(name: "Helvetica Bold", size: fontSize)!

        UIGraphicsBeginImageContext(inImage.size)
        
        
        let textFontAttributes = [ NSFontAttributeName: textFont, NSForegroundColorAttributeName: textColor,NSBackgroundColorAttributeName: UIColor.black]
        
        inImage.draw(in: CGRect(x: 0, y: 0, width: inImage.size.width, height: inImage.size.height))
        
        let rect: CGRect = CGRect(x: atPoint.x, y: atPoint.y, width: inImage.size.width, height: inImage.size.height)
        
        drawText.draw(in: rect, withAttributes: textFontAttributes)
        
        var newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
       
       
        UIGraphicsEndImageContext()
        
        return newImage
        
    }
    
    class func drawImage(image foreGroundImage:UIImage, inImage backgroundImage:UIImage, atPoint point:CGPoint) -> UIImage
    {
        print(foreGroundImage)
        UIGraphicsBeginImageContextWithOptions(backgroundImage.size, false, 0.0)
        
        backgroundImage.draw(in: CGRect.init(x: 0, y: 0, width:  backgroundImage.size.width, height:  backgroundImage.size.height))
        foreGroundImage.draw(in: CGRect.init(x: 0, y: 0, width:  foreGroundImage.size.width, height:  foreGroundImage.size.height))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    class func getCurrentDateAndTimeForImageSave() ->String
    {
        let todaysDate:Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy, hh:mm:ss a zzz"

//        dateFormatter.dateFormat = "dd-MMM-yyyy,hh:mm:ss a zzz E"

//        "MMM dd, yyyy,hh:mm:ss a zzz E"
        //"hh:mm: a zzz E, MMM dd, yyyy"  // MST
        //"dd MMMM yyyy h:mm:ss a"
        let DateInFormat:String = dateFormatter.string(from: todaysDate)
        return DateInFormat
    }
    class func getCurrentDate_newformat()->String
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        let result = formatter.string(from: date)
        return result
        
    }

    class func getCurrentDate()->String
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        let result = formatter.string(from: date)
        return result

    }
    
    class func getCurrentTime_newformat() ->String   // for police call in time
    {
        let todaysDate:Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        
        let DateInFormat:String = dateFormatter.string(from: todaysDate)
        return DateInFormat
    }
    class func getCurrentTime() ->String   // for police call in time
    {
        let todaysDate:Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a zzz E"
        
        let DateInFormat:String = dateFormatter.string(from: todaysDate)
        return DateInFormat
    }
    
    class func getUTCDate()->String
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd "
        let result = formatter.string(from: date)
        return result
    }
    class func getUTCdateTime()->String
    {
        let todaysDate:Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.init(abbreviation: "UTC")! as TimeZone
        //dateFormatter.dateFormat = "dd-MMM-yyyy,hh:mm:ss a zzz E"
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        
        let DateInFormat:String = dateFormatter.string(from: todaysDate)
        return DateInFormat
    }
    
    class func getUTC_currentdateTime()->String
    {
        let todaysDate:Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.init(abbreviation: "UTC")! as TimeZone
        //dateFormatter.dateFormat = "dd-MMM-yyyy,hh:mm:ss a zzz E"
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let DateInFormat:String = dateFormatter.string(from: todaysDate)
        return DateInFormat
    }

    
   class func getscratchcodefromstring(str_name:String)->String
    {
        let arr_scratchcode = str_name.components(separatedBy: " ")
        return arr_scratchcode[0]
    }

    
    
    func getLocationname(_ lat:Double , long:Double  )
    {
        let location = CLLocation(latitude: lat, longitude: long) //changed!!!
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            
            if error != nil
            {
                //                println("Reverse geocoder failed with error" + error.localizedDescription)
                return
            }
            
            if placemarks!.count > 0
            {
                let pm = placemarks![0]
                var dateAndTime:String
                dateAndTime = Animation.getCurrentDateAndTimeForImageSave()
                print(pm)
                
                print(pm.locality!)
                let location:String =  (pm.locality)! +  (", ") + pm.administrativeArea! + (" ") + pm.postalCode! + (" ")
                
                var final:String = String()
                final = "\(location) \(dateAndTime)"

//                final = "\(dateAndTime) , \(location)"
                //dateAndTime + location
                
                
                self.str_locationNameDate = final
            }
                
            else
            {
                print("Problem with the data received from geocoder")
            }
        })
    }

    
    
    
    class func animateButtons(_ btn:UIButton)
    {
        let fullRotation = CGFloat(M_PI * 2)
        
        let duration = 1.0
        let delay = 0.0
        let options = UIViewKeyframeAnimationOptions()
        
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: options, animations: {
            // each keyframe needs to be added here
            // within each keyframe the relativeStartTime and relativeDuration need to be values between 0.0 and 1.0
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: {
                // start at 0.00s (5s × 0)
                // duration 1.67s (5s × 1/3)
                // end at   1.67s (0.00s + 1.67s)
                btn.transform = CGAffineTransform(rotationAngle: 1/3 * fullRotation)
            })
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {
                btn.transform = CGAffineTransform(rotationAngle: 2/3 * fullRotation)
            })
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {
                btn.transform = CGAffineTransform(rotationAngle: 3/3 * fullRotation)
            })
            
        }, completion: {finished in
            // any code entered here will be applied
            // once the animation has completed
            
        })
    }
    
    class func animateAddSubviewPopup(_ view:UIView)
    {
        view.layer.cornerRadius = 1.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.black.cgColor
        
        UIView.animate(withDuration: 1.5, animations: {
            view.alpha = 1.0
        })
    }

    
    class func animateAddSubview(_ view:UIView)
    {
        view.layer.cornerRadius = 5.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.black.cgColor
        
        UIView.animate(withDuration: 1.5, animations: {
            view.alpha = 1.0
        })
    }
    
    
    // MARK: Source - http://www.appcoda.com/view-animation-in-swift/
    class func showBounceEffect(_ btn:UIButton)
    {
        let bounds = btn.bounds
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveEaseIn, animations: {
            btn.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 5, height: bounds.size.height)
        }) { (true) in
            btn.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
        }
        
    }
    
    
    class func showToastMessage(message:String,contView:UIViewController)
    {
        
        
        let toastLabel = UILabel.init(frame: CGRect.init(x: contView.view.frame.size.width/2 - 150, y: contView.view.frame.size.height/4, width: 300, height: 35))
        print(toastLabel.frame)
        if contView .isKind(of: RDN_Checklistview.self)
        {
            toastLabel.backgroundColor = UIColor.RDN_btn_green()
        }
        else
        {
            toastLabel.backgroundColor = UIColor.red
        }
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center
        contView.view.addSubview(toastLabel)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        UIView.animate(withDuration: 4.0, delay: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: {
            toastLabel.alpha = 0.0
            
        })
    }
    
    

    
    
    class func get_first_frame_video(path:NSURL) ->UIImage
    {
        let filePath: URL = path as URL
        var thumbnail:UIImage = UIImage()
        do {
            let asset = AVURLAsset(url: filePath , options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
            thumbnail = UIImage(cgImage: cgImage)
            
            // thumbnail here
            
        } catch let error
        {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
        }
        return thumbnail
    }
    
    /**
     - This method is used to check if video persmissions are allowed or not . if denied then video will
     */
   class func checkPermissions() ->String
    {
        var str_permission:String = ""
        let authStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        
        switch authStatus
        {
        case .authorized:
            //setupCamera()
            str_permission = "allowed"
        case .denied:
            //alertPromptToAllowCameraAccessViaSetting()
            str_permission = "denied"
            
        case .notDetermined :
            str_permission = "notDetermined"
            
        default: break
            // Not determined fill fall here - after first use, when is't neither authorized, nor denied
            // we try to use camera, because system will ask itself for camera permissions
           // setupCamera()
        }
        
        return str_permission
    }

    
    
    
    
    
    
}
