import UIKit

open class FondoView: UIView {
    
    public init() {
        super.init(frame: .zero)
    }
    
    public convenience init(recuadro: CGRect, color: UIColor = .white) {
        self.init()
        self.frame = recuadro
        self.backgroundColor = color
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) no ha sido implementado")
    }
}

