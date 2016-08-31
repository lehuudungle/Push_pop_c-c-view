//
//  View3.swift
//  pushView_Login
//
//  Created by Admin on 8/31/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class View3: UIViewController {
    
    
    
    @IBOutlet weak var lbl_p1: UILabel!
    @IBOutlet weak var lbl_p2: UILabel!
    @IBOutlet weak var lbl_dau: UILabel!
    
    @IBOutlet weak var btl_one: UIButton!
    @IBOutlet weak var btl_second: UIButton!
    @IBOutlet weak var btl_three: UIButton!
    
    @IBOutlet weak var lbl_right: UILabel!
    @IBOutlet weak var lbl_wrong: UILabel!
    @IBOutlet weak var lbl_timer: UILabel!
    var kq = 0
    var dau = 0
    var number_1 = 0, number_2 = 0, number_3 = 0
    var dung = 0, sai = 0
    var count_Time = 5
    var times = NSTimer()
    
   
    @IBAction func Click_kq(sender: AnyObject) {
        right_wrong()
        setRandom()

    }
    
    func right_wrong(){
        
        print("number1: \(number_1)")
        print("number1: \(number_2)")
        print("number1: \(number_2)")
        
        if(btl_one.touchInside){
            if(number_1 == kq){
                dung += 1
            }else{
                sai += 1
            }
        }else if(btl_second.touchInside){
            if(number_2 == kq){
                dung += 1
            }else{
                sai += 1
            }
        }else if(btl_three.touchInside){
            if(number_3 == kq){
                dung += 1
            }else{
                sai += 1
            }
        }
        lbl_right.text = String(dung)
        lbl_wrong.text = String(sai)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandom()

    
    }
    
    func setRandom(){
        count_Time = 5
        times.invalidate()
        var random1 = Int(arc4random_uniform(10)) + 1
        var random2 = Int(arc4random_uniform(10)) + 1
        
        lbl_p1.text = String(random1)
        lbl_p2.text = String(random2)
        
        dau = Int(arc4random_uniform(3))
        if(dau == 0){
            lbl_dau.text = "+"
        }else if(dau == 1){
            lbl_dau.text = "-"
        }else{
            lbl_dau.text = "x"
        }
        
        setResult(random1, randomB: random2)
        times = NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: #selector(View3.counter), userInfo: nil, repeats: true)
    }
    func counter(){
        if(count_Time == 0){
            sai += 1
            lbl_wrong.text = String(sai)
            setRandom()
        }
        count_Time -= 1
        lbl_timer.text = String(count_Time)
        
        
    }
    
    func setResult(randomA: Int, randomB: Int){
        kq = tinh_kq(randomA, p2:randomB)
        
        var daodau = Int(arc4random_uniform(2))
        var khoang1 = 0, khoang2 = 0, khoang = kq
        if(daodau == 0){
            daodau = 1
        }else{
            daodau = -1
        }
        
        if(kq < 0){
            khoang = -kq
        }
        khoang1 = Int(arc4random_uniform(UInt32(khoang))) * daodau
        while (khoang1 == kq) {
            khoang1 = Int(arc4random_uniform(UInt32(khoang))) * daodau
        }
        khoang2 = (Int(arc4random_uniform(UInt32(khoang))) + Int(khoang)) * daodau
        while (khoang2 == kq) {
            khoang2 = (Int(arc4random_uniform(UInt32(khoang))) + Int(khoang)) * daodau

        }
        
        var ngaunhien = Int(arc4random_uniform(3))
        if(ngaunhien == 0){
            btl_one.setTitle(String(kq), forState: .Normal)
            btl_second.setTitle(String(khoang1), forState: .Normal)
            btl_three.setTitle(String(khoang2), forState: .Normal)
            
        }else if(ngaunhien == 1){
            btl_second.setTitle(String(kq), forState: .Normal)
            btl_one.setTitle(String(khoang1), forState: .Normal)
            btl_three.setTitle(String(khoang2), forState: .Normal)
            
        }else{
            btl_three.setTitle(String(kq), forState: .Normal)
            btl_second.setTitle(String(khoang1), forState: .Normal)
            btl_one.setTitle(String(khoang2), forState: .Normal)
        }
        number_1 = Int(btl_one.currentTitle!)!
        number_2 = Int(btl_second.currentTitle!)!
        number_3 = Int(btl_three.currentTitle!)!
        
    }
    
    func tinh_kq(p1: Int, p2: Int) -> Int {
    
    if(dau == 0){
    return p1+p2
    }else if(dau == 1){
    return p1-p2
    }else{
    return p1*p2
    }

    }


}
