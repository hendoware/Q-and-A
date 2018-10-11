import UIKit

class AskQuestionVC: UIViewController {
    var questionController: QuestionController?

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var questionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
        
    @IBAction func submitQuestion(_ sender: Any) {
        guard let name = nameField.text,
            let question = questionView.text
            else {return}
        questionController?.createQuestion(question: question, asker: name)
        navigationController?.popViewController(animated: true)
    }
}
