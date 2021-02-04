//
//  SplashViewcontroller.swift
//  testNews
//
//  Created by Jernard Ducon on 3/02/21.
//

import UIKit
import Lottie

class SplashViewController: UIViewController, SplashViewControllerProtocol {
    
    private var animationView: AnimationView!
    var presenter: SplashPresenterProtocol?
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAnimation()
        startAnimation()
        presenter?.loadSession()
    }
    
    func setup(presenter: SplashPresenterProtocol) {
        self.presenter = presenter
    }
    
    func setupAnimation() {
        self.animationView = .init(name: Constants.Animations.splashAnimation)
        self.animationView.frame = view.bounds
        self.animationView.contentMode = .scaleAspectFit
        self.animationView.loopMode = .loop
        animationView.animationSpeed = 1
        view.addSubview(animationView)
    }
    
    // MARK: - Animations Actions
    
    @objc func startAnimation() {
        self.animationView.play()
    }
    
    func stopAnimation() {
        self.animationView.stop()
    }

}
