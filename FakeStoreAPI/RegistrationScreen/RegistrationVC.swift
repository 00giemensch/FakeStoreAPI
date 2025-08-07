//
//  RegistrationVC.swift
//  FakeStoreAPI
//
//  Created by Ilnur on 07.08.2025.
//

import UIKit

class RegistrationVC: UIViewController {
    
    lazy var nameLbl: UILabel = setupLbl(text: "Имя:", color: .black)
    lazy var lastNameLbl: UILabel = setupLbl(text: "Фамилия:", color: .black)
    lazy var dateOfBirthLbl: UILabel = setupLbl(text: "Дата рождения:", color: .black)
    lazy var passwordLbl: UILabel = setupLbl(text: "Пароль", color: .black)
    lazy var confirmPasswordLbl: UILabel = setupLbl(text: "Подтверждение", color: .black)
    
    lazy var registerBtn: UIButton = {
        $0.setTitle("Зарегистрироваться", for: .normal)
        $0.backgroundColor = .blue
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    lazy var errorNameShortLbl: UILabel = setupLbl(text: "❌Ошибка: Фамилия слишком короткая", color: .red)
    lazy var errorPasswordMatchLbl: UILabel = setupLbl(text: "❌Ошибка: Пароли не совпадают", color: .red)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Регистрация"
        
        view.addSubview(nameLbl)
        view.addSubview(lastNameLbl)
        view.addSubview(dateOfBirthLbl)
        view.addSubview(passwordLbl)
        view.addSubview(confirmPasswordLbl)
        view.addSubview(registerBtn)
        view.addSubview(errorNameShortLbl)
        view.addSubview(errorPasswordMatchLbl)
        
        setupConstraints()
    }
    
    func setupLbl(text: String, color: UIColor) -> UILabel {
        let lbl: UILabel = UILabel()
        lbl.text = text
        lbl.textColor = color
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
    
    func setupConstraints() {
                NSLayoutConstraint.activate([
                    nameLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 32),
                    nameLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    nameLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    
                    lastNameLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 16),
                    lastNameLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    lastNameLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    
                    dateOfBirthLbl.topAnchor.constraint(equalTo: lastNameLbl.bottomAnchor, constant: 16),
                    dateOfBirthLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    dateOfBirthLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    
                    passwordLbl.topAnchor.constraint(equalTo: dateOfBirthLbl.bottomAnchor, constant: 16),
                    passwordLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    passwordLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    passwordLbl.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16),
                    
                    confirmPasswordLbl.topAnchor.constraint(equalTo: passwordLbl.bottomAnchor, constant: 16),
                    confirmPasswordLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    confirmPasswordLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    
                    registerBtn.topAnchor.constraint(equalTo: confirmPasswordLbl.bottomAnchor, constant: 16),
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

