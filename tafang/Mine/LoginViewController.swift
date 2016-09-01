//
//  LoginViewController.swift
//  tafang
//
//  Created by 高洋 on 16/3/25.
//  Copyright © 2016年 Yang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "登陆"
        self.view.backgroundColor = UIColor.whiteColor()
        
        setNavigationItem(title: "关闭", selector: Selector("doack"), isRight: false)
        setNavigationItem(title: "注册", selector: Selector("doReg"), isRight: true)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.dismissViewControllerAnimated(true, completion: nil)
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

extension LoginViewController {
    func initView() {
        
    }
}

extension LoginViewController {
    func doack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func doReg() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}