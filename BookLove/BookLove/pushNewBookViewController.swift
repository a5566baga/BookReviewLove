//
//  pushNewBookViewController.swift
//  BookLove
//
//  Created by ben on 16/11/4.
//  Copyright © 2016年 张增强. All rights reserved.
//

import UIKit

class pushNewBookViewController: UIViewController, BookTitleDelegate, PhotoPickerDelegate, VPImageCropperDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var BookTitle:BookTitleView?
    //tableView
    var tableview:UITableView?
    //标题数组
    var titleArray:Array<String> = []
    var Book_Title = ""
    //添加星星
    var Score:LDXScore?
    var showScore = false
    //定义回调的参数
    var type = "文学"
    var detailType = "文学"
    //书的描述
    var book_description = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        BookTitle = BookTitleView(frame: CGRect(x: 0, y: 40, width: SCREEN_WIDTH, height: 160))
        BookTitle?.delegate = self
        self.view.addSubview(BookTitle!)
        
        self.tableview = UITableView(frame: CGRect(x:0,y:200, width:SCREEN_WIDTH, height:SCREEN_HEIGHT-200), style: .grouped)
        //使tableview下面没有内容的cell线消失
        self.tableview?.tableFooterView = UIView()
        self.tableview?.delegate = self;
        self.tableview?.dataSource = self;
        self.tableview?.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        self.tableview?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableview!)
        self.titleArray = ["标题", "评分", "分类", "书评"]
        
        self.Score = LDXScore(frame: CGRect(x: 100, y: 10, width: 100, height: 22))
        self.Score?.isSelect = true
        self.Score?.normalImg = UIImage(named: "btn_star_evaluation_normal")
        self.Score?.highlightImg = UIImage(named: "btn_star_evaluation_press")
        self.Score?.max_star = 5
        self.Score?.show_star = 0
        
    }
    
    /**
     实现协议方法
    */
    func choiceCover() {
        let vc = photoPickerViewController()
        vc.delegate = self
        self.present(vc, animated: true, completion: {
        })
        
    }

    /**
     * 实现PhotoPickerDelegate协议方法
     */
    func getImageFromPicker(image: UIImage) {
        let CroVC = VPImageCropperViewController(image: image, cropFrame: CGRect(x: 0, y: 100, width: SCREEN_WIDTH, height: SCREEN_WIDTH-1.273), limitScaleRatio: 3)
        CroVC?.delegate = self
        self.present(CroVC!, animated: true, completion: {
            
        })
    }
    
    /**
     * 实现VPImageCropperDelegate 协议中的方法
     */
    func imageCropper(_ cropperViewController: VPImageCropperViewController!, didFinished editedImage: UIImage!) {
        self.BookTitle?.BookCover?.setImage(editedImage, for: .normal)
        cropperViewController.dismiss(animated: true, completion: {
            
        })
    }
    func imageCropperDidCancel(_ cropperViewController: VPImageCropperViewController!) {
        cropperViewController.dismiss(animated: true, completion: {
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 对于 关闭 和 确认 方法的声明
    func sure() -> Void {
    }
    
    func close() -> Void {
        self.dismiss(animated: true){
        }
    }
    
    /**
     *  delegate和dataSource的代理方法
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        if(indexPath.row != 1){
            cell.accessoryType = .disclosureIndicator
        }
        cell.textLabel?.text = self.titleArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: MY_FONT, size: 15)
        cell.detailTextLabel?.font = UIFont(name: MY_FONT, size: 13)
        
        var row = indexPath.row
        if self.showScore && row>1{
            row -= 1
        }
        
        switch row {
        case 0:
            cell.detailTextLabel?.text = Book_Title
            break
        case 2:
            cell.detailTextLabel?.text = self.type + "->" + self.detailType
            break
        case 4:
            cell.accessoryType = .none
            let contentView = UITextView(frame: CGRect(x: 4, y: 4, width: SCREEN_WIDTH-8, height: 88))
            contentView.text = self.book_description
            contentView.font = UIFont(name: MY_FONT, size: 14)
            cell.contentView.addSubview(contentView)
            break
        default:
            break
        }
        
        if showScore && indexPath.row == 2{
            cell.contentView.addSubview(self.Score!)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.showScore && indexPath.row > 5 {
            return 88
        }else if !self.showScore && indexPath.row > 4 {
            return 88
        }else{
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableview?.deselectRow(at: indexPath, animated: true)
        var row = indexPath.row
        if row >= 1 && self.showScore{
            row -= 1
        }
        
        switch row {
        case 0:
            self.tableViewSelectTitle()
            break
        case 1:
            self.tableViewSelectScore()
            break
        case 2:
            tableViewSelectType()
            break
        case 3:
            tableViewSelectDescription()
            break
        default:
            break
        }

    }
    
    /**
     *  选择标题
     */
    func tableViewSelectTitle() -> Void {
        let vc = Push_TitleViewController()
        GeneralFactory.addTitleWithTitle(target: vc)
        vc.cllBack = ({(Title:String) -> Void in
            self.Book_Title = Title
            self.tableview?.reloadData()
        })
        self.present(vc, animated: true, completion: {() -> Void in
            vc.textField?.text = self.Book_Title
        })
    }
    
    /**
     *  选择评分
     */
    func tableViewSelectScore() -> Void {
        self.tableview?.beginUpdates()
        
        let tempIndexPath = [NSIndexPath(row: 2, section: 0)]
        if self.showScore{
            self.titleArray.remove(at: 2)
            self.tableview?.deleteRows(at: tempIndexPath as [IndexPath], with: .right)
            self.showScore = false
        }else{
            self.titleArray.insert("", at: 2)
            self.tableview?.insertRows(at: tempIndexPath as [IndexPath], with: .left)
            self.showScore = true
        }
        
        
        self.tableview?.endUpdates()
    }
    
    /**
     *  选择分类
     */
    func tableViewSelectType() -> Void {
        let vc = Push_TypeViewController()
        GeneralFactory.addTitleWithTitle(target: vc)
        
        let btn1 = vc.view.viewWithTag(1234) as? UIButton
        btn1?.setTitleColor(RGB(r: 38, g: 82, b: 67), for: .normal)
        let btn2 = vc.view.viewWithTag(1235) as? UIButton
        btn2?.setTitleColor(RGB(r: 38, g: 82, b: 67), for: .normal)
        
        vc.type = self.type
        vc.detailType = self.detailType
        
        vc.callBack = ({(type:String, detailType:String)->Void in
            self.type = type
            self.detailType = detailType
            self.tableview?.reloadData()
        })
        
        self.present(vc, animated: true, completion: {() -> Void in
            
        })
    }
    
    /**
     *  选择书评
     */
    func tableViewSelectDescription() -> Void {
        let vc = Push_DecriptionViewController()
        GeneralFactory.addTitleWithTitle(target: vc)
        vc.textView?.text = self.book_description
        vc.callBack = ({(description:String)->Void in
            self.book_description = description
            
            if self.titleArray.last == "" {
                self.titleArray.removeLast()
            }
            if description != "" {
                self.titleArray.append("")
            }
            self.tableview?.reloadData()
        })
        
        self.present(vc, animated: true, completion: {() -> Void in
            
        })
    }
}
