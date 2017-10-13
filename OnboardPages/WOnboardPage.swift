//
//  OnboardPage.swift
//  OnboardPages
//
//  Created by Qaiser Shehzad on 10/13/17.
//  Copyright © 2017 Qaiser Shehzad. All rights reserved.
//

import UIKit

class WOnboardPage: UIView {

    @IBOutlet weak var mPageImageView: UIImageView!
    @IBOutlet weak var mPageDescriptionLabel: UILabel!
    @IBOutlet weak var mTitleLabel: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    class func onBoardPage()-> WOnboardPage
    {
        let nibs = Bundle.main.loadNibNamed("WOnboardPage", owner: self, options: nil)! as Array<Any>
        let page = nibs[0] as! WOnboardPage
        
        return page
    }
    
}
