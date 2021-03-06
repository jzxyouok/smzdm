//
//  ZZHaoWuCell.swift
//  什么值得买
//
//  Created by Wang_ruzhou on 2016/10/15.
//  Copyright © 2016年 Wang_ruzhou. All rights reserved.
//

import UIKit

class ZZHaoWuItemOne: UIView {
    
    lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.width = haoWuConstant.imageWidth
        iconView.height = haoWuConstant.imageHeight1
        iconView.top = haoWuConstant.imageTopMargin
        iconView.contentMode = .scaleAspectFit
        return iconView
    }()
    
    lazy var titleLabel: YYLabel = {
        let titleLabel = YYLabel()
        titleLabel.font = haoWuConstant.subTitleFont
        titleLabel.textColor = haoWuConstant.subTitleColor
        titleLabel.width = haoWuConstant.imageWidth
        titleLabel.left = haoWuConstant.subTitleLeft
        titleLabel.height = haoWuConstant.subTitleHeight
        return titleLabel
    }()

    lazy var priceLabel: YYLabel = {
        let priceLabel = YYLabel()
        priceLabel.font = haoWuConstant.priceLabelFont
        priceLabel.textColor = haoWuConstant.priceLabelColor
        priceLabel.width = haoWuConstant.imageWidth
        priceLabel.left = haoWuConstant.priceLabelLeft
        priceLabel.height = haoWuConstant.priceLabelHeight
        return priceLabel
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        backgroundColor = UIColor.white
        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(priceLabel)
        
        titleLabel.top = iconView.bottom + haoWuConstant.imageBottomMargin + haoWuConstant.subtitleTop
        priceLabel.top = titleLabel.bottom + haoWuConstant.subtitleBottom + haoWuConstant.priceLabelTop
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var subItemModel: ZZGoodsSubItemModel? {
        didSet {
            if let subItemModel = subItemModel {
                iconView.zdm_setImage(urlStr: subItemModel.pro_pic!, placeHolder: nil)
                titleLabel.text = subItemModel.name!
                priceLabel.text = "¥ \(subItemModel.pro_price!)起"
            }
            
        }
    }
}


class ZZHaoWuCellOne: ZZHaoWuBaseCell {
    
    
    override var haowuLayout: ZZHaoWuLayout? {
        
        didSet{
         
            if let haowuLayout = haowuLayout {
                
                let items = haowuLayout.fantasicGoodsModel?.data
                let totalCount = items?.count
                
                for index in 0..<haoWuConstant.maxCount {
                    
                    let haowuItemOne = scrollView.haowuItems[index] as! ZZHaoWuItemOne
                    
                    if index < totalCount! {
                        haowuItemOne.isHidden = false
                        haowuItemOne.subItemModel = items![index]
                    }else{
                        haowuItemOne.isHidden = true
                    }
                    
                }
            }
            
        }
        
    }

    
    lazy var allBtn: UIButton = {
        let allBtn = UIButton()
        allBtn.setTitleColor(haoWuConstant.allBtnColor, for: .normal)
        allBtn.setTitle("全部", for: .normal)
        allBtn.titleLabel?.font = haoWuConstant.allBtnFont
        allBtn.height = haoWuConstant.headTitleHeight + haoWuConstant.headTitleTop + haoWuConstant.headTitleBottom
        allBtn.width = haoWuConstant.allBtnWidth
        allBtn.right = screenWidth - haoWuConstant.allBtnRight
        allBtn.contentHorizontalAlignment = .right
        return allBtn
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension ZZHaoWuCellOne {
    
    override func setupUI() {
        super.setupUI()
        contentView.addSubview(allBtn)
        scrollView.height = haoWuConstant.itemHeight1
        for index in 0..<haoWuConstant.maxCount {
            
            let haoWuItemOne = ZZHaoWuItemOne()
            haoWuItemOne.isHidden = true
            haoWuItemOne.tag = index
            scrollView.addSubview(haoWuItemOne)
            scrollView.haowuItems.append(haoWuItemOne)
            haoWuItemOne.width = haoWuConstant.itemWidth
            haoWuItemOne.height = haoWuConstant.itemHeight1
            haoWuItemOne.left = CGFloat(index) * (haoWuConstant.itemWidth + haoWuConstant.itemMargin) + haoWuConstant.itemMargin
            
            let tapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(haowuItemDidClick(tap:)))
            
            haoWuItemOne.addGestureRecognizer(tapGestureRecognizer)
            
        }
    }
}


extension ZZHaoWuCellOne{
    @objc fileprivate func haowuItemDidClick(tap: UITapGestureRecognizer){
        
        let haoWuItemOne = tap.view as! ZZHaoWuItemOne
        
        delegate?.haoWuItemDidClick!(in: self, subItemModel: haoWuItemOne.subItemModel!)
        
    }
}

