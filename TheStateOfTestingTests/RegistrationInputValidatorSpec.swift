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
                    
                    /*
                        It may come in handy sometime to know how it's comparing the errors that were thrown
                        to see if they are the same or not. Every ErrorType enum has a ._domain and ._code property,
                        and they are && together to determine if they are the same. So, don't expect it to take your 
                        aggregate values passed with the enum into account. If you want that, either make the comparisons
                        to domain and code yourself, or provide a == operator for your specific enum that compares those and
                        Nimble will use that instead.
                    */
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
                    // Hey now I get to share this valid email with the rest of my tests
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
