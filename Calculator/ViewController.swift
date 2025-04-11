import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings:String = ""
    
    override func viewDidLayoutSubviews() {
        divideButton.layer.cornerRadius = 10
        acButton.layer.cornerRadius = 10
        deleteButton.layer.cornerRadius = 10
        percentButton.layer.cornerRadius = 10
        multiplyButton.layer.cornerRadius = 10
        nineButton.layer.cornerRadius = 10
        eightButton.layer.cornerRadius = 10
        sevenButton.layer.cornerRadius = 10
        sixButton.layer.cornerRadius = 10
        fiveButton.layer.cornerRadius = 10
        fourButton.layer.cornerRadius = 10
        threeButton.layer.cornerRadius = 10
        twoButton.layer.cornerRadius = 10
        oneButton.layer.cornerRadius = 10
        zeroButton.layer.cornerRadius = 10
        minusButton.layer.cornerRadius = 10
        plusButton.layer.cornerRadius = 10
        doneButton.layer.cornerRadius = 10
        dotButton.layer.cornerRadius = 10
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll()
    {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    @IBAction func equalsTap(_ sender: Any)
    {
        if(validInput())
        {
            let checkedWorkingForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
        else
        {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator unable to do math based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            if(index == workings.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }

    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func allClearTap(_ sender: Any)
    {
        clearAll()
    }
    
    @IBAction func backTap(_ sender: Any)
    {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    func addToWorkings(value: String)
    {
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    @IBAction func percentTap(_ sender: Any)
    {
        addToWorkings(value: "%")
    }
    
    @IBAction func divideTap(_ sender: Any)
    {
        addToWorkings(value: "/")
    }
    
    @IBAction func timesTap(_ sender: Any)
    {
        addToWorkings(value: "*")
    }
    
    @IBAction func minusTap(_ sender: Any)
    {
        addToWorkings(value: "-")
    }
    
    @IBAction func plusTap(_ sender: Any)
    {
        addToWorkings(value: "+")
    }
    
    @IBAction func decimalTap(_ sender: Any)
    {
        addToWorkings(value: ".")
    }
    
    @IBAction func zeroTap(_ sender: Any)
    {
        addToWorkings(value: "0")
    }
    
    @IBAction func oneTap(_ sender: Any)
    {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any)
    {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any)
    {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any)
    {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any)
    {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any)
    {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any)
    {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any)
    {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any)
    {
        addToWorkings(value: "9")
    }
    
    
}

