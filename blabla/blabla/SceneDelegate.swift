//
//  SceneDelegate.swift
//  blabla
//
//  Created by Dmitriy Mikitenko on 27.04.2020.
//  Copyright © 2020 MedinaFromLondon. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate,CarouselPageViewControllerDelegate,LoginViewControllerDelegate {
    
    var window: UIWindow?
    var mainNavigationController: UINavigationController?
    var onBoardCarousel: CarouselPageViewController?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        
        let st = UIStoryboard(name: "Main", bundle: nil)
        onBoardCarousel = st.instantiateViewController(identifier: "Carousel")
        onBoardCarousel?.delegateController = self
        
                
        if let carousel = onBoardCarousel{
            mainNavigationController = UINavigationController(rootViewController: carousel)
        }
        
        mainNavigationController?.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = mainNavigationController
        window?.rootViewController?.view.backgroundColor = .green
        window?.makeKeyAndVisible()
    }
    
    func goToNextScreen() {
        let loginViewController : LoginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewController")
        mainNavigationController?.viewControllers = [loginViewController]
        loginViewController.delegateController = self
    }
    func goToMainScreen() {
        let mainTabBarViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AppMainScreen")
        mainNavigationController?.viewControllers = [mainTabBarViewController]
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

