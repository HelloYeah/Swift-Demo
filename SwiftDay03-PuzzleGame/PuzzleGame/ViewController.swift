//
//  ViewController.swift
//  PuzzleGame
//
//  Created by Sekorm on 2017/3/9.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

let ScreenW = UIScreen.main.bounds.width
let ScreenH = UIScreen.main.bounds.height
var count = 3

struct EmptyPosition {
    var  col : NSInteger
    var  row : NSInteger
}

class ViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var stepNumber: UILabel!
    
    var stepCount = 0
    
    private var emptyPosition : EmptyPosition = EmptyPosition.init(col: count - 1, row: count - 1) //空白Puzzle的位置
    private let width = ScreenW / 3.0
    private let height = ScreenW / 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let orginImage = UIImage.init(named: "1")
        let imageArray = NSMutableArray.init()
        
        for i in 0..<(count * count - 1) {
            let col = i % count
            let row = i / count
            let rect = CGRect(x: CGFloat(col) * width, y:CGFloat(row) * height, width: width, height: height)
            let image = self.clipImageInRect(rect: rect, orginImage: orginImage!)
            imageArray.add(image)
        }
        
        for i in 0..<(count * count - 1) {
            
            let col = i % count
            let row = i / count
            
            let randIndex = Int(arc4random()) % (imageArray.count)
            let image:UIImage = imageArray.object(at: randIndex) as! UIImage
            imageArray.remove(image)
            
            let rect = CGRect(x: CGFloat(col) * width, y:CGFloat(row) * height, width: width, height: height)
            let puzzle = Puzzle.init(image: image, withCol: col , withRow: row)
            let puzzleView = PuzzleView.init(frame: rect)
            puzzleView.puzzle = puzzle
            puzzleView.backgroundColor = UIColor.red
            container.addSubview(puzzleView)
            
            puzzleView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action:#selector(click)))
        }
    }
    
    //点击图片，进行移动
    func click(tap: UITapGestureRecognizer) {
        
        let puzzleView = tap.view as! PuzzleView
        let puzzle = puzzleView.puzzle!
        
        let col = puzzle.col
        let row = puzzle.row
        
        if col == emptyPosition.col  {
           
            if row! - emptyPosition.row == 1 {
                puzzle.move(direction: .DirectionUp)
                puzzleView.frame.origin.y -= height
                emptyPosition.row += 1
                stepCount += 1
            }
            if row! - emptyPosition.row == -1 {
               
                puzzle.move(direction: .DirectionDown)
                puzzleView.frame.origin.y += height
                emptyPosition.row -= 1
                stepCount += 1
            }
        }
        
        if row == emptyPosition.row  {
            
            if col! - emptyPosition.col == 1 {
                
                puzzle.move(direction: .DirectionLeft)
                puzzleView.frame.origin.x -= width
                emptyPosition.col += 1
                stepCount += 1
            }
            if col! - emptyPosition.col == -1 {
                
                puzzle.move(direction: .DirectionRight)
                puzzleView.frame.origin.x += width
                emptyPosition.col -= 1
                stepCount += 1
            }
        }
        
        stepNumber.text = "\(stepCount)"
    }
    
    func clipImageInRect(rect: CGRect, orginImage: UIImage) -> UIImage{
        let imageRef = orginImage.cgImage!.cropping(to: rect);
        let thumbScale = UIImage.init(cgImage: imageRef!)
        return thumbScale;
    }
}

