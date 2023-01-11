import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func sendMessage(_ sender: Any) {
        let alertController = UIAlertController(title: "New message", message: "Enter a new message", preferredStyle: .alert)
        alertController.addTextField { textfield in
            textfield.placeholder = "Your message..."
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alertController.addAction(UIAlertAction(title: "Send", style: .default, handler: { action in
            guard let text = alertController.textFields?.first?.text else {
                print("No Text Available")
                return
            }
            
            let message = Message(message: text)
            let postRequest = APIRequest(endpoint: "createMessage")
            
            postRequest.save(message, completion: { result in
                switch result {
                case .success(let message):
                    print("The following message has been sent: \(message.message)")
                case .failure(let error):
                    print("An Error occured: \(error)")
                }
            })
        }))
        self.present(alertController, animated: true)
    }
    
}

