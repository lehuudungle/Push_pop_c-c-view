//
//  ViewController.swift
//  pushView_Login
//
//  Created by Admin on 8/31/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var zingmp3: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.alpha = 0
        name.alpha = 0
        zingmp3.alpha = 0
        
    }
    override func viewDidAppear(animated: Bool) {
        reset()
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.1, animations: {
            self.logo.alpha = 1
        }){(finished) in
            UIView.animateWithDuration(0.1, animations: {
                self.zingmp3.center = CGPointMake(self.logo.center.x, 120)
                self.zingmp3.alpha = 1
            }){(finished) in
                UIView.animateWithDuration(1, animations: {
                    self.name.center = CGPointMake(self.name.center.x, 320)
                    self.logo.alpha = 0.2
                    self.name.alpha = 1
                }){(finished) in
                    let v2 = self.storyboard?.instantiateViewControllerWithIdentifier("V2")as!View2
                    self.navigationController?.pushViewController(v2, animated: true)
                }
            }
        }
    }
    func reset(){
        logo.alpha = 0
        name.alpha = 0
        zingmp3.alpha = 0

    }



}

