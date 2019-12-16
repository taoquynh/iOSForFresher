//
//  ViewController.swift
//  ShowListImage
//
//  Created by Taof on 12/6/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        scrollView.backgroundColor = .white
        scrollView.isPagingEnabled = true // hiểu là phân trang
        scrollView.showsVerticalScrollIndicator = false // ẩn thanh indicator dọc
        scrollView.showsHorizontalScrollIndicator = false // ẩn thanh indicator ngang
        scrollView.bounces = false // khoá chế độ nảy của scrollView
        return scrollView
    }()
    
    var images: [UIImage] = []
    var texts: [String] = []
    
    var datas = [Name]()
    var dataViews = [Custom2View]()
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // khởi tạo dữ liệu
        data2()
        
        // thêm các đối tượng vào màn hình
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        // gán delegate vào scrollView, đồng thời class cha phải kế thừa  
        scrollView.delegate = self
        
        // set toạ độ và các thuộc tính của pageCotrol
        pageControl.frame = CGRect(x: 0, y: view.frame.maxY - 50, width: 100, height: 20)
        pageControl.center.x = view.center.x
        pageControl.pageIndicatorTintColor = .cyan
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.numberOfPages = datas.count
        pageControl.currentPage = 0
        
        // mang pageControl lên mặt trên cùng
        view.bringSubviewToFront(pageControl)
        
        // gọi hàm
        addContentScroll3(datas)
    }
    
    func data1(){
        images = [
            UIImage(named: "apple"),
            UIImage(named: "banana"),
            UIImage(named: "coconut"),
            UIImage(named: "durian"),
            UIImage(named: "grape"),
            UIImage(named: "lemon"),
            UIImage(named: "mango"),
            UIImage(named: "orange"),
            UIImage(named: "strawberry"),
            
            ] as! [UIImage]
        
        
        texts = [
            "Quả táo",
            "Quả chuối",
            "Quả dừa",
            "Quả sầu riêng",
            "Quả nho",
            "Quả chanh",
            "Quả xoài",
            "Quả cam",
            "Quả dâu"
        ]
    }
    
    func data2(){
        datas = [
            Name(image: "durian", label: "Quả sầu  "),
            Name(image: "mango", label: "Quả xoài"),
            Name(image: "orange", label: "Quả cam"),
            Name(image: "coconut", label: "Quả dừa"),
            Name(image: "grape", label: "Quả nho"),
            
        ]
    }
    func addContentScroll1(_ arrs: [UIImage], _ brrs: [String]){
        // tính kích thước màn hình
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        //duyệt mảng để addSubview các ảnh con vào trong scrollView
        for i in 0..<arrs.count{
            let imageView = UIImageView(frame: CGRect(x: 0,
                                                      y: height * CGFloat(i),
                                                      width: width,
                                                      height: height))
            let title = UILabel(frame: CGRect(x: 0,
                                              y: height * CGFloat(i) - 200,
                                              width: width,
                                              height: 30))
            imageView.contentMode = .scaleAspectFit
            imageView.image = arrs[i]
            
            title.text = brrs[i]
            title.textColor = .black
            title.font = UIFont.boldSystemFont(ofSize: 64)
            title.textAlignment = .center
            title.center.x = imageView.center.x
            
            scrollView.addSubview(imageView)
            scrollView.addSubview(title)
        }
        
        // tính kích thước contentSize của ScrollView
        scrollView.contentSize = CGSize(width: width,
                                        height: scrollView.frame.height * CGFloat(arrs.count))
    }
    
    func addContentScroll2(_ data: [Name]) {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        for i in 0..<data.count {
            let subView = CustomView(frame: CGRect(x: 0, y: height/2 * CGFloat(i),
                                                   width: width, height: height/2))
            
            print(subView.frame)
            subView.imageView.image = UIImage(named: data[i].image)
            subView.nameLabel.text = data[i].label
            //            subView.nameLabel.textColor = .white
            
            scrollView.addSubview(subView)
        }
        scrollView.contentSize = CGSize(width: width, height: scrollView.frame.height/2 * CGFloat(data.count))
    }
    
    func addContentScroll3(_ dataNames: [Name]) {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        for i in 0..<dataNames.count {
            let subView = Custom2View(frame: CGRect(x: width * CGFloat(i), y: 0 ,
                                                    width: width, height: height))
            subView.imageView.image = UIImage(named: dataNames[i].image)
            subView.desLabel.text = dataNames[i].label
            dataViews.append(subView)
            scrollView.addSubview(subView)
        }
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(dataNames.count), height: height)
    }
    
    // hàm này được định nghĩa trong UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Xác định toạ độ khung nhìn của scrollView để thay đổi số trang hiện tại của pageControl
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        
        // MARK: Tạo animate khi trượt các thành phần trong scrollView
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            dataViews[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            dataViews[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            dataViews[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            dataViews[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            dataViews[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            dataViews[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            dataViews[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            dataViews[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
    }
}

