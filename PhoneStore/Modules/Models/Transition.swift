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

        animator.addCompletion { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

        return animator
    }
}

extension PresentAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using _: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let animator = self.animator(using: transitionContext)
        animator.startAnimation()
    }

    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        return animator(using: transitionContext)
    }
}

class PanelTransition: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmPresentationController(presentedViewController: presented, presenting: presenting ?? source)
    }

    func animationController(forPresented _: UIViewController, presenting _: UIViewController, source _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimation()
    }
}

/// Затемнение

class DimmPresentationController: PresentationController {
  private let dimmView: UIView = {
      let view = UIView()
      view.backgroundColor = UIColor(white: 0, alpha: 0.6)
      view.alpha = 0
      return view
  }()

  private func performAlongsideTransitionIfPossible(_ block: @escaping () -> Void) {
      guard let coordinator = self.presentedViewController.transitionCoordinator else {
          block()
          return
      }

      coordinator.animate(alongsideTransition: { (_) in
          block()
      }, completion: nil)
  }

  override func presentationTransitionWillBegin() {
    super.presentationTransitionWillBegin()
    containerView?.insertSubview(dimmView, at: 0)
    performAlongsideTransitionIfPossible { [unowned self] in
      self.dimmView.alpha = 1
    }
  }

  override func containerViewDidLayoutSubviews() {
      super.containerViewDidLayoutSubviews()
      dimmView.frame = containerView!.frame
  }

  override func presentationTransitionDidEnd(_ completed: Bool) {
      super.presentationTransitionDidEnd(completed)
      if !completed {
          self.dimmView.removeFromSuperview()
      }
  }

  override func dismissalTransitionWillBegin() {
      super.dismissalTransitionWillBegin()
      performAlongsideTransitionIfPossible { [unowned self] in
          self.dimmView.alpha = 0
      }
  }

  override func dismissalTransitionDidEnd(_ completed: Bool) {
      super.dismissalTransitionDidEnd(completed)
      if completed {
          self.dimmView.removeFromSuperview()
      }
  }
}
