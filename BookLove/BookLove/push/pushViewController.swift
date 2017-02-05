//
//  pushViewController.swift
//  BookLove
//
//  Created by ben on 16/11/4.
//  Copyright © 2016年 张增强. All rights reserved.
//

import UIKit

class pushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        setNavBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //设置navBar的view
    func setNavBar() -> Void {
        let navBarView = UIView(frame: CGRect(x: 0, y: -20, width: SCREEN_WIDTH, height: 64))
        navBarView.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.addSubview(navBarView)
        
        let pushBtn = UIButton(frame: CGRect(x: 20, y: 20, width: SCREEN_WIDTH, height: 44))
        pushBtn.setImage(#imageLiteral(resourceName: "plus circle"), for: .normal)
        pushBtn.setTitle("       添加书评", for: .normal)
        pushBtn.setTitleColor(UIColor.black, for: .normal)
        pushBtn.titleLabel?.font = UIFont(name: MY_FONT, size: 18)
        pushBtn.contentHorizontalAlignment = .left
        pushBtn.addTarget(self, action: #selector(pushAction(button:)), for: .touchUpInside)
        navBarView.addSubview(pushBtn)
    }
    
    //添加按钮的相应事件
    func pushAction(button:UIButton) -> Void {
        let pushVC = pushNewBookViewController()
        GeneralFactory.addTitleWithTitle(target: pushVC)
        self.present(pushVC, animated: true){
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
