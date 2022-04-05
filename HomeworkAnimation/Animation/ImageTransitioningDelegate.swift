//
//  ImageTransitioningDelegate.swift
//  HomeworkAnimation
//
//  Created by Даниил Багаутдинов on 05.04.2022.
//

import UIKit

class ImageTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentation = ImagePresentationController(presentedViewController: presented, presenting: presenting)
        return presentation
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ImagePresentationAnimator()
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissImageAnimation()
    }
}

