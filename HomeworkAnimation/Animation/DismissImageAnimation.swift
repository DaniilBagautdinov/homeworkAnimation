//
//  DismissImageAnimation.swift
//  HomeworkAnimation
//
//  Created by Даниил Багаутдинов on 05.04.2022.
//

import UIKit

class DismissImageAnimation : NSObject, UIViewControllerAnimatedTransitioning {

    var originalFrame: CGRect!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return UIAccessibility.isReduceMotionEnabled ? 0.5 : 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from)! as? ImageViewController else { return }
        guard let toViewController =  transitionContext.viewController(forKey: .to)! as? MainViewController else { return }
        
        fromViewController.imageView.clipsToBounds = true
        fromViewController.imageView.contentMode = .scaleAspectFill
        
        
        var springDampeningFactor: CGFloat = 0.6
        var initialSpringVelocity: CGFloat = 0.3
        
        if UIAccessibility.isReduceMotionEnabled {
            springDampeningFactor = 1
            initialSpringVelocity = 0
        }
        
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0,
                       usingSpringWithDamping: springDampeningFactor,
                       initialSpringVelocity: initialSpringVelocity,
                       options: .curveEaseInOut,
                       animations: {
                        
                        fromViewController.imageView.frame = toViewController.imageView.frame
            
        }) { finished in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
