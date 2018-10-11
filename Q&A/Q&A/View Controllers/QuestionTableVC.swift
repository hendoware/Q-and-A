import UIKit

class QuestionTableVC: UITableViewController {
    var questionController = QuestionController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionController.questions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as? QuestionTableVCCell else { return UITableViewCell() }
        let question = questionController.questions[indexPath.row]
        cell.question = question
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let question = questionController.questions[indexPath.row]
            questionController.deleteQuestion(question: question )
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "answerQuestionSegue") {
            guard let answerQuestionVC = segue.destination as? AnswerViewController else { return }
            answerQuestionVC.questionController = questionController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            answerQuestionVC.question = questionController.questions[indexPath.row]
        } else if(segue.identifier == "askQuestionSegue") {
            guard let askQuestionVC = segue.destination as? AskQuestionVC else { return }
            askQuestionVC.questionController = questionController
        }
    }
}
