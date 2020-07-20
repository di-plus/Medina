//
//  BrowserViewController.swift
//  blabla
//
//  Created by Dmitriy Mikitenko on 20.07.2020.
//  Copyright © 2020 MedinaFromLondon. All rights reserved.
//

import UIKit

class BrowserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        
        let tabBarItem = UITabBarItem(title: "Browser", image: UIImage(imageLiteralResourceName: "folder"), tag: 1)
        self.tabBarItem = tabBarItem
    }
}
