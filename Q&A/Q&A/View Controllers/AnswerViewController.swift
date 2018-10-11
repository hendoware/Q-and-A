import UIKit
    
class AnswerViewController: UIViewController {
    var questionController: QuestionController?
    var question: Question?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var answerField: UITextView!
   
    @IBAction func submitAnswer(_ sender: Any) {
        guard let name = nameField.text,
            let answer = answerField.text,
            let question = question
            else {return}
        questionController?.updateQuestion(question: question, answer: answer, answerer: name)
        navigationController?.popViewController(animated: true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
        
    private func updateViews() {
        if(question?.answer != nil && question?.answer != nil) {
            nameField?.text = question?.answerer
            answerField?.text = question?.answer
        }
        self.title = question?.question
        nameLabel?.text = question?.asker
        questionLabel.text = question?.question
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
