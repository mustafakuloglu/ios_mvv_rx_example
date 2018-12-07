//
//  ViewController.swift
//  MvvmRxExample
//
//  Created by Mustafa Kuloğlu on 5.12.2018.
//  Copyright © 2018 Mustafa Kuloğlu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: BaseViewController<LoginViewModel> {
    
    @IBOutlet weak var emailWarning: UILabel!
    @IBOutlet weak var passwordWarning: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var enter: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.rx.text.orEmpty.map {  $0.count >= 3 }
            .bind(to: viewModel.emailValid).disposed(by: disposeBag)
        
        password.rx.text.orEmpty.map { $0.count >= 3 }
            .bind(to: viewModel.passwordValid).disposed(by: disposeBag)
        
        viewModel.enterValid.asObservable().filter{$0}.subscribe({ it in
            self.openDeatail()
        }).disposed(by: disposeBag)
        
        viewModel.everyThingIsValid().bind(to: self.enter.rx.isEnabled).disposed(by: disposeBag)
    }
    
    @IBAction func enterAction(_ sender: Any) {
        viewModel.loginControl()
    }
    
    func openDeatail()  {
        self.performSegue(withIdentifier: "open_detail", sender: self)
    }
}

