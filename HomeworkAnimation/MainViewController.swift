//
//  ViewController.swift
//  HomeworkAnimation
//
//  Created by Даниил Багаутдинов on 05.04.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageTransitioning: ImageTransitioningDelegate?
    
    var animator: UIViewPropertyAnimator!
    
    var count: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "1")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        imageTransitioning = ImageTransitioningDelegate()
        guard let imageVC = segue.destination as? ImageViewController else { return }
        guard let image = imageView.image else { return }
        
        imageVC.image = image
        imageVC.aspectRatio = image.size.width/image.size.height
        imageVC.transitioningDelegate = imageTransitioning
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if count < 3 {
            animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) { [self] in
                imageView?.alpha = 0.0
            }
            animator.startAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
                animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) { [self] in
                    imageView.image = UIImage(named: "\(count)")
                    imageView?.alpha = 1.0
                }
                animator.startAnimation()
            }
            count += 1
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        if count > 1 {
            animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) { [self] in
                imageView?.alpha = 0.0
            }
            animator.startAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
                animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) { [self] in
                    imageView.image = UIImage(named: "\(count)")
                    imageView?.alpha = 1.0
                }
                animator.startAnimation()
            }
            count -= 1
        }
    }
}

