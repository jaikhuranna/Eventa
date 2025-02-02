//
//  OnboardingPageViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 01/02/25.
//

import UIKit

class OnboardingPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{

    var pages: [UIViewController] = []
    let pageControl = UIPageControl()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self;
        dataSource = self;
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let On1 = storyboard.instantiateViewController(withIdentifier: "On1")
        let On2 = storyboard.instantiateViewController(withIdentifier: "On2")
        let On3 = storyboard.instantiateViewController(withIdentifier: "On3")
        let On4 = storyboard.instantiateViewController(withIdentifier: "On4")

        pages = [On1, On2, On3, On4]
        if let firstPage = pages.first {
            setViewControllers([firstPage], direction: .forward, animated: true)
        }
        
        setupPageControl()
        pageControl.isUserInteractionEnabled = false;
        pageControl.currentPageIndicatorTintColor = .purple
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index > 0 else { return nil }
        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else { return nil }
        return pages[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
         if let currentVC = viewControllers?.first, let index = pages.firstIndex(of: currentVC) {
             pageControl.currentPage = index
         }
     }
    
    private func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray

        view.addSubview(pageControl)

        // Constraints
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
