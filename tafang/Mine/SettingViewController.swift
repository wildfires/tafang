//
//  SettingViewController.swift
//  tafang
//
//  Created by 高洋 on 16/3/20.
//  Copyright © 2016年 Yang. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    var aString: String?
    var text: UILabel!
    var delegate : ParameterDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = "设置页面"
        
        setNavigationItem(title: "返回", selector: Selector("doBack"), isRight: false)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        text = UILabel(frame: CGRect(x: 0, y: 200, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        text.textAlignment = .Center
        //text.backgroundColor = UIColor.orangeColor()
        text.text = aString
        self.view.addSubview(text)
        
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
