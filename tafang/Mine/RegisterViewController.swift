//
//  RegisterViewController.swift
//  tafang
//
//  Created by 高洋 on 16/3/25.
//  Copyright © 2016年 Yang. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "注册"
        self.view.backgroundColor = UIColor.whiteColor()
        
        setNavigationItem(title: "关闭", selector: Selector("doBack"), isRight: false)
        setNavigationItem(title: "下一步", selector: "reg", isRight: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
