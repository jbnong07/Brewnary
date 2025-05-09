//
//  BeanViewController.swift
//  Brewnary
//
//  Created by 박진홍 on 5/9/25.
//

import UIKit
import SwiftUI

final class BeanViewController: UIViewController {
    private let viewModel: BeanViewModel
    private var hostingController: UIHostingController<BeanView>?
    
    init(viewModel: BeanViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let beanView: BeanView = BeanView(viewModel: self.viewModel)
        self.hostingController = UIHostingController(rootView: beanView)
        setupView()
    }
    
    private func setupView() {
        guard let hostingController = hostingController else {
            #if DEBUG
            print("BeanView HostingController == nil")
            #endif
            return
        }
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
    }
}
