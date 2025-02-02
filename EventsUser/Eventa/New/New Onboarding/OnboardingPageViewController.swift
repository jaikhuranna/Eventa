//
//  OnboardingPageViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 01/02/25.
//

import UIKit

class OnboardingPageViewController: UIPageViewController, UIPageViewControllerDataSource{

    var pages: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self;
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let On1 = storyboard.instantiateViewController(withIdentifier: "OnboardingPage1")
               let On2 = storyboard.instantiateViewController(withIdentifier: "OnboardingPage2")
               
        pages = [On1, On2]

               if let firstPage = pages.first {
                   setViewControllers([firstPage], direction: .forward, animated: true)
               }

    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index > 0 else { return nil }
        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else { return nil }
        return pages[index + 1]
    }

}
