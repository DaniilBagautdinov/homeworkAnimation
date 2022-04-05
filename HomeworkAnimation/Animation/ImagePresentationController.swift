//
//  ImagePresentationController.swift
//  HomeworkAnimation
//
//  Created by Даниил Багаутдинов on 05.04.2022.
//

import UIKit

final class ImagePresentationController: UIPresentationController {
    
    var frameSize: CGSize!
    
    override var frameOfPresentedViewInContainerView: CGRect {
       return presentedViewController.view.bounds
    }
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
    }
    
}

