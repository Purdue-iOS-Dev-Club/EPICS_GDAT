//
//  ArriveMenuController.swift
//  EPICS_GDAT
//
//  Created by Ryuji Mano on 12/5/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit

class ArriveMenuController: UIViewController {
    @IBOutlet weak var circleView: UIView! {
        didSet {
            circleView.layer.cornerRadius = circleView.frame.size.width / 2
        }
    }
    @IBOutlet weak var innerCircleView: UIView! {
        didSet {
            innerCircleView.layer.cornerRadius = innerCircleView.frame.size.width / 2
        }
    }

//    @IBOutlet weak var scrollView: UIScrollView! {
//        didSet {
//            scrollView.delegate = self
//        }
//    }
    @IBOutlet weak var arriveMenuView: UIView!

    var scrollView: UIScrollView!

    @IBOutlet weak var iconView: UIImageView! {
        didSet {
            iconView.layer.cornerRadius = iconView.frame.size.width / 2
        }
    }

    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.2588235294, green: 0.2235294118, blue: 0.6784313725, alpha: 1)
            pageControl.pageIndicatorTintColor = .lightGray
            pageControl.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
    }

    func setUpScrollView() {
        scrollView = UIScrollView(frame: CGRect(x: 0.0, y: 20.0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.view.insertSubview(scrollView, at: self.view.subviews.count - 2)
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self

        if let selectMenuController = storyboard?.instantiateViewController(withIdentifier: SelectMenuController.className) as? SelectMenuController, let boardMenuController = storyboard?.instantiateViewController(withIdentifier: BoardMenuController.className) as? BoardMenuController {

            scrollView.addSubview(arriveMenuView)
            arriveMenuView.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)

            selectMenuController.view.backgroundColor = .clear
            scrollView.addSubview(selectMenuController.view)
            addChildViewController(selectMenuController)
            selectMenuController.willMove(toParentViewController: self)
            selectMenuController.view.frame = CGRect(x: self.view.frame.size.width, y: 0.0, width: selectMenuController.view.frame.size.width, height: selectMenuController.view.frame.size.height)

            boardMenuController.view.backgroundColor = .clear
            scrollView.addSubview(boardMenuController.view)
            addChildViewController(boardMenuController)
            boardMenuController.willMove(toParentViewController: self)
            boardMenuController.view.frame = CGRect(x: self.view.frame.size.width * 2, y: 0.0, width: boardMenuController.view.frame.size.width, height: boardMenuController.view.frame.size.height)

            scrollView.contentSize = CGSize(width: self.view.frame.size.width * 3, height: self.view.bounds.height)
        }
    }

    @IBAction func pageControlTapped(_ sender: Any) {
        let width = self.view.frame.size.width
        scrollView.scrollRectToVisible(CGRect(x: width * CGFloat(pageControl.currentPage), y: 0.0, width: width, height: self.view.frame.size.height), animated: true)
        pageControl.updateCurrentPageDisplay()
    }
}

extension ArriveMenuController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = self.view.frame.size.width
        if width <= scrollView.contentOffset.x && scrollView.contentOffset.x < width * 2 {
            pageControl.currentPage = 1
        } else if width * 2 <= scrollView.contentOffset.x {
            pageControl.currentPage = 2
        } else {
            pageControl.currentPage = 0
        }
        pageControl.updateCurrentPageDisplay()
    }
}
