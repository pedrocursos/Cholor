import UIKit

/// Vista que recibe como parámetros las dimensiones de un área rectángular y su color.
open class RectanguloView: UIView {
    
    public init() {
        super.init(frame: .zero)
    }
    
    public convenience init(recuadro: CGRect, color: UIColor) {
        self.init()
        self.frame = recuadro
        self.backgroundColor = color
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) no ha sido implementado")
    }
}
