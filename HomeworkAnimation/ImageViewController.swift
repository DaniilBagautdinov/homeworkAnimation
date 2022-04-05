//
//  ImageViewController.swift
//  HomeworkAnimation
//
//  Created by Даниил Багаутдинов on 05.04.2022.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    var aspectRatio: CGFloat!
    
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if let image = image {
            imageView.image = image
            imageHeight.constant = self.view.frame.width/aspectRatio
        }
    }
    
    var interactionController: DismissInteractionController?
    var imageTransitioning: ImageTransitioningDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        interactionController = DismissInteractionController.init(viewController: self)
    }
}
