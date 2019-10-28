//
//  RatingControl.swift
//  FirstiOSApp
//
//  Created by himanshu yadav on 27/10/19.
//  Copyright © 2019 himanshu yadav. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    var rating:Int = 0 {
        didSet {
            updateRating()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setUpButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setUpButtons()
        }
    }
    private var ratingButtons = [UIButton]()
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpButtons()
    }
    
    //MARK: Private Methods
    
    private func setUpButtons() {
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        for index in 0..<starCount {
            setUpSingleButton(index: index)
        }
        print(ratingButtons.count)
    }
    
    private func setUpSingleButton(index: Int) {
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        //Create the view
        let button = UIButton()
        button.setImage(emptyStar, for: .normal)
        button.setImage(filledStar , for: .selected)
        button.setImage(highlightedStar, for: .highlighted)
        button.setImage(highlightedStar, for: [.highlighted, .selected])
        
        //Set button accessibility label
        button.accessibilityLabel = "Set \(index + 1) star rating"
        
        //Set button constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        
        //Setup the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
        //Add the button to the stack view
        addArrangedSubview(button)
        ratingButtons.append(button)
    }
    
    func updateRating() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
            // Set the hint string for the currently selected star
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            // Calculate the value string
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
    
    //MARK: Button Actions
    @objc func ratingButtonTapped(button: UIButton) {
        let selectedRating = ratingButtons.firstIndex(of: button)!
        if selectedRating + 1 == rating {
            rating = 0
        }
        else {
            rating = selectedRating + 1
        }
    }
}
