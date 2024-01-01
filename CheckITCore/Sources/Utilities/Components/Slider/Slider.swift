//
//  Slider.swift
//
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import UIKit

public class Slider: UIView, UIScrollViewDelegate {

    private var scrollView: UIScrollView!
    private var pageControl: UIPageControl?
    private var views: [UIView] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    func setupUI() {
        // Initialize ScrollView
        scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        addSubview(scrollView)
    }

    public func configure(with views: [UIView], pageControl: UIPageControl? = nil) {
        self.views = views
        self.pageControl = pageControl
        setupViews()
        setupPageControl()
    }

    private func setupViews() {
        scrollView.frame = bounds
        scrollView.contentSize = CGSize(width: bounds.width * CGFloat(views.count), height: bounds.height)

        for (index, view) in views.enumerated() {
            view.frame = CGRect(x: bounds.width * CGFloat(index), y: 0, width: bounds.width, height: bounds.height)
            scrollView.addSubview(view)
        }
    }

    private func setupPageControl() {
        pageControl?.numberOfPages = views.count
        pageControl?.currentPage = 0
//        let pageControlSize = pageControl.size(forNumberOfPages: views.count)
//        pageControl.frame = CGRect(x: (bounds.width - pageControlSize.width) / 2,
//                                   y: bounds.height - pageControlSize.height - 10,
//                                   width: pageControlSize.width,
//                                   height: pageControlSize.height)
    }

    // MARK: - UIScrollViewDelegate

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / bounds.width)
        pageControl?.currentPage = Int(pageIndex)
    }
}

