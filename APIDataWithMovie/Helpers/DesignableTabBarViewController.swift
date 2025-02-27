//
//  DesignableTabBarViewController.swift
//  APIDataWithMovie
//
//  Created by Aung Kyaw Phyo on 20/01/2025.
//

import UIKit

class DesignableTabBarViewController: UITabBarController, Storyboarded {
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        setupRadius()
    }
    
    private func setupRadius() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    override func viewDidLayoutSubviews() {
        configHeight()
    }
    
    private func configHeight() {
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame = tabBar.frame
            tabFrame.size.height = 82
            tabFrame.origin.y = view.frame.size.height - 82
            tabBar.frame = tabFrame
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        animationWhenSelectItem(item)
    }
    
    private func animationWhenSelectItem(_ item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        let timeInterval: TimeInterval = 0.3
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.8, y: 0.8)
        }
        propertyAnimator.addAnimations({
            barItemView.transform = .identity
        }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
    
}




