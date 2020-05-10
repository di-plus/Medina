import UIKit

@IBDesignable
class CarouselItem: UIView {
    
    static let CAROUSEL_ITEM_NIB = "CarouselItem"
    
    @IBOutlet private var viewContent: UIView!
    @IBOutlet private var viewBackground: UIView!
    @IBOutlet private var labelTitle: UILabel!
    
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
