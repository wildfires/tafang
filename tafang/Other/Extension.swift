//
//  Extension.swift
//  tafang
//
//  Created by 高洋 on 16/3/18.
//  Copyright © 2016年 Yang. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController{
    
    func setNavigationItem(title title: String, selector: Selector, isRight: Bool) {
        var item: UIBarButtonItem!
        
        if title.hasSuffix("png") {
            item = UIBarButtonItem(image: UIImage(named: title), style: .Plain, target: self, action: selector)
        } else {
            item = UIBarButtonItem(title: title, style: .Plain, target: self, action: selector)
        }
        
        item.tintColor = UIColor.darkGrayColor()
        
        if isRight {
            self.navigationItem.rightBarButtonItem = item
        } else {
            self.navigationItem.leftBarButtonItem = item
        }
    }
    
    func doBack()
    {
        if self.navigationController?.viewControllers.count > 1 {
            self.navigationController?.popViewControllerAnimated(true)
        } else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}









