//
//  RegistrationVC.swift
//  FakeStoreAPI
//
//  Created by Ilnur on 07.08.2025.
//

import UIKit

class RegistrationVC: UIViewController {
    
    // MARK: - UI
    
    // TFs
    lazy var nameTF: UITextField = setupTFs(text: "Введите имя")
    lazy var lastNameTF: UITextField = setupTFs(text: "Введите фамилию")
    lazy var dateOfBirthTF: UITextField = setupTFs(text: "Введите дату рождения")
    lazy var passwordTF: UITextField = setupTFs(text: "Введите пароль")
    lazy var confirmPasswordTF: UITextField = setupTFs(text: "Повторите пароль")

    // Lbls
    lazy var errorNameShortLbl: UILabel = setupLbl(text: "‼️Ошибка: Фамилия слишком короткая", color: .red)
    lazy var errorPasswordMatchLbl: UILabel = setupLbl(text: "‼️Ошибка: Пароли не совпадают", color: .red)

    //Btn
    lazy var registerBtn: UIButton = {
        $0.setTitle("Зарегистрироваться", for: .normal)
        $0.backgroundColor = .blue
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    
    // MARK: -  LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Регистрация"
        view.addSubview(registerBtn)
        view.addSubview(errorNameShortLbl)
        view.addSubview(errorPasswordMatchLbl)
        view.addSubview(nameTF)
        view.addSubview(lastNameTF)
        view.addSubview(dateOfBirthTF)
        view.addSubview(passwordTF)
        view.addSubview(confirmPasswordTF)
        setupConstraints()
    }
    
    
    // MARK: - setups
    
    func setupLbl(text: String, color: UIColor) -> UILabel {
        let lbl: UILabel = UILabel()
        lbl.text = text
        lbl.textColor = color
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.setContentHuggingPriority(.required, for: .horizontal)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
    func setupTFs(text: String) -> UITextField {
        let tf: UITextField = UITextField()
        tf.placeholder = text
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }
    
    
    func setupConstraints() {
                NSLayoutConstraint.activate([
                    nameTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 32),
                    nameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    nameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
              
                    lastNameTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 16),
                    lastNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    lastNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
          
                    dateOfBirthTF.topAnchor.constraint(equalTo: lastNameTF.bottomAnchor, constant: 16),
                    dateOfBirthTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    dateOfBirthTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    
                    passwordTF.topAnchor.constraint(equalTo: dateOfBirthTF.bottomAnchor, constant: 16),
                    passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
          
                    confirmPasswordTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 16),
                    confirmPasswordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    confirmPasswordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    
                    registerBtn.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor, constant: 16),
                    registerBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    registerBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    registerBtn.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16),
                    
                    errorNameShortLbl.topAnchor.constraint(equalTo: registerBtn.bottomAnchor, constant: 16),
                    errorNameShortLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    errorNameShortLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    
                    errorPasswordMatchLbl.topAnchor.constraint(equalTo: errorNameShortLbl.bottomAnchor, constant: 16),
                    errorPasswordMatchLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    errorPasswordMatchLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    errorPasswordMatchLbl.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16),

                ])
        }


}

