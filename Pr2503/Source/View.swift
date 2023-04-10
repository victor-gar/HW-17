//
//  View.swift
//  Pr2503
//
//  Created by Victor Garitskyu on 10.04.2023.
//

import UIKit
import SnapKit
import Lottie

class View: UIView {
    
    private var progressView: LottieAnimationView?
          
    //MARK: - UI Elements
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Your password."
        label.font = UIFont(name: "Digital-7Mono", size: 18)
        label.textColor = .systemGreen
        return label
    }()
    
    lazy var lineTop: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    lazy var image: UIView = {
        let view = UIView()
        view.bounds = CGRect(x: 0, y: 0, width: 250, height: 250)
        return view
    }()
    
    lazy var lineBottom: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    lazy var activituIndicator: UIActivityIndicatorView = {
        let activituIndicator = UIActivityIndicatorView(style: .large)
        activituIndicator.isHidden = true
        activituIndicator.color = UIColor.green
        return activituIndicator
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.systemGreen.cgColor
        textField.layer.borderWidth = 1
        textField.attributedPlaceholder = NSAttributedString(string: "Random Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.green])
        textField.textColor = UIColor.systemGreen
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        textField.keyboardType = .alphabet
        return textField
    }()
    
    lazy var buttonStop: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.setTitle("Stop", for: .normal)
        button.titleLabel?.font = UIFont(name: "Digital-7Mono", size: 18)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var buttonRandomPass: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.setTitle("Generate Password", for: .normal)
        button.titleLabel?.font = UIFont(name: "Digital-7Mono", size: 18)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var buttonPasswordCrack: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.setTitle("Crack password", for: .normal)
        button.titleLabel?.font = UIFont(name: "Digital-7Mono", size: 18)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    //MARK: - Inits
    init() {
        super.init(frame: .zero)
        backgroundColor = .black
        setupHierachy()
        setupLayout()
        startProgress()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    //MARK: - Setups
    
    func setupHierachy() {
        addSubview(buttonStop)
        addSubview(buttonRandomPass)
        addSubview(buttonPasswordCrack)
        addSubview(lineTop)
        addSubview(lineBottom)
        addSubview(textField)
        addSubview(label)
        addSubview(image)
        addSubview(activituIndicator)
        progressView = .init(name: "5digital")
        progressView!.contentMode = .scaleAspectFit
        progressView!.frame = image.bounds
        image.addSubview(progressView!)
    }
    private func startProgress() {
        progressView?.play(fromFrame: 0, toFrame: ProgressKeyFrames.start.rawValue, loopMode: .loop) { [weak self] (_) in
        self?.startDownload()
      }
    }

    private func startDownload() {
      progressView?.play(fromFrame: ProgressKeyFrames.start.rawValue, toFrame: ProgressKeyFrames.end.rawValue, loopMode: .none) { [weak self] (_) in
        self?.endDownload()
      }
    }

    private func endDownload() {
        progressView?.play(fromFrame: ProgressKeyFrames.end.rawValue, toFrame: ProgressKeyFrames.complete.rawValue, loopMode: .none)
    }
    
    func setupLayout() {
        label.snp.makeConstraints { make in
            make.centerX.equalTo(textField.snp.centerX).offset(15)
            make.top.equalTo(400)
        }
        buttonStop.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(100)
            make.width.equalTo(label.snp.width)
        }
        buttonRandomPass.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalTo(label.snp.bottom).offset(100)
            make.width.equalTo(label.snp.width)
        }
        buttonPasswordCrack.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(label.snp.bottom).offset(100)
            make.width.equalTo(label.snp.width)
        }
        
        activituIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(textField.snp.centerX)
            make.bottom.equalTo(label.snp.top).offset(-65)
            make.height.equalTo(5)
            make.width.equalTo(5)
        }
    
        lineTop.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(label.snp.top).offset(-40)
            make.height.equalTo(1)
        }
        lineBottom.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(textField.snp.bottom).offset(40)
            make.height.equalTo(1)
        }
        
        textField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(50)
            make.top.equalTo(label.snp.bottom).offset(10)
        }
        image.snp.makeConstraints { make in
            make.centerX.equalTo(150)
            make.top.equalTo(70)
            make.width.equalTo(122)
            make.height.equalTo(122)
        }

        
    }

}
