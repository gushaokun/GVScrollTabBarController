//
//  GVScrollTabBarControllerDelegate.swift
//  ViewControllerTransition
//
//  Created by Gavin on 16/3/17.
//  Copyright © 2016年 Gavin. All rights reserved.
//

import UIKit

class GVScrollTabBarControllerDelegate: NSObject, UITabBarControllerDelegate {
    
    var interactive = false
    let interactionController = UIPercentDrivenInteractiveTransition()
    
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let fromIndex = tabBarController.viewControllers!.indexOf(fromVC)!
        
        let toIndex = tabBarController.viewControllers!.indexOf(toVC)!
        
        let tabChangeDirection: GVTabOperationDirection = toIndex < fromIndex ? .Left : .Right
        
        let transitionType = GVTransitionType.TabTransition(tabChangeDirection)
        
        let scrollTransition = GVScrollTabBarControllerAnimationTransition(type: transitionType)
        return scrollTransition
    }
    
    func tabBarController(tabBarController: UITabBarController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive ? interactionController : nil
    }

}
