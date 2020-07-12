//
//  CarouselPageViewController.swift
//  blabla
//
//  Created by Dmitriy Mikitenko on 03.05.2020.
//  Copyright © 2020 MedinaFromLondon. All rights reserved.
//
import UIKit

class CarouselPageViewController: UIPageViewController, CarouselItemDelegate {
    
    private var items: [UIViewController] = []
    weak var delegateController: CarouselPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        dataSource = self
        
        decoratePageControl()
        populateItems()
        
        self.view.backgroundColor = .red
        
        if let firstViewController = items.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func carouselView(view: CarouselItem, didTouchCompleteButton button: UIButton) {
        delegateController?.jumpToLogInPage()
    }
}

private extension CarouselPageViewController {
    
    func decoratePageControl() {

        let pc = UIPageControl.appearance(whenContainedInInstancesOf: [CarouselPageViewController.self])
        pc.currentPageIndicatorTintColor = .systemPink
        pc.pageIndicatorTintColor = .gray
    }
    
    func populateItems(){
        
        let textContent = ["WELCOME" , "ПРИВЕТ", "ALOHA"]
        let backgroundColor:[UIColor] = [.blue , .red , .magenta]
        
        for (index, text) in textContent.enumerated() {
            let pageItem = createCarouselItemController(with: text, color: backgroundColor[index])
            items.append(pageItem)
        }
    }
    
    func createCarouselItemController(with titleText: String?, color: UIColor?) -> UIViewController{
        
        let newViewControllet = UIViewController()
        var view: CarouselItem
        view = CarouselItem(titleText: titleText, background: color)
        view.delegate = self
        
        newViewControllet.view = view
        return newViewControllet
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
            return nil
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
            return nil
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

protocol CarouselPageViewControllerDelegate: class {
    #warning("Need change function name. Minimum chabge "jump" to "go". Maximum this class protocol no nothing about login page, and function name should not contain words aboit it)")
    func jumpToLogInPage()
}
