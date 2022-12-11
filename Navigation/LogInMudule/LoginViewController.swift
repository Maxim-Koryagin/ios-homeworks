//
//  LogInViewController.swift
//  Navigation
//
//  Created by kosmokos I on 01.09.2022.

import UIKit
import FirebaseAuth
import RealmSwift

final class LoginViewController: UIViewController {

    // MARK: Properties
    
    private let realm = try! Realm()
    
    private var users: Results<Category>?
    
    private let realmService = RealmService()
    
    let userDefault = UserDefaults.standard
    
    var loginDelegate: LoginViewControllerDelegate?
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .systemGray6
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = "Email"
        textField.autocapitalizationType = .none
        textField.clearButtonMode = .whileEditing
        textField.layer.borderWidth = 0.8
        textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: textField.frame.height))
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = "Password"
        textField.layer.borderWidth = 0.8
        textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: textField.frame.height))
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textContentType = .oneTimeCode
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var loginbutton: CustomButton = {
        let button = CustomButton(title: "Log In", cornerRadius: 10, shadowOpacity: 0)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    // MARK: Methods

    private func setupUI() {
        view.backgroundColor = .white

        setupNavBar()
        setupViews()
        setupConstraints()
        setupGestures()
        loginButtonAction()
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
                self.loginbutton.setTitle("Sign up", for: .normal)
            
            } else {
                self.loginbutton.setTitle("Login", for: .normal)
            }
        }
        
    }

    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = true
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(stackView)
        contentView.addSubview(loginbutton)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),

            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            loginbutton.heightAnchor.constraint(equalToConstant: 50),
            loginbutton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            loginbutton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginbutton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }

    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func loginButtonAction() {
        
        loginbutton.tap = {
            
            guard let login = self.emailTextField.text,
                  let password = self.passwordTextField.text,
                  (!login.isEmpty && !password.isEmpty)
            else {
                self.showErrorAlert(message: "You need write email and password")
                return
            }
            
//            let allCategory = self.realm.objects(Category.self)
//            self.userDefault.setValue(login, forKey: "login")
//            self.userDefault.setValue(password, forKey: "password")
//            let newUser = NewUsers()
//            newUser.login = login
//            newUser.password = password
//            self.realmService.createUser(categoryId: allCategory[0].id, user: newUser)
//            print(allCategory)
//            self.showProfileVC()
            
                let allCategory = self.realm.objects(Category.self)
                self.userDefault.setValue(login, forKey: "login")
                self.userDefault.setValue(password, forKey: "password")
                let newUser = NewUsers()
                newUser.login = login
                newUser.password = password
            self.realmService.addUser(categoryId: allCategory[0].id, user: newUser)
                print(allCategory)
                self.showProfileVC()
            
//            self.loginDelegate?.checkCredentials(email: login, password: password) { result in
//                if result == "authorization complited" {
//                    self.showProfileVC()
//                } else if result == "There is no user record corresponding to this identifier. The user may have been deleted." {
//                    self.showAlertLogin(message: result) { result in
//                        self.loginDelegate?.signUp(email: login, password: password) { result in
//                            if result == "registration complited" {
//                                self.showSuccessAlert(message: result)
//                            } else {
//                                self.showErrorAlert(message: result)
//                            }
//                        }
//                    }
//                } else {
//                    self.showErrorAlert(message: result)
//                }
//            }
        }
        
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            let loginButtonBottomPointY = loginbutton.frame.origin.y + loginbutton.frame.height

            let keyboardOriginY = view.frame.height - keyboardHeight
            let yOffset = keyboardOriginY < loginButtonBottomPointY ? loginButtonBottomPointY - keyboardOriginY + 16 : 0

            scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }

    @objc private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }

    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    private func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: "Seccess", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func showAlertLogin(message : String, complition: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Register new user", style: .default) { action in
            complition(true)
        })
        alert.addAction(UIAlertAction(title: "cancel", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension LoginViewController {
    func showProfileVC() {
        let user = TestUserService()
   
        let profileViewController = ProfileViewController(userService: user)
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}
