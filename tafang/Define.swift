//
//  Define.swift
//  tafang
//
//  Created by 高洋 on 16/3/12.
//  Copyright © 2016年 Yang. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_BOUNDS = UIScreen.mainScreen().bounds

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width

let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

let FONT_NAME = "FZlanting"

func RGBA(red red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
}