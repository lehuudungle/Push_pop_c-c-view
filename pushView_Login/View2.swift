//
//  View2.swift
//  pushView_Login
//
//  Created by Admin on 8/31/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class View2: UIViewController {
    
    
    @IBOutlet weak var tfl_User: UITextField!

    @IBOutlet weak var tfl_Pass: UITextField!
    
    @IBOutlet weak var lbl_message: UILabel!
    
    
    
    var users = ["a":"a","1":"1"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    @IBAction func btl_Dangnhap(sender: AnyObject) {
    
        
        tfl_User.resignFirstResponder()
        tfl_Pass.resignFirstResponder()
        reset_message()
        check_empty()
        if let passwork = users[tfl_User.text!]{
            if(passwork == tfl_Pass.text){
                let v3 = self.storyboard?.instantiateViewControllerWithIdentifier("V3")as! View3
                self.navigationController?.pushViewController(v3, animated: true)
            }else{
                lbl_message.text = "sai mật khẩu"
                
            }
            
        }else{
            lbl_message.text = "đăng nhập không thành công"
        }
    }
    func reset_message(){
        lbl_message.text = ""
        
    }
    func check_empty(){
        if(tfl_User.text == "" && tfl_Pass == ""){
            lbl_message.text = "user và passwork rỗng"
        }else if(tfl_User.text == ""){
            lbl_message.text = "user rỗng"
        }else if(tfl_Pass.text == ""){
            lbl_message.text = "passwork rỗng"
        }
    }
    
    
    @IBAction func btl_Dangky(sender: AnyObject) {
        tfl_User.resignFirstResponder()
        tfl_Pass.resignFirstResponder()
        check_empty()
        
        if(check_user()){
            users[tfl_User.text!] = tfl_Pass.text
        }
    }
    
    func check_user() -> Bool{
        for use in users{
            if(use.0 == tfl_User.text){
                lbl_message.text = "Tên đăng nhập đã được sử dụng"
                lbl_message.lineBreakMode = .ByWordWrapping
                lbl_message.numberOfLines = 0
                return false
            }
        }
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        tfl_User.resignFirstResponder()
        tfl_Pass.resignFirstResponder()
                
    }

   }
