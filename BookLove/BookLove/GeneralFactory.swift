//
//  GeneralFactory.swift
//  BookLove
//
//  Created by ben on 16/11/4.
//  Copyright © 2016年 张增强. All rights reserved.
//

import UIKit

class GeneralFactory: NSObject {
    static func addTitleWithTitle(target:UIViewController, title1:String = "关闭", title2:String = "确认") -> Void {
        let btn1 = UIButton(frame: CGRect(x: 10, y: 25, width: 40, height: 20))
        btn1.setTitle(title1, for: .normal)
        btn1.setTitleColor(MAIN_COLOR, for: .normal)
        btn1.titleLabel?.font = UIFont(name: MY_FONT, size: 18)
        btn1.contentHorizontalAlignment = .center
        btn1.tag = 1234
        target.view.addSubview(btn1)
        
        let btn2 = UIButton(frame: CGRect(x: SCREEN_WIDTH - 50, y: 25, width: 40, height: 20))
        btn2.setTitle(title2, for: .normal)
        btn2.setTitleColor(MAIN_COLOR, for: .normal)
        btn2.titleLabel?.font = UIFont(name: MY_FONT, size: 18)
        btn2.contentHorizontalAlignment = .center
        btn2.tag = 1235
        target.view.addSubview(btn2)
        
        btn1.addTarget(target, action: Selector("close"), for: .touchUpInside)
        btn2.addTarget(target, action: Selector("sure"), for: .touchUpInside)
        
    }
}
