//
//  MenuViewController.swift
//  tafang
//
//  Created by 高洋 on 16/3/12.
//  Copyright © 2016年 Yang. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var itemButtons = [String]()
    var upIndex: Int!
    var downIndex: Int!
    
    var itemImgNames = ["18001","18002","18003","18004","18005","18006"]
    var itemTitNames = ["说说","收藏","会员","点赞","购物","更多"]
    
    var timer: NSTimer!
    var dismissViewControllerBlock: (() -> ()) = {}
    var bottomImage: UIImageView!
    var bottomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = RGBA(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        self.modalPresentationStyle = .CurrentContext
        
        initView()
        setMenu()
        
    }
    
    //页面装载时
    override func viewWillAppear(animated: Bool) {
        UIView.animateWithDuration(0.3, delay: 0.1, options: .CurveLinear, animations: { () -> Void in
            self.bottomButton.transform = CGAffineTransformRotate(self.bottomButton.transform, CGFloat(M_PI))
            }, completion: nil)
    }
    
    //点击事件返回上一控制器,并且旋转145弧度关闭按钮
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("setBtnDownAnimate"), userInfo: nil, repeats: true)
        
        UIView.animateWithDuration(0.3, delay: 0.1, options: .CurveLinear, animations: { () -> Void in
            self.bottomButton.transform = CGAffineTransformRotate(self.bottomButton.transform, CGFloat(-M_PI_2 * 1.5))
            }, completion: nil)
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

extension MenuViewController {
    //初始化视图
    func initView(){
        let h: CGFloat = 40
        bottomImage = UIImageView(frame: CGRect(x: 0, y: SCREEN_HEIGHT - h, width: SCREEN_WIDTH, height: h))
        
        bottomImage.backgroundColor = UIColor.grayColor()
        
        bottomButton = UIButton(frame: CGRect(x: (SCREEN_WIDTH - h)/2, y: SCREEN_HEIGHT - h, width: h, height: h))
        bottomButton.setImage(UIImage(named: "compose_close"), forState: .Normal)
        bottomButton.addTarget(self, action: "cancelButton:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(bottomImage)
        self.view.addSubview(bottomButton)
    }
    
    //设置九宫格图标
    func setMenu(){
        let cols: Int = 3
        var col: Int = 0
        var row: Int = 0
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        let wh: CGFloat = 90
        let magrin: CGFloat = (SCREEN_WIDTH - CGFloat(cols) * wh) / (CGFloat(cols) + 1)
        let oriY: CGFloat = 300
        
        
        for i in 0..<self.itemTitNames.count {
            let btn: UIButton = UIButton(type: .Custom)
        print(i)
            let img: UIImage? = UIImage(named: self.itemImgNames[i])
            let tit: String = self.itemTitNames[i]
            
            btn.setImage(img, forState: .Normal)
            btn.setTitle(tit, forState: .Normal)
            btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -90, bottom: -90, right: 0)
            
            col = i % cols
            row = i / cols
            
            x = magrin + CGFloat(col) * (magrin + wh)
            y = CGFloat(row) * (magrin + wh) + oriY
            
            
            btn.frame = CGRectMake(x, y, wh, wh)
            //btn.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT)
            
            //self.itemButtons.append(btn)
            self.view.addSubview(btn)
        }
        
    }
}

extension MenuViewController {
    //弹出按钮
    func popBtnUp(){
        if (upIndex == self.itemButtons.count) {
            self.timer.invalidate()
            upIndex = 0
            return
        }
        
        //MenuButton *btn = self.itemButtons[_upIndex];
        
        //[self setUpOneBtnAnim:btn];
        
        //_upIndex++;
        
        
        
        self.setBtnUpAnimate()
        
        //self.upIndex++
    }
    
    //设置按钮从第一个开始向上滑动显示
    func setBtnUpAnimate(){
        //usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn
        UIView.animateWithDuration(0.8, delay: 0, options: .CurveEaseIn, animations: { () -> Void in
            self.bottomButton.transform = CGAffineTransformIdentity
            }) { (Bool finished) -> Void in
                //获取当前显示的菜单控件的索引
                self.downIndex = self.itemButtons.count - 1;
        }
        
    }
    
    //设置按钮从后往前下落
    func returnUpVC(){
        if (downIndex == -1) {
            
            //[self.timer invalidate];
            self.timer.invalidate()
            
            return
        }
        
        //MenuButton *btn = self.itemButtons[_downIndex];
        
        //[self setDownOneBtnAnim:btn];
        
        // downIndex--
    }
    
    //按钮下滑并返回上一个控制器
    func setBtnDownAnimate(){
        
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            self.bottomButton.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT)
            }) { (Bool finished) -> Void in
                self.dismissViewControllerAnimated(false, completion: nil)
        }
    }
    
    //底部关闭按钮
    func cancelButton(sender: UIButton){
        dismissViewControllerBlock()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}