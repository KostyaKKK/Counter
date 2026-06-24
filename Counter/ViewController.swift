//
//  ViewController.swift
//  Counter
//
//  Created by Константин Кащеев on 24.06.2026.
//

import UIKit

class ViewController: UIViewController {
        
    
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    private var count: Int = 0
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    private func logAction(_ message: String) {
        let timeStamp = dateFormatter.string(from: Date())
        historyTextView.text += "\(timeStamp): \(message)\n"
        
        let range = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(range)
    }
    
    private func updateCounter() {
        counterLabel.text = "Значение счетчика: \(count)"
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        count = 0
        updateCounter()
        logAction("Значение сброшено")
    }
    
    @IBAction func plusPressed(_ sender: UIButton) {
        count += 1
        updateCounter()
        logAction("изменено на +1")
    }
    
    @IBAction func minusPressed(_ sender: UIButton) {
        if count > 0 {
            count -= 1
            updateCounter()
            logAction("изменено на -1")
        } else {
            logAction("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}

