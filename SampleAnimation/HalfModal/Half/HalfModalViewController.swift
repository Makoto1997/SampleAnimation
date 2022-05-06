//
//  HalfModalViewController.swift
//  SampleAnimation
//
//  Created by Makoto on 2022/05/05.
//

import UIKit

final class HalfModalViewController: UIViewController {
    
    @IBOutlet private weak var outSafeAreaView: UIView!
    @IBOutlet private weak var slideView: UIView! {
        didSet {
            //全体をタッチしたらタップアクションを実行させる
            let gesture = UITapGestureRecognizer.init(target: self, action: #selector(tapSlideView))
            slideView.addGestureRecognizer(gesture)
        }
    }
    
    @IBOutlet private weak var topBarView: UIView! {
        didSet {
            topBarView.layer.cornerRadius = topBarView.frame.size.height / 2
            topBarView.clipsToBounds = true
        }
    }
    
    @IBOutlet private weak var mainView: UIView! {
        didSet {
            mainView.layer.cornerRadius = 25
        }
    }
    @IBOutlet private weak var mainViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var slideViewCenterYConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setDefaultPosition()
    }
    
    private func setDefaultPosition() {
        /*制約のconstantをデフォルトにする*/
        slideViewCenterYConstraint.constant = self.view.frame.height / 2
        mainViewHeightConstraint.constant = 300
        self.view.layoutIfNeeded()
    }
    
    //モーダルを出現させる
    func showModal(isAnimation: Bool = true) {
        //制約のconstantを0にして画面中央に移動させる
        slideViewCenterYConstraint.constant = 0
        if isAnimation {
            //制約をアニメーションさせながら更新
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        } else {
            //アニメーションがないのでそのまま制約を更新
            self.view.layoutIfNeeded()
        }
    }
    
    private func dismissModal(isAnimation: Bool = true) {
        //制約のconstantをviewの高さ分にして画面外に移動させる
        slideViewCenterYConstraint.constant = self.view.frame.height / 2
        
        if isAnimation {
            //制約をアニメーションさせながら更新
            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            }) { (_) in
                //アニメーションが終わったらこのview controller自体をdismiss
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            //アニメーションがないのでそのまま、このview controller自体をdismiss
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc private func tapSlideView() {
        
        self.dismissModal(isAnimation: true)
    }
    
    @IBAction private func nobiro(_ sender: Any) {
        //制約のconstantを画面の高さ*0.8にする
        mainViewHeightConstraint.constant = self.view.frame.height * 0.8
        //制約をアニメーションさせながら更新
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction private func Chijime(_ sender: Any) {
        //制約のconstantを300にする
        mainViewHeightConstraint.constant = 300
        //制約をアニメーションさせながら更新
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}
