//
//  RegistrationVC.swift
//  FakeStoreAPI
//
//  Created by Ilnur on 07.08.2025.
//

import UIKit

class RegistrationVC: UIViewController {
    
    // MARK: - UI
    
    var picker = UIPickerView()
    
    var username: String?
    
    // TFs
    lazy var nameTF: UITextField = setupTFs(text: "Введите имя", secure: false)
    lazy var lastNameTF: UITextField = setupTFs(text: "Введите фамилию", secure: false)
    lazy var dateOfBirthTF: UITextField = setupTFs(text: "Введите дату рождения", secure: false)
    lazy var passwordTF: UITextField = setupTFs(text: "Введите пароль", secure: true)
    lazy var confirmPasswordTF: UITextField = setupTFs(text: "Повторите пароль", secure: true)

    // Lbls(errors) - по умолчанию скрыты
    lazy var errorNameShortLbl: UILabel = setupLbl(text: "Ошибка: имя и фамилия должны содержать только буквы", color: .systemRed)
    lazy var errorPasswordMatchLbl: UILabel = setupLbl(text: "Ошибка: пароли не совпадают", color: .systemRed)
    lazy var errorEmptyLbl: UILabel = setupLbl(text: "Ошибка: заполните все поля", color: .systemRed)

    //Btn
    
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
    
    
    // MARK: -  LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Регистрация"
        [
            registerBtn,
            errorNameShortLbl,
            errorPasswordMatchLbl,
            errorEmptyLbl,
            nameTF,
            lastNameTF,
            dateOfBirthTF,
            passwordTF,
            confirmPasswordTF
        ].forEach {view.addSubview($0)}
        
        // изначально ошибки скрыты
        errorNameShortLbl.isHidden = true
        errorPasswordMatchLbl.isHidden = true
        errorEmptyLbl.isHidden = true
        
//        // прячем ошибки при вводе новых символов
//          [nameTF, lastNameTF, passwordTF, confirmPasswordTF].forEach {
//              $0.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
//          }
        
        setupConstraints()
        setupPicker()
    }
    
    
    // MARK: - setups
    
//    func correctName(name: String, lastName: String) -> String {
//        /*
//         если имя содержит не буквы, то errorNameShortLbl = "Имя и фамилия должны содержать только буквы"
//         если все норм, то ошибка не должна высвечиваться
//         */
//    }
    
//    func passwordMatch(password: String, confirmPassword: String) -> String {
//        /*
//         if passwordTF !== confirmPasswordTF {
//            errorPasswordMatchLbl = Пароли не совпадают
//         */
//    }
    func handleReg() {
        
        var hasError = true
        hasError = false // исправили ошибки
        
        
        if !hasError { // если ошибок нет, то:
            let secondVC = MainViewController()
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            UserDefaults.standard.set("\(nameTF.text ?? "")", forKey: "username")
            UserDefaults.standard.set(true, forKey: "isRegistered")
        }
        
        
        if hasError { // если ошибки есть, то:
            errorNameShortLbl.isHidden = false
            errorPasswordMatchLbl.isHidden = false
            errorEmptyLbl.isHidden = false
        }
        
        
    }
    
    func setupPicker() {
        // сам UIDatePicker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date() // запрет будущих дат
        datePicker.locale = Locale(identifier: "ru_RU")
        
        // Обновляем текст при изменении даты
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        // Назначаем его как inputView для текстового поля
        dateOfBirthTF.inputView = datePicker
        
        // Тулбар с кнопкой "Готово"
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissPicker))
        toolbar.setItems([doneBtn], animated: false)
        dateOfBirthTF.inputAccessoryView = toolbar
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
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
                    
                    registerBtn.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor, constant: 32),
                    registerBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    registerBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    registerBtn.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16),
                    
                    errorNameShortLbl.topAnchor.constraint(equalTo: registerBtn.bottomAnchor, constant: 16),
                    errorNameShortLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    errorNameShortLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    
                    errorEmptyLbl.topAnchor.constraint(equalTo: errorNameShortLbl.bottomAnchor, constant: 16),
                    errorEmptyLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    errorEmptyLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    
                    errorPasswordMatchLbl.topAnchor.constraint(equalTo: errorEmptyLbl.bottomAnchor, constant: 16),
                    errorPasswordMatchLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    errorPasswordMatchLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    errorPasswordMatchLbl.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16),

                ])
        }


}

