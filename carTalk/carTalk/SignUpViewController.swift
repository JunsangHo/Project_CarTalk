//
//  SignUpViewController.swift
//  carTalk
//
//  Created by 용상호 on 2021/03/09.
//
import FirebaseUI
import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonTouched(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: pwTextField.text!){ (user,error) in
            if user != nil{
                print("register success")
            }
            else{
                print("register failed")
            }
            
        }
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
