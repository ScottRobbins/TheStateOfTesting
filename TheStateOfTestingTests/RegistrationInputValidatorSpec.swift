import Quick
import Nimble
@testable import TheStateOfTesting

class RegistrationInputValidatorSpec: QuickSpec {
    
    override func spec() {
        
        var registrationInputValidator: RegistrationInputValidator!
        
        beforeEach {
            registrationInputValidator = RegistrationInputValidator()
        }
        
        describe("validate input with email and password") {
            
            var email: String?
            var password: String?
            
            context("when the email is invalid") {
                
                context("when the email is empty") {
                    
                    beforeEach {
                        email = ""
                    }
                    
                    it("throws an error") {
                        expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                            .to(throwError())
                    }
                    
                    it("throws correct error") {
                        expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                            .to(throwError(RegistrationInputValidatorError.EmptyEmail))
                    }
                }
                
                context("when the email is nil") {
                    
                    beforeEach {
                        email = nil
                    }
                    
                    it("throws an error") {
                        expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                            .to(throwError())
                    }
                    
                    it("throws correct error") {
                        expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                            .to(throwError(RegistrationInputValidatorError.EmptyEmail))
                    }
                }
                
                context("when the email has an invalid format") {
                    
                    beforeEach {
                        email = "srscottrobbins"
                    }
                    
                    it("throws an error") {
                        expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                            .to(throwError())
                    }
                    
                    it("throws correct error") {
                        expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                            .to(throwError(RegistrationInputValidatorError.InvalidEmailFormat))
                    }
                }
            }
            
            context("when the email is valid") {
                
                beforeEach {
                    email = "srscottrobbins@gmail.com"
                }
                
                context("when the password is invalid") {
                    
                    context("when the password is empty") {
                        
                        beforeEach {
                            password = ""
                        }
                        
                        it("throws an error") {
                            expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                                .to(throwError())
                        }
                        
                        it("throws correct error") {
                            expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                                .to(throwError(RegistrationInputValidatorError.EmptyPassword))
                        }
                    }
                    
                    context("when the password is nil") {
                        
                        beforeEach {
                            password = nil
                        }
                        
                        it("throws an error") {
                            expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                                .to(throwError())
                        }
                        
                        it("throws correct error") {
                            expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                                .to(throwError(RegistrationInputValidatorError.EmptyPassword))
                        }
                    }
                    
                    context("when the password doesn't have an uppercase letter") {
                        
                        beforeEach {
                            password = "password1$"
                        }
                        
                        it("throws an error") {
                            expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                                .to(throwError())
                        }
                        
                        it("throws correct error") {
                            expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                                .to(throwError(RegistrationInputValidatorError.InvalidPasswordFormat))
                        }
                    }
                    
                    context("when the password doesn't have a lowercase letter") {
                        
                        beforeEach {
                            password = "PASSWORD1$"
                        }
                        
                        it("throws an error") {
                            expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                                .to(throwError())
                        }
                        
                        it("throws correct error") {
                            expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                                .to(throwError(RegistrationInputValidatorError.InvalidPasswordFormat))
                        }
                    }
                    
                    context("when the password doesn't have a number") {
                        
                        beforeEach {
                            password = "Password$"
                        }
                        
                        it("throws an error") {
                            expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                                .to(throwError())
                        }
                        
                        it("throws correct error") {
                            expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                                .to(throwError(RegistrationInputValidatorError.InvalidPasswordFormat))
                        }
                    }
                    
                    context("when the password doesn't have a special character") {
                        
                        beforeEach {
                            password = "Password1"
                        }
                        
                        it("throws an error") {
                            expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                                .to(throwError())
                        }
                        
                        it("throws correct error") {
                            expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                                .to(throwError(RegistrationInputValidatorError.InvalidPasswordFormat))
                        }
                    }
                }
                
                context("when the password is valid") {
                    beforeEach {
                        password = "Password1$"
                    }
                    
                    it("throws an error") {
                        expect { try registrationInputValidator.validateInputWithEmail(email, andPassword: password) }
                            .toNot(throwError())
                    }
                }
            }
        }
    }
}
