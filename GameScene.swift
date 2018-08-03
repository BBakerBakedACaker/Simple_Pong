//
//  GameScene.swift
//  Simple_Pong
//
//  Created by Brandon Baker on 8/3/18.
//  Copyright © 2018 Brandon Baker. All rights reserved.
//
//  Purpose:
//  This project will demonstrate the basics of creating a PONG application for ios devices. The reader will learn
//  how to create game objects in Xcode and to assign logic to those game objects. This basic PONG application will
//  walk through creating two paddles, a ball, and a label. At the end of this project the reader will see a simple
//  PONG application where the two paddles track the ball and hit the ball continuously.
//
//
//
//
//

//SpriteKit is a graphics and animation infrastructure that we will use in the project
import SpriteKit

//GameplayKit is a standard infrastructure used when creating a game
import GameplayKit

//Creating a GameScene Class
class GameScene: SKScene {
    
    //Creating Variables for the game objects. Paddle1 is the bottom paddle & Paddle2 is the top paddle.
    var ball = SKSpriteNode()
    var paddle1 = SKSpriteNode()
    var paddle2 = SKSpriteNode()
    
    //This is a function created by Xcode. Basically this function is checking to see if we are in the game view
    override func didMove(to view: SKView) {
        
        //Defining the variables created earlier and assigning them to the actual objects created in the GameScene.sks
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        
        paddle2 = self.childNode(withName: "paddle2") as! SKSpriteNode
        
        //Allowing our paddle2 position to automatically adjust for different screen sizes.
        paddle2.position.y = (self.frame.height / 2) - 50
        
        
        paddle1 = self.childNode(withName: "paddle1") as! SKSpriteNode
        
        //Allowing our paddle1 position to automatically adjust for different screen sizes.
        paddle1.position.y = (-self.frame.height / 2) + 50
        
        //Giving the screen a strict border so that the ball does not go off of the screen.
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        //Giving the border no friction so that the ball does not slow down due to physics.
        border.friction = 0
        
        //Giving the border restitution, or "bounciness" to allow the ball to bounce off the border.
        border.restitution = 1
        
        //Giving our border a physics body.
        self.physicsBody = border
        
        //Calling the "startGame()" function.
        startGame()
    }
    
    //This function applies conditions that we want to happen as soon as the game starts.
    func startGame(){
        
        //This applies an initial impulse, or movement to the ball in a 45 degree direction to the bottom left corner.
        ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: -10))
    }

    //This function is an Xcode created function which keeps track of where things are with each frame.
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        //A conditional statment checking where the ball is. Basically, if the ball is past the origin
        //and moving towards the top paddle, then the top paddle will start tracking the ball so that
        //it can hit the ball.
        if ball.position.y > 0 {
            paddle2.run(SKAction.moveTo(x: ball.position.x, duration: 0.3))
        }
        
        //A conditional statment checking where the ball is. Basically, if the ball is past the origin
        //and moving towards the bottom paddle, then the bottom paddle will start tracking the ball so that
        //it can hit the ball.
        else if ball.position.y < 0 {
            paddle1.run(SKAction.moveTo(x: ball.position.x, duration: 0.3))
        }
    }
}
