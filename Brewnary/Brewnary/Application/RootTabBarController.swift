//
//  ViewController.swift
//  Brewnary
//
//  Created by 박진홍 on 4/14/25.
//

import SwiftUI
import UIKit

final class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        let beanViewController: UIViewController = BeanViewController(viewModel: BeanViewModel(beanService: BeanService() ))
        beanViewController.tabBarItem = UITabBarItem(
            title: "Bean",
            image: UIImage(systemName: "house"),
            tag: 0
        )
        
        viewControllers = [
            UINavigationController(rootViewController: beanViewController)
        ]
    }
}

