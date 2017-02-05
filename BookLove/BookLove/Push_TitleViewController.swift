//
//  Push_TitleViewController.swift
//  BookLove
//
//  Created by ben on 16/12/21.
//  Copyright © 2016年 张增强. All rights reserved.
//

import UIKit

typealias Push_TitleCallBack = (_ Title:String) -> Void
class Push_TitleViewController: UIViewController {

    var textField:UITextField?
    var cllBack:Push_TitleCallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.textField = UITextField(frame: CGRect(x: 15, y: 60, width: SCREEN_WIDTH-30, height: 30))
        self.textField?.placeholder = "书评"
        self.textField?.font = UIFont(name: MY_FONT, size: 15)
        self.textField?.borderStyle = .roundedRect
        self.view.addSubview(self.textField!)
        
        self.textField?.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func sure() -> Void {
        self.cllBack!((self.textField?.text)!)
        self.dismiss(animated: true, completion: {() -> Void in
            
        })
    }
    
    func close() -> Void {
        self.dismiss(animated: true, completion: {() -> Void in
            
        })
    }

}
