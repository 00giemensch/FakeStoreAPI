//
//  RegistrationVC.swift
//  FakeStoreAPI
//
//  Created by Ilnur on 07.08.2025.
//

import UIKit

class RegistrationVC: UIViewController {
    
    // MARK: - Properties
    
    var picker = UIPickerView()
    var username: String?
    
    // MARK: - UI Elements
    lazy var nameTF: UITextField = setupTFs(text: "Введите имя", secure: false)
    lazy var lastNameTF: UITextField = setupTFs(text: "Введите фамилию", secure: false)
    lazy var dateOfBirthTF: UITextField = setupTFs(text: "Введите дату рождения", secure: false)
    lazy var passwordTF: UITextField = setupTFs(text: "Введите пароль", secure: true)
    lazy var confirmPasswordTF: UITextField = setupTFs(text: "Повторите пароль", secure: true)

    lazy var errorPasswordMatchLbl: UILabel = setupLbl(text: "Ошибка: пароли не совпадают", color: .systemRed)
    lazy var errorEmptyLbl: UILabel = setupLbl(text: "Ошибка: заполните все поля", color: .systemRed)

    lazy var registerBtn: UIButton = {
        $0.setTitle("Зарегистрироваться", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        $0.layer.cornerRadius = 5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addAction(UIAction { [weak self] _ in
                self?.handleReg()
        }, for: .touchUpInside)
        return $0
    }(UIButton())
    
    lazy var errorsStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 8
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(errorPasswordMatchLbl)
        $0.addArrangedSubview(errorEmptyLbl)
        return $0
    }(UIStackView())
    
    
    // MARK: -  LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Регистрация"
        
        [
            registerBtn,
            nameTF,
            lastNameTF,
            dateOfBirthTF,
            passwordTF,
            confirmPasswordTF,
            errorsStack
        ].forEach {view.addSubview($0)}
        
        errorPasswordMatchLbl.isHidden = true
        errorEmptyLbl.isHidden = true
        
        setupConstraints()
        setupPicker()
    }
    
    // MARK: - Actions
    
    func handleReg() {
        var hasError = false

        // проверка совпадения пароля
        if passwordTF.text != confirmPasswordTF.text {
            // print("пароли не совпадают")
            errorPasswordMatchLbl.isHidden = false
            hasError = true
        } else {
            errorPasswordMatchLbl.isHidden = true
            // print("пароли совпадают")
        }
        
        //проверка заполнения полей
        if nameTF.text == "" || lastNameTF.text == "" || dateOfBirthTF.text == "" || passwordTF.text == "" || confirmPasswordTF.text == "" {
            // print("заполните все поля")
            errorEmptyLbl.isHidden = false
            hasError = true
        } else {
            errorEmptyLbl.isHidden = true
        }
        

        if !hasError { // если ошибок нет, то:
            UserDefaults.standard.set("\(nameTF.text ?? "")", forKey: "username")
            UserDefaults.standard.set(true, forKey: "isRegistered")
            
            let secondVC = MainViewController()
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
    // MARK: - UI Setup
    
    func setupPicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date() // запрет будущих дат
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        dateOfBirthTF.inputView = datePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissPicker))
        toolbar.setItems([doneBtn], animated: false)
        dateOfBirthTF.inputAccessoryView = toolbar
    }
    
    func setupConstraints() {
                NSLayoutConstraint.activate([
                    nameTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 32),
                    nameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    nameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
              
                    lastNameTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 20),
                    lastNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    lastNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
          
                    dateOfBirthTF.topAnchor.constraint(equalTo: lastNameTF.bottomAnchor, constant: 20),
                    dateOfBirthTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    dateOfBirthTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    
                    passwordTF.topAnchor.constraint(equalTo: dateOfBirthTF.bottomAnchor, constant: 20),
                    passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
          
                    confirmPasswordTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20),
                    confirmPasswordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    confirmPasswordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    
                    registerBtn.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor, constant: 32),
                    registerBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    registerBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    registerBtn.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16),
                    
                    errorsStack.topAnchor.constraint(equalTo: registerBtn.bottomAnchor, constant: 16),
                    errorsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    errorsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    errorsStack.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16)
                ])
        }

    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "ru_RU")
        dateOfBirthTF.text = formatter.string(from: sender.date)
    }

    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    func setupLbl(text: String, color: UIColor) -> UILabel {
        let lbl: UILabel = UILabel()
        lbl.text = text
        lbl.textColor = color
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        lbl.setContentHuggingPriority(.required, for: .horizontal)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
    func setupTFs(text: String, secure: Bool) -> UITextField {
        let tf: UITextField = UITextField()
        tf.placeholder = text
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = secure
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }
    
    
    

}

