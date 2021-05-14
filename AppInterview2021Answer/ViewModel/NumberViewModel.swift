//
//  NumberViewModel.swift
//  AppInterview2021Answer
//
//  Created by 李泰儀 on 2021/5/14.
//

import UIKit

public class NumberViewModel {
    
    private (set) var numbers = [Number]()
    
    public func getNumber(num: Int, completion: () -> ()) {
        var numbers = [Number]()
        
        var colors: [UIColor] = [.red, .red, .blue, .blue, .green]
        var repeatTimes = 0
        
        for i in 1...num {
            
            // Append Number
            let remainder = (i - 1) % 5
            numbers.append(Number(value: i, color: colors[remainder]))
            
            // Check colors and repeatTimes
            if i % 5 == 0 {
                if repeatTimes == 0 {
                    
                    repeatTimes = 1
                    
                    let removeColor = colors.removeLast()
                    let insertFirstColor = colors[0] == colors[1] ? removeColor : colors[0]
                    colors.insert(insertFirstColor, at: 0)
                }
                else {
                    repeatTimes -= 1
                }
            }
        }
        
        self.numbers = numbers
        completion()
    }
    
    public func clickNumber(indexPath: IndexPath, completion: (Number) -> ()) {
        if numbers.count > indexPath.row {
            numbers[indexPath.row].isSelected.toggle()
            completion(numbers[indexPath.row])
        }
    }
}
