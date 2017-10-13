//
//  TutorialViewController.swift
//  PriorityZones
//
//  Created by Qaiser Shehzad on 4/26/17.
//  Copyright © 2017 Qaiser Shehzad. All rights reserved.
//

import UIKit

class WOnboardPages: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var m_pageControl: UIPageControl!
    @IBOutlet weak var m_scrollView: UIScrollView!
    @IBOutlet weak var m_sc_contentView: UIView!
    @IBOutlet weak var contentView_width_const: NSLayoutConstraint!
    
    var m_phoneNumber:String = ""

    var numberOfPages = 3
    
    var mPageImages:[String] = ["p1Image","p2Image","p3Image"]
    
    var mPageTitles:[String] = ["Page One Title","Page Two Title","Page Three Title"]
    
    var mPageText:[String] = ["This is amazing. Lets join to explore","This is amazing. Lets join to explore Page two","This is amazing. Lets join to explore page three"]
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        configurePageControl()
        m_pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControlEvents.valueChanged)
        self.view.setNeedsDisplay()
        configureOnBoardPages()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView_width_const.constant = self.view.frame.width*CGFloat(numberOfPages-1)

        for i in 1 ... numberOfPages  {
            let page = m_sc_contentView.viewWithTag(i)
            
            let originX = self.view.frame.width*CGFloat(i-1)
            if(originX != 0)
            {
                page!.backgroundColor = UIColor.red
            }
            let height = self.m_scrollView.frame.size.height
            page!.frame = CGRect(x:originX, y: 0, width:self.view.frame.width, height:height)
            
        }
        
        
    }
    func configureOnBoardPages()
    {
        for i in 1 ... numberOfPages  {
            let page = WOnboardPage.onBoardPage()
            page.tag = i
            
            if(i-1 < mPageTitles.count)
            {
                page.mTitleLabel.text = mPageTitles[i-1]
            }
            if(i-1 < mPageText.count)
            {
                page.mPageDescriptionLabel.text = mPageText[i-1]
            }
            if(i-1 < mPageImages.count)
            {
                page.mPageImageView.image = UIImage(named: mPageImages[i-1])
            }
            
            m_sc_contentView.addSubview(page)
           
        }
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.m_pageControl.numberOfPages = numberOfPages
        self.m_pageControl.currentPage = 0
        self.m_pageControl.tintColor = UIColor.red
        self.m_pageControl.pageIndicatorTintColor = UIColor.black
        self.m_pageControl.currentPageIndicatorTintColor = UIColor.green
        self.m_pageControl.transform = CGAffineTransform(scaleX: 1.3, y: 1.3);

        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(m_pageControl.currentPage) * m_scrollView.frame.size.width
        m_scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {  // here if want to do something on pagescroll
        
        let pageNumber = round(m_scrollView.contentOffset.x / m_scrollView.frame.size.width)
        m_pageControl.currentPage = Int(pageNumber)
//        if (pageNumber == 2)
//        {
//            UIView.animate(withDuration: 0.2) {
//                self.view.layoutIfNeeded()
//            }
//        }else{
//            UIView.animate(withDuration: 0.2) {
//                self.view.layoutIfNeeded()
//            }
//        }
    }

    func setOnboardPageTitles(titles:[String])
    {
        mPageTitles = titles
    }
    
    func setOnboardPageImage(images:[String])
    {
        mPageImages = images
    }
    
    func setOnboardPageText(text:[String])
    {
        mPageText = text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
