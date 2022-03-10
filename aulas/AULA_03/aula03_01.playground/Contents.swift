import UIKit

enum State: String {
    case success = "Efetuado com sucesso!"
    case failure = "Falha, tente novamente!"
}

print(State.success)
print(State.success.rawValue)

enum Strings: String {
    case titleButton = "Nome do botão"
    case titleLabel = "O text referente"
}

let button = UIButton()
button.setTitle(Strings.titleButton.rawValue, for: .normal)

let label = UILabel()
label.text = Strings.titleLabel.rawValue


enum Page: Int {
    case one = 1, two, three, four
    
    func getPage() -> Int {
        return self.rawValue
    }
}

var pageTwo = Page.two

print(pageTwo.getPage())
