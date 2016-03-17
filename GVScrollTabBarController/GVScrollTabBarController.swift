//
//  GVScrollTabBarController.swift
//  ViewControllerTransition
//
//  Created by Gavin on 16/3/17.
//  Copyright © 2016年 Gavin. All rights reserved.
//

import UIKit

class GVScrollTabBarController: UITabBarController {

    private var panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
    private let tabBarVCDelegate = GVScrollTabBarControllerDelegate()
    private var subViewControllerCount: Int{
        let count = viewControllers != nil ? viewControllers!.count : 0
        return count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = tabBarVCDelegate        
        panGesture.addTarget(self, action: "handlePan:")
        view.addGestureRecognizer(panGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func handlePan(panGesture: UIPanGestureRecognizer){
        let translationX =  panGesture.translationInView(view).x
        let translationAbs = translationX > 0 ? translationX : -translationX
        let progress = translationAbs / view.frame.width
        switch panGesture.state{
        case .Began:
            tabBarVCDelegate.interactive = true
            let velocityX = panGesture.velocityInView(view).x
            if velocityX < 0{
                if selectedIndex < subViewControllerCount - 1{
                    selectedIndex += 1
                }
            }else {
                if selectedIndex > 0{
                    selectedIndex -= 1
                }
            }
        case .Changed:
            tabBarVCDelegate.interactionController.updateInteractiveTransition(progress)
        case .Cancelled, .Ended:
            if progress > 0.3{
                tabBarVCDelegate.interactionController.completionSpeed = 0.99
                tabBarVCDelegate.interactionController.finishInteractiveTransition()
            }else{
                tabBarVCDelegate.interactionController.completionSpeed = 0.99
                tabBarVCDelegate.interactionController.cancelInteractiveTransition()
            }
            tabBarVCDelegate.interactive = false
        default: break
        }
    }

}
