//
//  TitleViewController.swift
//  MovieDB
//
//  Created by Sergio Murilo on 01/07/22.
//

import UIKit
import SwiftUI

final class TitleViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
