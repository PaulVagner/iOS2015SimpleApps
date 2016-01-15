import UIKit

let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width


class ViewController: UIViewController {
    
    var grid = [[0,0,0],[0,0,0],[0,0,0]]
    
    //These "var"/s create VARIABLE objects
    var isPlayer1Turn = true
    var player1Score = 0 //player 1 score object
    var player2Score = 0 //player 2 score object
    var stalemateScore = 0 //stalemate score object
    
    var gameover = false
    
    //These "let"/s create the view labels and the "Game Reset" and "Score Reset" buttons and their attributes
    
    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 10, width: SCREEN_WIDTH, height: 50))
    let gameScoreLabel = UILabel(frame: CGRect(x: 0, y: SCREEN_HEIGHT - 120, width: SCREEN_WIDTH, height: 50))
    let gameResetButton = UIButton(frame: CGRect(x: 0, y: SCREEN_HEIGHT - 60, width: SCREEN_WIDTH / 2, height: 50))
    let scoreResetButton = UIButton(frame: CGRect(x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT - 60, width: SCREEN_WIDTH / 2, height: 50))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //these create the button text and its attributes
        gameResetButton.setTitle("Play Again", forState: UIControlState.Normal)
        gameResetButton.backgroundColor = UIColor.magentaColor()
        view.addSubview(gameResetButton)
        gameResetButton.addTarget(self, action: "resetGame", forControlEvents: .TouchUpInside)
        
        scoreResetButton.setTitle("Reset Score", forState: UIControlState.Normal)
        scoreResetButton.addTarget(self, action: "resetScore", forControlEvents: .TouchUpInside)
        view.addSubview(scoreResetButton)
        scoreResetButton.backgroundColor = UIColor.blueColor()
        
        
        
        view.backgroundColor = UIColor.whiteColor()
        
        
        gameStatusLabel.text = "Player 1 Turn"
        gameStatusLabel.textAlignment = .Center
        
        gameStatusLabel.center.x = view.center.x
        
        
        view.addSubview(gameStatusLabel)
        
        //These create the score label as text and what the text string has to say
        gameScoreLabel.text = "Score: P 1:\(player1Score) P 2:\(player2Score) S:\(stalemateScore) "
        gameScoreLabel.textAlignment = .Center
        
        //this shows the position and alignment of the scorelabel
        gameScoreLabel.center.x = view.center.x
        
        
        view.addSubview(gameScoreLabel)
        
        
        //tells which screen dimentions need to be used and binds them to the size of the hardware unit.
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
        
        //sets the dimention parameters of the buttons and their spacing
        let buttonHW = 60
        let buttonSpacing = 4
        
        //creates the game grid of 3 buttons in height and width with 2 spaces in each row and column
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        //
        let leftSpacing = (screenWidth - gridHW) / 2
        let topSpacing = (screenHeight - gridHW) / 2
        
        //
        for (r,row) in grid.enumerate() {
            
            //
            for (c,_) in row.enumerate() {
                
                //
                let x = c * (buttonHW + buttonSpacing) + leftSpacing
                let y = r * (buttonHW + buttonSpacing) + topSpacing
                
                
                //
                let button = TTTButton(frame: CGRect (x: x, y: y, width: buttonHW, height: buttonHW))
                button.backgroundColor = UIColor.cyanColor()
                button.row = r
                button.col = c
                
                //
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                
                
                
                view.addSubview(button)
                
            }
            
        }
    }
    //these commands simply reset all scores to "0"
    func resetScore() {
        
        gameScoreLabel.text = "Score: P 1:\(player1Score) P 2:\(player2Score) S:\(stalemateScore)"
        player1Score = 0
        player2Score = 0
        stalemateScore = 0
        
        
        
    }
    //this function resets the gameboard to new
    func resetGame() {
        
        
        gameResetButton.setTitle("Play Again", forState: UIControlState.Normal)
        
        grid = [[0,0,0],[0,0,0],[0,0,0]]
        
        for subview in view.subviews {
            
            if let button = subview as? TTTButton {
                
                button.player = 0
                gameover = false
            }
            
        }
        
        
    }
    
    func spacePressed(button: TTTButton) {
        
        
        if button.player == 0 && !gameover {
            
            
            gameResetButton.setTitle("End Game", forState: UIControlState.Normal)
            
            button.player = isPlayer1Turn ? 1 : 2
            
            grid[button.row][button.col] = isPlayer1Turn ? 1 : 2
            
            
            
            gameStatusLabel.text = isPlayer1Turn ? "Player 2" : "Player 1 "
            
            
            isPlayer1Turn = !isPlayer1Turn
            
            
            checkForWinner()
            
            view.addSubview(gameScoreLabel)
            
            
            
            
            
        }
        
        
    }
    
    func checkForWinner() {
        
        let possibilities = [
            ((0,0),(0,1),(0,2)),
            ((1,0),(1,1),(1,2)),
            ((2,0),(2,1),(2,2)),
            ((0,0),(1,0),(2,0)),
            ((0,1),(1,1),(2,1)),
            ((0,2),(1,2),(2,2)),
            ((0,0),(1,1),(2,2)),
            ((2,0),(1,1),(0,2))]
        
        
        
        for possibility in possibilities {
            let (p1, p2, p3) = possibility
            
            
            //
            let value1 = grid[p1.0][p1.1]
            let value2 = grid[p2.0][p2.1]
            let value3 = grid[p3.0][p3.1]
            
            if value1 == value2 && value2 == value3 {
                
                
                
                if value1 != 0 {
                    
                    print("Player \(value1) Wins")
                    
                    if !isPlayer1Turn {
                        
                        player1Score++
                        
                    } else {
                        
                        player2Score++
                        
                        print("all zeros")
                    }
                    
                    
                    gameResetButton.setTitle("Play Again", forState: UIControlState.Normal)
                    gameover = true
                    
                    
                } else {
                    
                    
                    print("does not match")
                    
                    
                }
                
            }
            
        }
        
        // check for no zeros
        
        var stalemate = true
        
        for row in grid {
            
            for col in row {
                
                if col == 0 { stalemate = false }
                
            }
            
        }
        
        if stalemate {
            
            stalemateScore++
            
        }
        
                gameScoreLabel.text = "Score: P 1:\(player1Score) P 2:\(player2Score) S:\(stalemateScore)"
        
    }
    
    
    
    class TTTButton: UIButton { //This creates a new class of object/s
        var row = 0
        var col = 0
        
        var player = 0 {
            
            
            didSet {
                switch player {
                    
                    
                case 1: backgroundColor = UIColor.magentaColor()
                case 2: backgroundColor = UIColor.yellowColor()
                default : backgroundColor = UIColor.cyanColor()
                    
                    
                }
                
            }
        }
    }
    
    
    
}


