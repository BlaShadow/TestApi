//
//  MenuTransitioningManager.swift
//  Pelis
//
//  Created by Blashadow on 9/5/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class MenuTransitioningManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
  static let snapshotDistance: CGFloat = 200
  static let snapshotScale: CGFloat = 0.7
  var duration = 0.7
  var isPresenting = false
  var snapshot: UIView?

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let fromView = transitionContext.view(forKey: .from)
    let toView = transitionContext.view(forKey: .to)

    let container = transitionContext.containerView
    let xValue = container.frame.width - MenuTransitioningManager.snapshotDistance
    var moveRight = CGAffineTransform(translationX: xValue, y: 0)
    let moveLeft = CGAffineTransform(translationX: 0, y: 0)

    if isPresenting {
      let destinationController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)

      toView?.transform = moveLeft

      snapshot = fromView?.snapshotView(afterScreenUpdates: true)
      snapshot?.layer.cornerRadius = 20
      snapshot?.clipsToBounds = true

      if let destinationController = destinationController as? MenuViewController {
        let selector = #selector(destinationController.closeMenu)
        let tapGesture = UITapGestureRecognizer(target: destinationController, action: selector)
        snapshot?.addGestureRecognizer(tapGesture)
      }

      if let toView = toView, let snapshot = snapshot {
        container.addSubview(toView)
        container.addSubview(snapshot)
        toView.addSubview(snapshot)
      }
    }

    UIView.animate(withDuration: duration,
                   delay: 0.0,
                   usingSpringWithDamping: 0.9,
                   initialSpringVelocity: 0.3,
                   options: .curveEaseIn,
                   animations: {
      if self.isPresenting {
        let scale = MenuTransitioningManager.snapshotScale
        moveRight = moveRight.scaledBy(x: scale, y: scale)
        fromView?.transform = moveRight
        self.snapshot?.transform = moveRight
        self.snapshot?.layer.cornerRadius = 20

        toView?.transform = CGAffineTransform.identity
      } else {
        self.snapshot?.transform = CGAffineTransform.identity
        self.snapshot?.layer.cornerRadius = 0

        toView?.transform = CGAffineTransform.identity
        fromView?.transform = CGAffineTransform.identity
      }
    }, completion: { _ in
      transitionContext.completeTransition(true)
    })
  }

  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    isPresenting = false

    return self
  }

  func animationController(forPresented presented: UIViewController,
                           presenting: UIViewController,
                           source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
    isPresenting = true

    return self
  }
}
