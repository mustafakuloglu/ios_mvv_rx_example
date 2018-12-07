//
//  LoginViewModel.swift
//  MvvmRxExample
//
//  Created by Mustafa Kuloğlu on 5.12.2018.
//  Copyright © 2018 Mustafa Kuloğlu. All rights reserved.
//

import RxSwift


class LoginViewModel:BaseViewModel {

    
    let emailValid = Variable(false)
    let passwordValid = Variable(false)
    let enterValid = Variable(false)
    

    func everyThingIsValid() -> Observable<Bool> {
        return Observable
            .combineLatest(emailValid.asObservable(), passwordValid.asObservable()) { $0 && $1 }
    }
    func validateEmail(with email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@([A-Za-z0-9.-]{2,64})+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        
        return predicate.evaluate(with: email)
    }
    
    func loginControl()  {
        enterValid.value = true
    }
    
    

}

