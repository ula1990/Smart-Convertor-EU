//
//  RateCollectionExtension.swift
//  EURCurrencyConverter
//
//  Created by Uladzislau Daratsiuk on 9/6/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if rates.isEmpty {
                noDataLabel.isHidden = false
                return 0
            }else{
                noDataLabel.isHidden = true
                return rates.count
            }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let rate = rates[indexPath.row]
            let cell  = rateCollection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RateCell
        if (mainTextField.text?.isEmpty)! {
            cell.updateData(rate: rate, entery: 0)
        }else{
            let amount = Double(mainTextField.text!)
            cell.updateData(rate: rate, entery: amount!)
        }
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let rate = rates[indexPath.row]
            currencyForDetails = rate.currency
            let vc = RatesVC()
            navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width - 40, height: 45)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
    }
    
    
}
