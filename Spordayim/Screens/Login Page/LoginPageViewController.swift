//
//  LoginPageViewController.swift
//  Spordayim
//
//  Created by Mert Demirtas on 24.03.2023.
//

import UIKit

class LoginPageViewController: BaseViewController<LoginPageViewModel> {
    
    private lazy var googleSignInButton: GoogleSignInButton = {
        let temp = GoogleSignInButton()
        temp.setData(by: SignInButtonData(image: "google", signInText: "Sign in with Google"))
        temp.translatesAutoresizingMaskIntoConstraints = false

        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtonAction()
    }
    
    func configureButtonAction() {
        googleSignInButton.setButtonAction {
            self.viewModel.authUser(viewController: self, completion: { [weak self] in
                guard let data = self?.viewModel.getData() else { return }
                let vc = CitySelectionBuilder.build(data: data)
                self?.navigationController?.pushViewController(vc, animated: true)
            })
        }
    }
    
    override func addViewComponents() {
        super.addViewComponents()
        
        view.addSubview(googleSignInButton)

        NSLayoutConstraint.activate([            
            googleSignInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            googleSignInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            googleSignInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
