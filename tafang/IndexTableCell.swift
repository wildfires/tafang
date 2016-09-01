//
//  IndexTableCell.swift
//  tafang
//
//  Created by 高洋 on 16/3/8.
//  Copyright © 2016年 Yang. All rights reserved.
//

import UIKit

class IndexTableCell: UITableViewCell {

    var avatar: UIImageView?
    var nickname: UILabel?
    var title: UILabel?
    var desc: UILabel?
    var images: UIImageView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        avatar = UIImageView(frame: CGRect(x: 5, y: 0, width: 25, height: 25))
        avatar?.layer.masksToBounds = true
        avatar?.layer.cornerRadius = 12.5
        nickname = UILabel(frame: CGRect(x: 35, y: 0, width: UIScreen.mainScreen().bounds.size.width-40, height: 25))
        title = UILabel(frame: CGRect(x: 5, y: 30, width: UIScreen.mainScreen().bounds.size.width-10, height: 25))
        desc = UILabel(frame: CGRect(x: 5, y: 60, width: UIScreen.mainScreen().bounds.size.width-10, height: 60))
        //字体颜色
        desc?.textColor = UIColor.grayColor()
        //文字居中
        //desc?.textAlignment = .Left
        //设置字体大小
        desc?.font = UIFont(name: FONT_NAME, size: 18)
        desc?.textColor = UIColor.redColor()
        //自动换行
        desc?.lineBreakMode = .ByCharWrapping
        desc?.numberOfLines = 0
        images = UIImageView(frame: CGRect(x: 5, y: 120, width: UIScreen.mainScreen().bounds.size.width-10, height: 160))
        
        self.addSubview(avatar!)
        self.addSubview(nickname!)
        self.addSubview(title!)
        self.addSubview(desc!)
        self.addSubview(images!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//cell 高度
extension IndexTableCell{
    
}