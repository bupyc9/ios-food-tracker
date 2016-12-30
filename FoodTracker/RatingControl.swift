//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Павел Афанасьев on 27/12/2016.
//
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    private var ratingButtons = [UIButton]();
    var rating = 0;
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons();
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons();
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame);
        setupButtons();
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder);
        setupButtons();
    }
    
    private func setupButtons() {
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            let button = UIButton();
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false;
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true;
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true;
        
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside);
        
            // Add the button to the stack
            addArrangedSubview(button);
            
            // Add the new button to the rating button array
            ratingButtons.append(button);
        }
        
    }

    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍");
    }
}
