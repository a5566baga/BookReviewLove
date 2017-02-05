//
//  BookTitleView.swift
//  BookLove
//
//  Created by ben on 16/12/7.
//  Copyright © 2016年 张增强. All rights reserved.
//

import UIKit

@objc protocol BookTitleDelegate {
    @objc optional func choiceCover()
}

class BookTitleView: UIView {

    //书的默认封面
    var BookCover:UIButton?
    //书名
    var BookName:JVFloatLabeledTextField?
    //书的作者
    var BookEditor:JVFloatLabeledTextField?
    
    weak var delegate:BookTitleDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.BookCover = UIButton(frame: CGRect(x: 10, y: 8, width: 110, height: 141))
        self.BookCover?.setImage(UIImage(named:"Cover"), for: .normal)
        self.BookCover?.addTarget(self, action: #selector(choiceCover), for: .touchUpInside)
        self.addSubview(self.BookCover!)
        
        //设置书名和作者
        self.BookName = JVFloatLabeledTextField(frame: CGRect(x: 128, y: 8+48, width: SCREEN_WIDTH-128-15, height: 30))
        self.BookEditor = JVFloatLabeledTextField(frame: CGRect(x: 128, y: 8+70+40, width: SCREEN_WIDTH-128-15, height: 30))
        
        self.BookName?.placeholder = "书名"
        self.BookEditor?.placeholder = "作者"
        
        self.BookName?.font = UIFont(name: MY_FONT, size: 14)
        self.BookEditor?.font = UIFont(name: MY_FONT, size: 14)
        
        self.BookName?.floatingLabelFont = UIFont(name: MY_FONT, size: 14)
        self.BookEditor?.floatingLabelFont = UIFont(name: MY_FONT, size: 14)
        
        self.BookName?.floatingLabelActiveTextColor = UIColor.black
        self.BookEditor?.floatingLabelActiveTextColor = UIColor.black
        
        self.addSubview(self.BookName!)
        self.addSubview(self.BookEditor!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not implement")
    }
    
    func choiceCover() -> Void {
        self.delegate?.choiceCover!()
    }

}
