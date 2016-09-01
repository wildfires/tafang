//
//  UserViewController.swift
//  tafang
//
//  Created by 高洋 on 16/3/6.
//  Copyright © 2016年 Yang. All rights reserved.
//

import UIKit


protocol ParameterDelegate{
    func parameterString(title : String)
}

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ParameterDelegate {
    
    var headView: UIImageView!
    var headHeight: CGFloat = 260
    
    var avatarView: UIButton!
    var tableView: UITableView!
    var settingArr = [["旅行清单","我的订单","下载","行程"],["收藏","晒图","草稿箱"],["优惠券","预约特惠"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "我的"
        
        setNavigationItem(title: "my_settings_icon.png", selector: "clicksetting:", isRight: true)
        
        
        initView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBarTransparency(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        setNavigationBarTransparency(false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func clickhead(sender: UIButton) {
        print("点击了头像")
    }
    
    func clicksetting(sender: UIButton) {
        let setVC = SettingViewController()
        //隐藏tabbar
        setVC.hidesBottomBarWhenPushed = true
        navigationController!.pushViewController(setVC, animated: true)
    }
}

extension UserViewController {
    //设置section个数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return settingArr.count
    }
    //每个section下边预留的空白高度
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == 2) {
            return 100
        }
        return 20
    }
    //每一个section下对应的tableview高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        if (indexPath.section == 0) {
//            return 80
//        }
        return 38
    }
    //
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 20))
        footerView.backgroundColor = UIColor.clearColor()
        
        return footerView
    }
    
    //设置每个section下tableview的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingArr[section].count
    }
    //设置每行对应的cell内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "CellID"
        var cell: UserCell? = tableView.dequeueReusableCellWithIdentifier(cellID) as? UserCell
        
        if (cell == nil) {
            cell = UserCell(style: .Default, reuseIdentifier: cellID)
        }
        
        cell?.accessoryType = .DisclosureIndicator
        
        switch indexPath.section {
        case 0:
            cell?.idtext?.text = self.settingArr[0][indexPath.row]
        case 1:
            cell?.idtext?.text = self.settingArr[1][indexPath.row]
        case 2:
            
            cell?.idtext?.text = self.settingArr[2][indexPath.row]
        default: break
        }
        
        return cell!
    }
    //事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        cell.addBtn.tag = indexPath.row   //设置button的tag 为tableview对应的行
//        //加入button手势事件
//        cell.addBtn.addTarget(self, action: "touchUpButton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        parameterString(settingArr[indexPath.section][indexPath.row])
        
        let setVC = LoginViewController()
        //隐藏tabbar
        setVC.hidesBottomBarWhenPushed = true
        navigationController!.pushViewController(setVC, animated: true)
        
//        let model = more!.list![indexPath.row]
//        let eventVC = EventViewController()
//        eventVC.model = model
//        navigationController!.pushViewController(eventVC, animated: true)
        
        
//        let detailVC = DetailViewController()
//        //detailVC.text = settingArr[indexPath.section][indexPath.row]
//        let nav = UINavigationController(rootViewController: detailVC)
//        self.presentViewController(nav, animated: true, completion: nil)
        
        //self.navigationController?.pushViewController(DetailViewController(), animated: true)
        
    }
    
    func parameterString(title: String) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "detail") {
            //let detail = segue.destinationViewController as! DetailViewController
            let detail = segue.destinationViewController as! DetailViewController
            detail.aString = sender as? String
        }
    }
    
    //封装alert
    func alertMessage(message: String) {
        
        let alertController = UIAlertController(title: "提示", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancelAlert = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        
        let sureAlert = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil)
        
        alertController.addAction(cancelAlert)
        alertController.addAction(sureAlert)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //滚动条
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY: CGFloat = scrollView.contentOffset.y
        let distance: CGFloat = -offsetY - headHeight
        
        if (distance >= 0) {
            setNavigationBarTransparency(true)
        } else {
            setNavigationBarTransparency(false)
        }
        
        if (offsetY < -headHeight) {
            var frame: CGRect = headView.frame
            frame.origin.y = offsetY
            frame.size.height = -offsetY
            headView.frame = frame
        }
    }
    
    //导航栏背景透明
    func setNavigationBarTransparency(translucent: Bool) {
        if translucent {
            //设置导航栏文字颜色
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            //给导航条的背景图片传递一个空图片的UIImage对象（导航条就是透明的）
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            //隐藏底部阴影条，传递一个空图片的UIImage对象
            self.navigationController?.navigationBar.shadowImage = UIImage()
        } else {
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
            self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
            self.navigationController?.navigationBar.shadowImage = nil
        }
    }
}

extension UserViewController {
    //初始化视图
    func initView() {
        //在iOS7之后，导航控制器下的所有UIScrollView顶部都会添加额外的滚动区域64。
        //所以加上下面一句，取消默认的额外区域。
        self.automaticallyAdjustsScrollViewInsets = false
        
        //初始化列表
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        tableView.backgroundColor = RGBA(red: 204, green: 204, blue: 204, alpha: 0.5)
        tableView.delegate = self
        tableView.dataSource = self
        //tableview的显示内容，默认在tabbar下面
        tableView.contentInset = UIEdgeInsetsMake(headHeight, 0, 0, 0)
        tableView.separatorStyle = .SingleLine
        self.view.addSubview(tableView)
        
        let detailVC :DetailViewController = DetailViewController()
        detailVC.delegate = self;
        
        
        
        //初始化头部背景图片
        headView = UIImageView(frame: CGRect(x: 0, y: -headHeight, width: SCREEN_WIDTH, height: headHeight))
        headView.image = UIImage(named: "bg")
        //放大效果
        headView.contentMode = .ScaleAspectFill
        headView.clipsToBounds = true
        
        self.tableView.addSubview(headView)
        
        //初始化头像
        let avatarWH: CGFloat = 80
        avatarView = UIButton(frame: CGRect(x: (SCREEN_WIDTH - avatarWH) / 2, y: 70, width: avatarWH, height: avatarWH))
        avatarView.setBackgroundImage(UIImage(named: "avatar"), forState: .Normal)
        avatarView.layer.borderWidth = 1
        avatarView.layer.borderColor = UIColor.whiteColor().CGColor
        avatarView.layer.cornerRadius = avatarWH / 2
        //隐藏圆角外的图片
        avatarView.layer.masksToBounds = true
        avatarView.tag = 11
        avatarView.addTarget(self, action: "clickhead:", forControlEvents: .TouchUpInside)
        
        self.headView.addSubview(avatarView)
        
        
    }
}