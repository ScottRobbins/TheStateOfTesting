import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: -- Private Properties
    private let registrationInputValidator = RegistrationInputValidator()
    private let successfulLoginSegueIndentifier = "SuccessfulLoginSegueIdentifier"
    
    // MARK: -- Outlets
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFIeld: UITextField!
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("The State of Testing", comment: "")
        
        configureAllViews()
    }
    
    // MARK: - Configurations
    
    private func configureAllViews() {
        configureEmailLabel()
        configurePasswordLabel()
    }
    
    private func configureEmailLabel() {
         emailLabel.text = NSLocalizedString("Email", comment: "")
    }
    
    private func configurePasswordLabel() {
        passwordLabel.text = NSLocalizedString("Password", comment: "")
    }

    // MARK: - Actions
    
    @IBAction func submitButtonPressed(_: UIButton) {
        let emailEntry = emailTextField.text
        let passwordEntry = passwordTextFIeld.text
        
        do {
            try registrationInputValidator.validateInputWithEmail(emailEntry, andPassword: passwordEntry)
            self.performSegueWithIdentifier(successfulLoginSegueIndentifier, sender: self)
        } catch RegistrationInputValidatorError.EmptyEmail {
            let title = NSLocalizedString("Invalid Email", comment: "")
            let message = NSLocalizedString("Please enter an email", comment: "")
            
            alertUserWithString(title, message: message)
        } catch RegistrationInputValidatorError.InvalidEmailFormat {
            let title = NSLocalizedString("Invalid Email", comment: "")
            let message = NSLocalizedString("Please enter a valid email address", comment: "")
            
            alertUserWithString(title, message: message)
        } catch RegistrationInputValidatorError.EmptyPassword {
            let title = NSLocalizedString("Invalid Password", comment: "")
            let message = NSLocalizedString("Please enter a password", comment: "")
            
            alertUserWithString(title, message: message)
        } catch RegistrationInputValidatorError.InvalidPasswordFormat {
            let title = NSLocalizedString("Invalid Password", comment: "")
            let message = NSLocalizedString("invald_password_key", comment: "")
            
            alertUserWithString(title, message: message)
        } catch {
            let title = NSLocalizedString("Error", comment: "")
            
            alertUserWithString(title)
        }
    }
    
    @IBAction func viewWasTapped(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    // MARK: - Alert User
    
    private func alertUserWithString(title: String? = nil, message: String? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

