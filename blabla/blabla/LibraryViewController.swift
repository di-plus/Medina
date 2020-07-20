//
//  LibraryViewController.swift
//  blabla
//
//  Created by Dmitriy Mikitenko on 20.07.2020.
//  Copyright © 2020 MedinaFromLondon. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        let tabBarItem = UITabBarItem(title: "Library", image: UIImage(imageLiteralResourceName: "bookSimple"), tag: 0)
        self.tabBarItem = tabBarItem
    }
}
