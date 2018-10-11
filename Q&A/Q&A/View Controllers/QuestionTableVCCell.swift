import UIKit

class QuestionTableVCCell: UITableViewCell {
    var questionController: QuestionController?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var askedByLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!

    var question: Question? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews(){
        questionLabel?.text = question?.question
        askedByLabel?.text = question?.asker
        question?.answer == nil ? (answerLabel?.text = "Can you answer this?") : (answerLabel?.text = "Tap to view answer.")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

