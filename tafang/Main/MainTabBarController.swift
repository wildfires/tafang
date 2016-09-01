//
//  MainTabBarController.swift
//  tafang
//
//  Created by 高洋 on 16/3/12.
//  Copyright © 2016年 Yang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let buttonIndex = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarViewController()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("显示")
        //self.tabBar.hidden = false
        //self.accessibilityElementsHidden = true
        //显示TabBar
        //self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        print("隐藏")
        //self.accessibilityElementsHidden = true
        //self.tabBar.hidden = true
        //隐藏TabBar
        //self.tabBarController?.tabBar.hidden = true
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

//设置子视图
extension MainTabBarController{
    //设置tabbar
    func setTabBarViewController(){
        addChildViewController(HomeViewController(), title: "首页", image: "home_normal", selected: "home_active")
        addChildViewController(DiscoverViewController(), title: "发现", image: "discover_normal", selected: "discover_active")
        addCenterButton(UIViewController(), image: "compose_button")
        addChildViewController(MessageViewController(), title: "消息", image: "message_normal", selected: "message_active")
        addChildViewController(UserViewController(), title: "我的", image: "account_normal", selected: "account_active")
    }
    
    //添加子视图
    func addChildViewController(childVC: UIViewController, title: String, image: String, selected: String) {
        //设置字体颜色
        tabBar.tintColor = UIColor.redColor ()
        
        childVC.title = title
        childVC.tabBarItem.image = UIImage(named: image)?.imageWithRenderingMode(.AlwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selected)?.imageWithRenderingMode(.AlwaysOriginal)
        
        //设置点击后的颜色
        childVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orangeColor()], forState: UIControlState.Selected)
        
        //设置导航控制器
        let nav = UINavigationController(rootViewController: childVC)
        addChildViewController(nav)
    }
}

//中间按钮
extension MainTabBarController{
    //设置中间视图
    func buttonClicked(){
        //当前选中的tabbarItem的index
        let currentSelectedIndex = selectedIndex
        //当前显示视图
        let tempView = viewControllers![currentSelectedIndex].view
        let menuVC = MenuViewController()
        //if let menuVC = UIViewController() as? MenuViewController {
            //用当前的view覆盖centerButton背后的view，防止出现黑屏
            viewControllers![buttonIndex].view.addSubview(tempView)
            
            //dismiss之前先切换到当前页面
            menuVC.dismissViewControllerBlock = { [weak self] in
                self?.selectedIndex = currentSelectedIndex
            }
            menuVC.modalTransitionStyle = .CrossDissolve
            self.presentViewController(menuVC, animated: true, completion: nil)
        //}
    }
    
    //添加按钮
    func addCenterButton(childVC: UIViewController, image: String){
        childVC.tabBarItem.image = UIImage(named: image)?.imageWithRenderingMode(.AlwaysOriginal)
        childVC.tabBarItem.tag = 2
        childVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
        
        let nav = UINavigationController(rootViewController: childVC)
        addChildViewController(nav)
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        switch item.tag{
        case buttonIndex: buttonClicked()
        default: break
        }
    }
    
    
    
    
}









