//
//  ViewController.swift
//  AppInterview2021Answer
//
//  Created by 李泰儀 on 2021/5/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = NumberViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCell()
        getNumber()
    }
    
    private func registerCell() {
        collectionView.register(UINib(nibName: "NumberCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "numberCell")
    }
    
    private func getNumber() {
        viewModel.getNumber(num: 49) { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "numberCell", for: indexPath) as? NumberCollectionViewCell {
            let number = viewModel.numbers[indexPath.row]
            cell.configure(number: number)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? NumberCollectionViewCell {
            viewModel.clickNumber(indexPath: indexPath) { (number) in
                cell.toggleCell(number: number)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width / 5, height: view.frame.width / 5)
    }
}
