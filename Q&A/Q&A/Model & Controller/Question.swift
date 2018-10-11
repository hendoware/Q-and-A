import Foundation

struct Question: Equatable {   
    var question: String
    var asker: String
    var answer: String?
    var answerer: String?
    
    init(question: String, asker: String, answer: String? = nil, answerer: String? = nil) {
        
        self.question = question
        self.asker = asker
        self.answer = answer
        self.answerer = answerer
    }
}
