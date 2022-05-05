//
//  Animation2ViewController.swift
//  SampleAnimation
//
//  Created by Makoto on 2022/05/04.
//

import UIKit

final class Animation2ViewController: UIViewController {
    
    @IBOutlet private weak var view1: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer.init(target: self, action: #selector(tapView1))
            view1.addGestureRecognizer(gesture)
        }
    }
    
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
    
    @IBOutlet private weak var positionConst4: NSLayoutConstraint!
    @IBOutlet private weak var positionConst5: NSLayoutConstraint!
    @IBOutlet private weak var positionConst6: NSLayoutConstraint!
    
    @objc private func tapView1() {
        
        UIView.animate(withDuration: 1.0, animations: {
            self.view1.backgroundColor = .systemBlue
        }) { (_) in
            UIView.animate(withDuration: 1.0, animations: {
                self.view1.backgroundColor = .systemPink
            })
        }
    }
    
    @objc private func tapView2() {
        
        UIView.animate(withDuration: 1.0, animations: {
            self.view2.layer.cornerRadius = self.view2.frame.height / 2
        }) { (_) in
            UIView.animate(withDuration: 1.0, animations: {
                self.view2.layer.cornerRadius = 0
            })
        }
    }
    
    @objc private func tapView3() {
        
        UIView.animate(withDuration: 1.0, animations: {
            self.view3.alpha = 0
        }) { (_) in
            UIView.animate(withDuration: 1.0, animations: {
                self.view3.alpha = 1
            })
        }
    }
    
    @objc private func tapBaseView() {
        
        isAnimated.toggle()
        if isAnimated {
            //制約の値を変える
            self.positionConst4.constant = 0
            UIView.animate(withDuration: 0.5, animations: {
                
                self.view.layoutIfNeeded()
            }) {(_) in
                
                self.positionConst5.constant = 0
                UIView.animate(withDuration: 0.5, delay: 0.1, animations: {
                    
                    self.view.layoutIfNeeded()
                }) {(_) in
                    
                    self.positionConst6.constant = 0
                    UIView.animate(withDuration: 0.5, delay: 0.2, animations: {
                        
                        self.view.layoutIfNeeded()
                    })
                }
            }
        } else {
            self.positionConst4.constant = 300
            self.positionConst5.constant = 300
            self.positionConst6.constant = 300
            
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}
