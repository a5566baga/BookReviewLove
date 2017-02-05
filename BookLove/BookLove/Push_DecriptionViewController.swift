//
//  Push_DecriptionViewController.swift
//  BookLove
//
//  Created by ben on 16/12/21.
//  Copyright © 2016年 张增强. All rights reserved.
//

import UIKit

typealias Push_DecriptionViewControllerBlock = (_ description:String)->Void

class Push_DecriptionViewController: UIViewController {

    var textView:JVFloatLabeledTextView?
    var callBack:Push_DecriptionViewControllerBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.textView = JVFloatLabeledTextView(frame: CGRect(x: 8, y: 58, width: SCREEN_WIDTH-16, height: SCREEN_HEIGHT-58-16))
        self.view.addSubview(self.textView!)
        self.textView?.placeholder = "  你可以在这里写评论、吐槽~~~"
        self.textView?.font = UIFont(name: MY_FONT, size: 17)
        self.textView?.tintColor = UIColor.gray
        
//        XKeyBoard.registerHide(self)
//        XKeyBoard.registerShow(self)
        
        self.textView?.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotification(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func sure() -> Void {
        self.callBack!((self.textView?.text)!)
        self.dismiss(animated: true, completion: {() -> Void in
            
        })
        
    }
    func close() -> Void {
        self.dismiss(animated: true, completion: {() -> Void in
            
        })
    }
    
    /**
     *  实现键盘出现和消失的方法
     */
    func keyboardWillShowNotification(notification:NSNotification) {
        let rect = XKeyBoard.returnWindow(notification as Notification!)
        self.textView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: rect.size.height, right: 0)
    }
    func keyboardWillHideNotification(notification:NSNotification) {
        self.textView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }


}
