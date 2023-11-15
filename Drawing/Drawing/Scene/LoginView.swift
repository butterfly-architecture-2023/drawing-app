//
//  LoginView.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/14.
//

import UIKit

final class LoginView: UIView {
    var interactor: DrawingBusinessLogic?
    
    private let guideLabel = UILabel()
    private let textfield = UITextField()
    private let loginButton = UIButton()
    private let cancelButton = UIButton()
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clear() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.isHidden = true
            self.textfield.text = nil
            self.endEditing(true)
        }
    }
    
    @objc func cancelButtonTapped(_ sender: UIButton) {
        clear()
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        guard let id = textfield.text else { return }
        interactor?.requestLogin(id: id)
    }
}

extension LoginView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = NSString(string: textfield.text ?? "").replacingCharacters(in: range, with: string)
        let isButtonEnabled = newText.count >= 2
        loginButton.isEnabled = isButtonEnabled
        return true
    }
}

private extension LoginView {
    func layout() {
        insertUI()
        basicSetUI()
        anchorUI()
    }
    
    func insertUI() {
        addSubview(guideLabel)
        addSubview(textfield)
        addSubview(stackView)
        stackView.addArrangedSubview(cancelButton)
        stackView.addArrangedSubview(loginButton)
    }
    
    func basicSetUI() {
        viewBasicSet()
        guideLabelBasicSet()
        textfieldBasicSet()
        stackViewBasicSet()
        cancelButtonBasicSet()
        loginButtonBasicSet()
    }
    
    func anchorUI() {
        guideLabelAnchor()
        textfieldAnchor()
        stackViewAnchor()
        cancelButtonAnchor()
        loginButtonAnchor()
    }
    func viewBasicSet() {
        backgroundColor = .lightGray.withAlphaComponent(0.75)
        layer.cornerRadius = 5
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        clipsToBounds = true
    }
    
    func guideLabelBasicSet() {
        guideLabel.text = "로그인할 계정을 입력하세요"
        guideLabel.textColor = .black
        guideLabel.backgroundColor = .clear
        guideLabel.font = .boldSystemFont(ofSize: 20)
        guideLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func textfieldBasicSet() {
        textfield.placeholder = "이름/닉네임"
        textfield.backgroundColor = .white
        textfield.textAlignment = .left
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 5
        textfield.clipsToBounds = true
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocapitalizationType = .none
        textfield.leftViewMode = .always
        textfield.delegate = self
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
    }
    
    func loginButtonBasicSet() {
        loginButton.setTitle("로그인", for: .normal)
        loginButton.backgroundColor = .white
        loginButton.setTitleColor(.systemBlue, for: .normal)
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.borderWidth = 1
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.isEnabled = false
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    func cancelButtonBasicSet() {
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.backgroundColor = .white
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.layer.borderWidth = 1
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    func stackViewBasicSet() {
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func guideLabelAnchor() {
        NSLayoutConstraint.activate(
            [
                guideLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
                guideLabel.heightAnchor.constraint(equalToConstant: 30),
                guideLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
    }
    
    func textfieldAnchor() {
        NSLayoutConstraint.activate(
            [
                textfield.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 20),
                textfield.widthAnchor.constraint(equalToConstant: 200),
                textfield.heightAnchor.constraint(equalToConstant: 40),
                textfield.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
    }
    
    func loginButtonAnchor() {
        NSLayoutConstraint.activate(
            [
                loginButton.widthAnchor.constraint(equalToConstant: 100),
                loginButton.heightAnchor.constraint(equalToConstant: 40)
            ]
        )
    }
    func cancelButtonAnchor() {
        NSLayoutConstraint.activate(
            [
                cancelButton.widthAnchor.constraint(equalToConstant: 100),
                cancelButton.heightAnchor.constraint(equalToConstant: 40)
            ]
        )
    }
    
    func stackViewAnchor() {
        NSLayoutConstraint.activate(
            [
                stackView.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 30),
                stackView.widthAnchor.constraint(equalToConstant: 200),
                stackView.heightAnchor.constraint(equalToConstant: 40),
                stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
    }
}
