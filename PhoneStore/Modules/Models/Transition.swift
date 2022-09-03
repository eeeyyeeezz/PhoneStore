// 
// PhoneStore
// Transition.swift
// Created by eeeyyeeezz on 03.09.2022
// Swift: 5.0
//


import UIKit

class PresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
      let bounds = containerView!.bounds
      let halfHeight = bounds.height / 2
      return CGRect(x: 0,
                       y: halfHeight,
                       width: bounds.width,
                       height: halfHeight)
    }

  override func presentationTransitionWillBegin() {
    super.presentationTransitionWillBegin()
    containerView?.addSubview(presentedView!)
  }

  override func containerViewDidLayoutSubviews() {
    super.containerViewDidLayoutSubviews()
    presentedView?.frame = frameOfPresentedViewInContainerView
  }
}

class PresentAnimation: NSObject {
    let duration: TimeInterval = 0.3

    private func animator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        let to = transitionContext.view(forKey: .to)!
        let finalFrame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!)
        to.frame = finalFrame.offsetBy(dx: 0, dy: finalFrame.height)
        let animator = UIViewPropertyAnimator(duration: duration, curve: .easeOut) {
            to.frame = finalFrame
        }

        animator.addCompletion { (position) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

        return animator
    }
}

extension PresentAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let animator = self.animator(using: transitionContext)
        animator.startAnimation()
    }

    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        return self.animator(using: transitionContext)
    }
}

class PanelTransition: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting ?? source)
    }

  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      return PresentAnimation()
  }
}
