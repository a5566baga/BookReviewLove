//
//  photoPickerViewController.swift
//  BookLove
//
//  Created by ben on 16/12/7.
//  Copyright © 2016年 张增强. All rights reserved.
//

import UIKit

protocol PhotoPickerDelegate {
    func getImageFromPicker(image:UIImage)
}

class photoPickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var alertView:UIAlertController?
    var picker:UIImagePickerController?
    var delegate:PhotoPickerDelegate?
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        self.view.backgroundColor = UIColor.clear
        
        //pickerVC设置
        self.picker = UIImagePickerController()
        self.picker?.allowsEditing = false
        self.picker?.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implment")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if self.alertView == nil {
            self.alertView = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            self.alertView?.addAction(UIAlertAction(title: "从相册选择", style: .default, handler: { (action) in
                self.openPhote()
            }))
            self.alertView?.addAction(UIAlertAction(title: "打开相机", style: .default, handler: { (action) in
                self.openCamera()
            }))
            self.alertView?.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (action) in
                self.dismiss(animated: true, completion: { 
                    
                })
            }))
            
            self.present(self.alertView!, animated: true, completion: {
            })
        }
    }
    
    /**
     * 打开相册
     */
    func openPhote() -> Void {
        self.picker?.sourceType = .photoLibrary
        self.present(self.picker!, animated: true, completion: {
            
        })
    }
    
    
    /**
     * 打开相机
     */
    func openCamera() -> Void {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.picker?.sourceType = .camera
            self.present(self.picker!
                , animated: true, completion: { 
                    
            })
        }else{
            let alert = UIAlertController(title: "此机型相机无法打开", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (action) in
                self.dismiss(animated: false, completion: {
                    
                })
            }))
            self.present(alert, animated: true, completion: {
            })
            
        }
    }
    
    /**
     * 相册取消选择回调方法
     */
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.picker?.dismiss(animated: true, completion: { 
            self.dismiss(animated: true, completion: {
            })
        })
    }
    /**
     * 相册选择好照片的回调方法
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.picker?.dismiss(animated: true, completion: { 
            self.dismiss(animated: true, completion: { 
                self.delegate?.getImageFromPicker(image: image)
            })
        })
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
