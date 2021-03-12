//
//  LoginViewController.swift
//  carTalk
//
//  Created by 용상호 on 2021/03/09.
//

import UIKit
import FirebaseUI
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBAction func signUpTrigger(_ sender: Any) {
        self.performSegue(withIdentifier:"signUp",sender:nil)
    }
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var googleSignInButton: GIDSignInButton!

    @IBAction func loginButtonTouched(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: pwTextField.text!){(user,error) in
            
            if user != nil{
                print("login success")
            }
            else{
                print("login failed")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()

        if let user = Auth.auth().currentUser {
            emailTextField.placeholder = "이미 로그인 된 상태입니다."
            pwTextField.placeholder = "이미 로그인 된 상태입니다."
            loginButton.setTitle("이미 로그인 된 상태입니다.", for: .normal)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
