//
//  CarouselPageViewController.swift
//  blabla
//
//  Created by Dmitriy Mikitenko on 03.05.2020.
//  Copyright © 2020 MedinaFromLondon. All rights reserved.
//
import UIKit

class CarouselPageViewController: UIPageViewController {
    fileprivate var items: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        decoratePageControl()
        populateItems()
        
        if let firstViewController = items.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    fileprivate func decoratePageControl() {
        let pc = UIPageControl.appearance(whenContainedInInstancesOf: [CarouselPageViewController.self])
        pc.currentPageIndicatorTintColor = .systemPink
        pc.pageIndicatorTintColor = .gray
    }
    
    fileprivate func populateItems(){
        let text = ["WELCOME" , "ПРИВЕТ", "ALOHA"]
        let backgroundColor:[UIColor] = [.blue , .red , .cyan]
        
        for (index, t) in text.enumerated() {
            let c = createCarouselItemController(with: t, color: backgroundColor[index])
            items.append(c)
        }
    }
    
    fileprivate func createCarouselItemController(with titleText: String?, color: UIColor?) -> UIViewController{
        let c = UIViewController()
        c.view = CarouselItem(titleText: titleText, background: color)
        
        return c
    }
    
}
    
    //MARK: - DataSouse
    
    extension CarouselPageViewController: UIPageViewControllerDataSource {
        
        func pageViewController(_: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = items.firstIndex(of: viewController) else {
                return nil
            }
            
            let previousIndex = viewControllerIndex - 1
            
            guard previousIndex >= 0 else {
                return items.last
            }
            
            guard items.count > previousIndex else {
                return nil
            }
            
            return items[previousIndex]
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = items.firstIndex(of: viewController) else {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            guard items.count != nextIndex else {
                return items.first
            }
            
            guard items.count > nextIndex else {
                return nil
            }
            
            return items[nextIndex]

        }
        
        func presentationCount(for _: UIPageViewController) -> Int {
            return items.count
        }
        
        func presentationIndex(for _: UIPageViewController) -> Int {
            guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = items.firstIndex(of: firstViewController) else {
                return 0
            }
            return firstViewControllerIndex
        }
    }
