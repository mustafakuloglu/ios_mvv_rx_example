//
//  BaseViewController.swift
//  MvvmRxExample
//
//  Created by Mustafa Kuloğlu on 5.12.2018.
//  Copyright © 2018 Mustafa Kuloğlu. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController<T : BaseViewModel>: UIViewController {
    
    let disposeBag = DisposeBag()
    let viewModel = T()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.viewDidDisappear()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
