//
//  TimelineView.swift
//  RxMarbles
//
//  Created by Roman Tutubalin on 21.01.16.
//  Copyright © 2016 Roman Tutubalin. All rights reserved.
//

import UIKit

class TimelineView: UIView {
    var _sourceEvents = [EventView]()
    let _timeArrow = UIImageView(image: Image.timeLine)
    var _addButton: UIButton?
    private var _parentViewController: ViewController!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(_timeArrow)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        frame = CGRectMake(10, frame.origin.y, (superview?.bounds.size.width)! - 20, 40)
        _timeArrow.frame = CGRectMake(0, 16, frame.width, Image.timeLine.size.height)
        if _addButton != nil {
            _addButton?.center.y = _timeArrow.center.y
            _addButton?.center.x = frame.size.width - 10.0
            let timeArrowFrame = _timeArrow.frame
            let newTimeArrowFrame = CGRectMake(timeArrowFrame.origin.x, timeArrowFrame.origin.y, timeArrowFrame.size.width - 23.0, timeArrowFrame.size.height)
            _timeArrow.frame = newTimeArrowFrame
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func maxNextTime() -> Int? {
        var times = Array<Int>()
        _sourceEvents.forEach { (eventView) -> () in
            if eventView.isNext {
                times.append(eventView._recorded.time)
            }
        }
        return times.maxElement()
    }
}