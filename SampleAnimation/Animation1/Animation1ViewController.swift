//
//  Animation1ViewController.swift
//  SampleAnimation
//
//  Created by Makoto on 2022/05/04.
//

import UIKit

final class Animation1ViewController: UIViewController {
    
    @IBOutlet private weak var view1: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer.init(target: self, action: #selector(tapView1))
            view1.addGestureRecognizer(gesture)
        }
    }
    
    private var isRotated: Bool = false
    @IBOutlet private weak var view2: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer.init(target: self, action: #selector(tapView2))
            view2.addGestureRecognizer(gesture)
        }
    }
    
    @IBOutlet private weak var view3: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer.init(target: self, action: #selector(tapView3))
            view3.addGestureRecognizer(gesture)
        }
    }
    
    private var isAnimated: Bool = false
    @IBOutlet private weak var baseView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer.init(target: self, action: #selector(tapBaseView))
            baseView.addGestureRecognizer(gesture)
        }
    }
    
    @IBOutlet private weak var view4: UIView!
    @IBOutlet private weak var view5: UIView!
    @IBOutlet private weak var view6: UIView!
    
    @IBOutlet private weak var showConst4: NSLayoutConstraint!
    @IBOutlet private weak var dismissConst4: NSLayoutConstraint!
    @IBOutlet private weak var showConst5: NSLayoutConstraint!
    @IBOutlet private weak var dismissConst5: NSLayoutConstraint!
    @IBOutlet private weak var showConst6: NSLayoutConstraint!
    @IBOutlet private weak var dismissConst6: NSLayoutConstraint!
    
    
    @objc private func tapView1() {
        //0.1秒でアニメーション
        UIView.animate(withDuration: 0.1, animations: {
            self.view1.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }) { (_) in
            
            UIView.animate(withDuration: 0.1, animations: {
                self.view1.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
            }) { (_) in
                
                UIView.animate(withDuration: 0.1, animations: {
                    self.view1.transform = .identity
                })
            }
        }
    }
    
    @objc private func tapView2() {
        let angle = isRotated ? 0.0 : CGFloat(45.0 / 180 * Double.pi)
        isRotated.toggle()
        
        UIView.animate(withDuration: 0.1, animations: {
            self.view2.transform = CGAffineTransform.init(rotationAngle: angle)
        })
    }
    
    @objc private func tapView3() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.view3.transform = CGAffineTransform.init(translationX: 0, y: 100)
        }){ (_) in
            UIView.animate(withDuration: 0.2, animations: {
                self.view3.transform = .identity
            })
        }
    }
    
    @objc private func tapBaseView() {
        isAnimated.toggle()
        if isAnimated {
            //制約のactiveを切り替える
            self.dismissConst4.isActive = false
            self.showConst4.isActive = true
            
            UIView.animate(withDuration: 0.5, animations: {
                //制約に基づいて更新する
                self.view.layoutIfNeeded()
            }) { (_) in
                
                self.dismissConst5.isActive = false
                self.showConst5.isActive = true
                
                UIView.animate(withDuration: 0.5, delay: 0.1, animations: {
                    
                    self.view.layoutIfNeeded()
                }) { (_) in
                    self.dismissConst6.isActive = false
                    self.showConst6.isActive = true
                    
                    UIView.animate(withDuration: 0.5, delay: 0.2, animations: {
                        
                        self.view.layoutIfNeeded()
                    })
                }
            }
        } else {
            //制約のactiveを切り替える
            self.showConst4.isActive = false
            self.dismissConst4.isActive = true
            
            self.showConst5.isActive = false
            self.dismissConst5.isActive = true
            
            self.showConst6.isActive = false
            self.dismissConst6.isActive = true
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.view.layoutIfNeeded()
            })
        }
    }
}
