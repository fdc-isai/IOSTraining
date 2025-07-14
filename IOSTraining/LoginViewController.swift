//
//  LoginViewController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/7/25.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    @IBOutlet weak var rememberMeButton: UIButton!

    var rememberMeIsChecked = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"

    }
    
    
    @IBAction func checkboxTapped(_ sender: UIButton) {
        rememberMeIsChecked.toggle()
        let imageName = rememberMeIsChecked ? "checkmark.square" : "square"
        rememberMeButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    func showErrorMessage(_ message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { _ in
                        print("did tap ok")
                }
            )
        )
        self.present(alert, animated: true)
    }
  
    @IBAction func onTapSignUpButton(_ sender: Any) {
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func onTapSubmitButton(_ sender: Any) {

        print("Submit Button tapped")

        guard let email = emailTextField.text, !email.isEmpty else {
            showErrorMessage("Please enter your email.")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showErrorMessage("Please enter your password.")
            return
        }
        
        print("Email: \(email)")
        print("Password: \(password)")

        let vc = OTPViewController(nibName: "OTPViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)

    }
    
    
}
