//
//  PlusController.swift
//  WhatIsMemo?
//
//  Created by 심현석 on 2023/01/29.
//

import UIKit
import SnapKit

class PlusController: UIViewController {
    
    let dataManager = CoreDataManager.shared
        
    private let plusMemoTextView: InputTextView = {
        let tv = InputTextView()
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.placeholderText = "내용을 입력하세요."
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white

        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = .black
        
        let rightBarButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        rightBarButton.tintColor = .black
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
        navigationItem.rightBarButtonItems = [rightBarButton, shareButton]
        
        view.addSubview(plusMemoTextView)
        plusMemoTextView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    @objc func rightBarButtonTapped() {
        if let text = plusMemoTextView.text, text != "" {
            dataManager.createMemo(Text: text) {
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func shareButtonTapped() {
        guard let text = plusMemoTextView.text, !text.isEmpty else { return }
        
        let controller = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(controller, animated: true, completion: nil)
    }
}
