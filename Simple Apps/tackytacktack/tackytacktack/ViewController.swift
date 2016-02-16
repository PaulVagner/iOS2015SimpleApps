import UIKit

let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width

class ViewController: UIViewController {
    let cornerRadius: CGFloat = 10
    let borderWidth: CGFloat = 2
    let borderColor: CGColor = UIColor.blackColor().CGColor
    let backgroundColor = UIColor(red:0.84, green:0.93, blue:0.67, alpha:1)
    var grid = [[0,0,0],[0,0,0],[0,0,0]]
    
    //These "var"/s create VARIABLE objects
    var isPlayer1Turn = true
    var player1Score = 0 //player 1 score object
    var player2Score = 0 //player 2 score object
    var stalemateScore = 0 //stalemate score object
    var gameover = false
    
    //These "let"/s create the view labels and the "Game Reset" and "Score Reset" buttons and their attributes
    
    //sets up the game labels
    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 10, width: SCREEN_WIDTH, height: 50))
    let gameScoreLabel = UILabel(frame: CGRect(x: 0, y: SCREEN_HEIGHT - 120, width: SCREEN_WIDTH, height: 50))
    
    //sets up the action buttons
    let gameResetButton = UIButton(frame: CGRect(x: 5, y: SCREEN_HEIGHT - 60, width: SCREEN_WIDTH / 2 - 10, height: 50))
    let scoreResetButton = UIButton(frame: CGRect(x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT - 60, width: SCREEN_WIDTH / 2 - 5, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creates action Buttons
        gameResetButton.setTitle("Play Again", forState: UIControlState.Normal)
        gameResetButton.backgroundColor = UIColor(red:0.37, green:0.91, blue:0.3, alpha:1)
        gameResetButton.layer.cornerRadius = cornerRadius
        gameResetButton.layer.borderWidth = borderWidth
        gameResetButton.layer.borderColor = borderColor
        view.addSubview(gameResetButton)
        gameResetButton.addTarget(self, action: "resetGame", forControlEvents: .TouchUpInside)
        scoreResetButton.setTitle("Reset Score", forState: UIControlState.Normal)
        scoreResetButton.addTarget(self, action: "resetScore", forControlEvents: .TouchUpInside)
        view.addSubview(scoreResetButton)
        scoreResetButton.backgroundColor = UIColor(red:0.82, green:0.08, blue:0.07, alpha:1)
        scoreResetButton.layer.cornerRadius = cornerRadius
        scoreResetButton.layer.borderWidth = borderWidth
        scoreResetButton.layer.borderColor = borderColor
        view.backgroundColor = backgroundColor
        
        //creates Game Labels
        gameStatusLabel.text = "Purple Goes First"
        gameStatusLabel.textAlignment = .Center
        gameStatusLabel.center.x = view.center.x
        view.addSubview(gameStatusLabel)
        
        //These create the score label as text and what the text string has to say
        gameScoreLabel.text = "Purple: \(player1Score) Pink: \(player2Score) Draw: \(stalemateScore)"
        gameScoreLabel.textAlignment = .Center
        
        //this shows the position and alignment of the scorelabel
        gameScoreLabel.center.x = view.center.x
        
        //creates and adds the gameScoreLabel
        view.addSubview(gameScoreLabel)
        
        
        //tells which screen dimentions need to be used and binds them to the size of the hardware unit.
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
        
        //sets the dimention parameters of the game buttons and their spacing
        let buttonHW = 70
        let buttonSpacing = 7
        
        //creates the game grid of 3 buttons in height and width with 2 spaces in each row and column
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        //sets the left & top spacing for the game buttons
        let leftSpacing = (screenWidth - gridHW) / 2
        let topSpacing = (screenHeight - gridHW) / 2
        
        //
        for (r,row) in grid.enumerate() {
            
            //
            for (c,_) in row.enumerate() {
                
                //
                let x = c * (buttonHW + buttonSpacing) + leftSpacing
                let y = r * (buttonHW + buttonSpacing) + topSpacing
                
                
                //creates game buttons and their respective positions
                let button = TTTButton(frame: CGRect (x: x, y: y, width: buttonHW, height: buttonHW))
                button.layer.cornerRadius = 35
                button.layer.borderColor = borderColor
                button.layer.borderWidth = 2
                button.backgroundColor = UIColor(red:0.31, green:0.74, blue:0.95, alpha:1)
                button.row = r
                button.col = c
                
                //sets the button action
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                //creates and adds the gamebuttons
                view.addSubview(button)
                
            }
            
        }
    }
    //these commands simply reset all scores to "0"
    func resetScore() {
        gameScoreLabel.text = "Purple: \(player1Score) Pink: \(player2Score) Draw: \(stalemateScore)"
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
                gameStatusLabel.text = ""
            }
        }
    }
    //runs the commands of what happens when a game button is pressed
    func spacePressed(button: TTTButton) {
        
        if button.player == 0 && !gameover {
            //changes the button title for the "Play Again / Game Over" button
            gameResetButton.setTitle("End Game", forState: UIControlState.Normal)
            //changes the value of the player currently playing
            button.player = isPlayer1Turn ? 1 : 2
            grid[button.row][button.col] = isPlayer1Turn ? 1 : 2
            //changes the value of the gameStatusLabel depending players turn.
            gameStatusLabel.text = isPlayer1Turn ? "Pink GO!!" : "Purple GO!!"
            //changes the players turn
            isPlayer1Turn = !isPlayer1Turn
            //runs the "checkForWinner" function
            checkForWinner()
            //creates and adds the gameScoreLabel after each "spacePressed" function
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
                    gameStatusLabel.text = "Winner"
                    
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
        
                gameScoreLabel.text = "Purple: \(player1Score) Pink: \(player2Score) Draw: \(stalemateScore)"
        
    }
    
    class TTTButton: UIButton { //This creates a new class of object/s
        let cornerRadius: CGFloat = 10
        let borderWidth: CGFloat = 2
        let borderColor: UIColor = UIColor.blackColor()

        
        var row = 0
        var col = 0
        
        var player = 0 {
            
            
            didSet {
                switch player {
                    
                case 1: backgroundColor = UIColor(red:0.4, green:0.22, blue:0.94, alpha:1)
                case 2: backgroundColor = UIColor(red:0.97, green:0.54, blue:0.88, alpha:1)
                default : backgroundColor = UIColor(red:0.31, green:0.74, blue:0.95, alpha:1)
                    
                    
                }
                
            }
        }
    }
}


