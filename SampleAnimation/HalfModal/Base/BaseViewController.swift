//
//  BaseViewController.swift
//  SampleAnimation
//
//  Created by Makoto on 2022/05/05.
//

import UIKit

final class BaseViewController: UIViewController {
    
    @IBAction private func showHalfModal(_ sender: Any) {
        
        guard let halfModalVC = UIStoryboard.init(name: "HalfModal", bundle: nil).instantiateInitialViewController() as? HalfModalViewController else { return }
        // viewControllerを透過させる
        halfModalVC.modalPresentationStyle = .overCurrentContext
        // じんわり出てくるアニメーション
        halfModalVC.modalTransitionStyle = .crossDissolve
        //viewController自体をアニメーションなしで出現させて
        // viewControllerが出終わったらshowModalを実行する
        self.present(halfModalVC, animated: false, completion: {
            
         halfModalVC.showModal(isAnimation: true)
        })
    }
}
