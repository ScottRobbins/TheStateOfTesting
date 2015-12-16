import UIKit

enum RegistrationInputValidatorError: ErrorType {
    case EmptyEmail
    case InvalidEmailFormat
    case EmptyPassword
    case InvalidPasswordFormat
}

struct RegistrationInputValidator {
    
    // MARK: - Interface
    
    /// Validates email and password. Will throw exception if invalid
    func validateInputWithEmail(email: String?, andPassword password: String?) throws {
        try validateEmail(email)
        try validatePassword(password)
    }
    
    private func validateEmail(email: String?) throws {
        guard let email = email where !email.isEmpty else {
            throw RegistrationInputValidatorError.EmptyEmail
        }
        
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        guard emailTest.evaluateWithObject(email) else {
            throw RegistrationInputValidatorError.InvalidEmailFormat
        }
    }
    
    // MARK: - Validation methods
    
    private func validatePassword(password: String?) throws {
        guard let password = password where !password.isEmpty else {
            throw RegistrationInputValidatorError.EmptyPassword
        }
        
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let capitalTest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        guard capitalTest.evaluateWithObject(password) else {
            throw RegistrationInputValidatorError
                .InvalidPasswordFormat
        }
        
        let lowercaseLetterRegEx  = ".*[a-z]+.*"
        let lowerCaseTest = NSPredicate(format:"SELF MATCHES %@", lowercaseLetterRegEx)
        guard lowerCaseTest.evaluateWithObject(password) else {
            throw RegistrationInputValidatorError
                .InvalidPasswordFormat
        }
        
        let numberRegEx  = ".*[0-9]+.*"
        let numberTest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        guard numberTest.evaluateWithObject(password) else {
            throw RegistrationInputValidatorError
                .InvalidPasswordFormat
        }
        
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        let specialCharacterTest = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        guard specialCharacterTest.evaluateWithObject(password) else {
            throw RegistrationInputValidatorError
                .InvalidPasswordFormat
        }
    }
}
