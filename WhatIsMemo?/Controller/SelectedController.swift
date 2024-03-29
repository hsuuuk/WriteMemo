//
//  PlusController.swift
//  WhatIsMemo?
//
//  Created by 심현석 on 2023/01/29.
//

import UIKit
import SnapKit

class SelectedController: UIViewController {
        
    var selectedData: CoreData? {
        didSet { configure() }
    }
    
    private let textLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.numberOfLines = 0
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func configure() {
        textLabel.text = selectedData?.text
    }
    
    func setupUI() {
        view.backgroundColor = .white

        view.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
    }
}
