//
//  MoviesDBRouter.swift
//  MovieDB
//
//  Created by Sergio Murilo on 01/07/22.
//

import Foundation
import UIKit

class MoviesDBRouter: UINavigationController {

    // MARK: Properties

    var window: UIWindow?
    var homeViewController: HomeViewController?

    // MARK: Initializers

    convenience init(window: UIWindow?) {
        self.init()
        self.window = window
    }

    // MARK: MoviesDBRouter

    func homeView() {
        homeViewController = HomeViewController()
        if let homeViewController = homeViewController {
            let newCustomerButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(titleView))
            homeViewController.navigationItem.rightBarButtonItem = newCustomerButton
            viewControllers = [homeViewController]
        }
        if let window = window {
            window.rootViewController = self
        }
    }

        @objc func titleView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "TV") as! TitleViewController
                navigationController?.pushViewController(vc, animated: true)
        }

//    @objc func titleView() {
//        let titleViewController = TitleViewController(nibName: "TitleViewController", bundle: nil)
//        let createCustomerButton = UIBarButtonItem(
//            barButtonSystemItem: .done, target: titleViewController,
//            action: #selector(backToHome))
//            titleViewController.navigationItem.rightBarButtonItem = createCustomerButton
//            pushViewController(titleViewController, animated: true)
//    }
    
    @objc func backToHome() {
        if let homeViewController = homeViewController {
            popToViewController(homeViewController, animated: true)
        }
    }
}
