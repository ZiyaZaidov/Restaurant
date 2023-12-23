//
//  OnboardingVc.swift
//  Restaurant
//
//  Created by Ziya Zaidov on 27.11.2023.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlides] = [
        OnboardingSlides(title: "Flavor Fusion", description: "Savor the Flavor:  Where Every Bite Tells a Delicious Story.", image: UIImage(named: "slide1")!),
    OnboardingSlides(title: "Gourmet Haven", description: "Taste the Tradition, Indulge in Culinary Excellence", image: UIImage(named: "slide2")!),
    OnboardingSlides(title: "Savor Bliss", description: "Culinary Journeys: Your Palate's Perfect Destination.", image: UIImage(named: "slide3")! )]
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next ", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        pageControl.numberOfPages = slides.count

    }
    


    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNavigationController") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: true)

        } else {
            currentPage += 1
            let index = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension OnboardingVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.configureCell(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
