//
//  HomeViewController.swift
//  tafang
//
//  Created by 高洋 on 16/3/6.
//  Copyright © 2016年 Yang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tcURL = "http://tc.lezxiu.com/json/" //getIndex.php
    //let BaiduURL = "http://apis.haoservice.com/lifeservice/cook/query?"
    var tableView: UITableView?
    var items = ["北京","上海"]
    //= String[]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "首页"
        self.view.backgroundColor = UIColor.whiteColor()
        
        //setNavigationItem("account_icon_up.png", selector: Selector("doShowLeft"), isRight: false)
        
        initView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //初始化table
    func initView(){
        //初始化数据
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        //self.tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        //设置数据
        tableView?.delegate = self
        //设置委托
        tableView?.dataSource = self
        //取消分割线
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.view.addSubview(self.tableView!)
    }
    
    //网络请求数据
    func loadData(){
        
    }
    
    //cell高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 300
    }
    
    //总行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    //加载数据
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellID = "cellID"
    
        var cell: IndexTableCell? = tableView.dequeueReusableCellWithIdentifier(cellID) as? IndexTableCell
        if (cell == nil){
            cell = IndexTableCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
        }
        cell?.avatar?.image = UIImage(named: "avatar")
        cell?.nickname?.text = "\(indexPath.row)"
        cell?.title?.text = items[indexPath.row]
        cell?.desc?.text = "fasfsd"
        cell?.images?.image = UIImage(named: "avatar")
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = DetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
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
