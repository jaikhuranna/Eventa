//
//  letsGetYourEmailAndPasswordViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 06/02/25.
//

import UIKit
import FirebaseAuth

class letsGetYourEmailAndPasswordViewController: UIViewController {

    static var signingUp : Bool?
    
    @IBOutlet var textFeildNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func SignInSignUpButton(_ sender: Any) {
        loginWithPhoneNumber(phoneNumber: textFeildNumber.text!, from: self)
        
    }

    func showOTPAlert(verificationID: String) {
        let alert = UIAlertController(title: "Enter OTP", message: "Enter the OTP sent to your phone", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "123456"
            textField.keyboardType = .numberPad
        }
        
        let submitAction = UIAlertAction(title: "Verify", style: .default) { _ in
            if let otp = alert.textFields?.first?.text {
                self.verifyOTP(otpCode: otp, from: self)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(submitAction)
        alert.addAction(cancelAction)
        
        DispatchQueue.main.async {
            if let topVC = UIApplication.shared.windows.first?.rootViewController?.presentedViewController {
                topVC.present(alert, animated: true)
            }
        }
    }

    func loginWithPhoneNumber(phoneNumber: String, from viewController: UIViewController) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if let error = error {
                print("Error sending OTP: \(error.localizedDescription)")
                return
            }
            
            // Store verification ID for later
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            UserDefaults.standard.synchronize()
            
            self.showOTPAlert(verificationID: verificationID!)
//            Navigate to OTP screen
//            let otpVC = OTPViewController()
//            otpVC.modalPresentationStyle = .fullScreen
//            otpVC.phoneNumber = phoneNumber
//            viewController.present(otpVC, animated: true)
        }
    }
    
    
    func verifyOTP(otpCode: String, from viewController: UIViewController) {
        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else {
            print("Verification ID not found")
            return
        }

        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: otpCode
        )

        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print("OTP Verification Failed: \(error.localizedDescription)")
                return
            }

            guard (authResult?.user) != nil else { return }
            
            // Check if user is new
            let isNewUser = authResult?.additionalUserInfo?.isNewUser ?? false
            if isNewUser {
//                 Navigate to signup page
//                let signupVC = SignupViewController()
//                signupVC.modalPresentationStyle = .fullScreen
//                viewController.present(signupVC, animated: true)
                if let user = Auth.auth().currentUser {
                    print(user.phoneNumber!)
                }
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let On2 = storyboard.instantiateViewController(withIdentifier: "On2")

                if let pageController = self.parent as? OnboardingPageViewController
                {
//                    pageController.pageControl.removeFromSuperview()
                    pageController.setViewControllers( [On2], direction: .forward, animated: true)
                }
            } else {
                // Navigate to home page
//                let homeVC = HomeViewController()
//                homeVC.modalPresentationStyle = .fullScreen
//                viewController.present(homeVC, animated: true)
                self.dismiss(animated: true)
            }
        }
    }
}
