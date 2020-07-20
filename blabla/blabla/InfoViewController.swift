//
//  InfoViewController.swift
//  blabla
//
//  Created by Dmitriy Mikitenko on 20.07.2020.
//  Copyright © 2020 MedinaFromLondon. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Info"
        self.view.backgroundColor = .white
        
        let tabBarItem = UITabBarItem(title: "Info", image: UIImage(imageLiteralResourceName: "info"), tag: 2)
        self.tabBarItem = tabBarItem
    }
}
