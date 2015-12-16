import XCTest

class RegistrationSpec: XCTestCase {
    
    // MARK: - Accessibility Identifiers
    
    let invalidEmailAlertAccessibilityIdentifier    = "Invalid Email"
    let invalidPasswordAlertAccessibilityIdentifier = "Invalid Password"
    let submitAccessibilityIdentifier               = "Submit"
    let emailAccessibilityIdentifier                = "Email"
    let passwordAccessibilityIdentifier             = "Password"
    
    // MARK: Alert Messages
    
    let emptyEmailMessage               = "Please enter an email"
    let invalidEmailMessage             = "Please enter a valid email address"
    let emptyPasswordMessage            = "Please enter a password"
    let invalidPasswordMessage          = "Password must contain at least one capital letter, lowercase letter, number and special character"
    
    // MARK: Text Entry Strings
    
    let invalidEmail        = "invalidEmail"
    let validEmail          = "validEmail@validDomain.com"
    let invalidPassword     = "Passwor"
    let validPassword       = "Password1$"
        
    // MARK: Queries
    
    var app:                    XCUIApplication!
    var submitButton:           XCUIElement!
    var emailTextField:         XCUIElement!
    var passwordTextField:      XCUIElement!
    var validationAlert:        XCUIElement!
    
    // MARK: - Test Methods
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
        submitButton            = app.buttons[submitAccessibilityIdentifier]
        emailTextField          = app.textFields[emailAccessibilityIdentifier]
        passwordTextField       = app.secureTextFields[passwordAccessibilityIdentifier]
    }
    
    func testEmptyEmail() {
        
        submitButton.tap()
        
        validationAlert = app.alerts[invalidEmailAlertAccessibilityIdentifier]
        
        XCTAssert(validationAlert.exists)
        XCTAssert(validationAlert.staticTexts[emptyEmailMessage].exists)
    }
    
    func testInvalidEmail() {
        
        emailTextField.tap()
        emailTextField.typeText(invalidEmail)
        submitButton.tap()
        
        validationAlert = app.alerts[invalidEmailAlertAccessibilityIdentifier]
        
        XCTAssert(validationAlert.exists)
        XCTAssert(validationAlert.staticTexts[invalidEmailMessage].exists)
    }
    
    func testEmptyPassword() {
        
        emailTextField.tap()
        emailTextField.typeText(validEmail)
        submitButton.tap()
        
        validationAlert = app.alerts[invalidPasswordAlertAccessibilityIdentifier]
        
        XCTAssert(validationAlert.exists)
        XCTAssert(validationAlert.staticTexts[emptyPasswordMessage].exists)
    }
    
    func testInvalidPassword() {
        
        emailTextField.tap()
        emailTextField.typeText(validEmail)
        passwordTextField.tap()
        passwordTextField.typeText(invalidPassword)
        
        /* if it starts failing saying there is no keyboard in focus, make sure 
           connect hardware keyboards is off, or reset content and settings on simulator
        */
        
        submitButton.tap()
        
        validationAlert = app.alerts[invalidPasswordAlertAccessibilityIdentifier]
        
        XCTAssert(validationAlert.exists)
        XCTAssert(validationAlert.staticTexts[invalidPasswordMessage].exists)
    }
    
    func testAllValidFields() {
        // Let's show what happened when recording with this
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("validEmail@validDomain.com")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap() // 2 taps for no reason???
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("Password1$")
        app.buttons["Submit"].tap()
        
        // This will verify that you are on the next screen
        XCTAssert(app.staticTexts["Yay you logged in"].exists)
    }
}
