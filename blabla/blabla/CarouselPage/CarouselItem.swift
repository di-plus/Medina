import UIKit

@IBDesignable
class CarouselItem: UIView {
    
    static let CAROUSEL_ITEM_NIB = "CarouselItem"
    weak var delegate: CaroudelItemDelegate?
    
    @IBOutlet private var viewContent: UIView!
    @IBOutlet private var viewBackground: UIView!
    @IBOutlet private var labelTitle: UILabel!
    
    @IBAction func skipButton(_ sender: UIButton) {
        delegate?.carouselView(view: self, didTouchCompleteButton: sender)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initWithNib()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initWithNib()
    }
    convenience init(titleText: String? = "", background: UIColor? = .white) {
        self.init()
        labelTitle.text = titleText
        labelTitle.textColor = .white
        viewBackground.backgroundColor = background
    }
    fileprivate func initWithNib() {
        Bundle.main.loadNibNamed(CarouselItem.CAROUSEL_ITEM_NIB, owner: self, options: nil)
        viewContent.frame = bounds
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(viewContent)
    }
}

protocol CaroudelItemDelegate: class {
    func carouselView(view: CarouselItem, didTouchCompleteButton button: UIButton)
}
