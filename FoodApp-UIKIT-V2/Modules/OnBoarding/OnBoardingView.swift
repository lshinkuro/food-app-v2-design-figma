// 
//  OnBoardingView.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import UIKit
import RxCocoa
import RxSwift

class OnBoardingView: BaseViewController {

    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: GradientRoundedButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: OnBoardingPresenter?
    private let items: [OnboardingItem] = [
        .init(image: UIImage(named: "onboarding-1"), title: "Order from your favourite stores or vendors"),
        .init(image: UIImage(named: "onboarding-2"), title: "Choose from a wide range of  delicious meals"),
        .init(image: UIImage(named: "onboarding-3"), title: "Enjoy instant delivery and payment")
    ]
    private var currentPage: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()        
    }

}

extension OnBoardingView {
    func setup() {
        setupView()
        configureCollection()
        setupAction()
    }
    
    func setupAction() {
        skipButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                if self.currentPage == 2 {
                    self.moveToLogin()
                } else {
                    self.moveToNextPage()
                }
            })
            .disposed(by: bag)
    }
    
    private func moveToNextPage() {
        currentPage += 1
        scrollToPage(page: currentPage, animated: true)
    }
    
    private func scrollToPage(page: Int, animated: Bool) {
        var frame: CGRect = self.collectionView.frame
        frame.origin.x = frame.size.width * CGFloat(page)
        frame.origin.y = 0
        self.collectionView.scrollRectToVisible(frame, animated: animated)
    }
    
    func setupView() {
        pageControl.pageIndicatorTintColor = .foodBrightCoral1
        pageControl.currentPageIndicatorTintColor = .gray
    }
    
    private func moveToLogin() {
        AppSetting.shared.isFirstTime = false
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = HomeVCRouter().showView()
        self.navigationController?.pushViewController(vc , animated: true)
    }
    
    func configureCollection() {
        collectionView.registerCellWithNib(OnboardCell.self)
        collectionView.setCollectionViewLayout(CarouselLayout(), animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
    }
}

extension OnBoardingView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = self.items.count
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as OnboardCell
        let item = items[indexPath.item]
        cell.imageCell.image = item.image
        cell.labelCell.text = item.title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(
            (collectionView.contentOffset.x / collectionView.frame.width)
                .rounded(.toNearestOrAwayFromZero))
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = collectionView.indexPathsForVisibleItems.first {
            currentPage = indexPath.row
        }
    }
}


struct OnboardingItem: Equatable {
    let image: UIImage?
    let title: String
}


final class CarouselLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 0
        self.scrollDirection = .horizontal
        self.sectionInset = .zero
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepare() {
        super.prepare()
        if let collectionView = collectionView {
            itemSize = collectionView.frame.size
        }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard itemSize != newBounds.size else { return false }
        itemSize = newBounds.size
        return true
    }
}

