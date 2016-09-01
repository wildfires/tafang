//
//  UserCell.swift
//  tafang
//
//  Created by 高洋 on 16/3/18.
//  Copyright © 2016年 Yang. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    var idtext: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
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

extension UserCell {
    //初始化
    func initView() {
        idtext = UILabel(frame: CGRect(x: 10, y: 0, width: SCREEN_WIDTH, height: 38))
        //字体不生效
        idtext?.font = UIFont(name: FONT_NAME, size: 20)
        self.addSubview(idtext!)
    }
}