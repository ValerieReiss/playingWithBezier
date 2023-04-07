//
//  GameScene.swift
//  Playing with Bezier
//
//  Created by Valerie on 30.03.23.
//

// augment the playerCoins by touching the player

import SpriteKit
import GameplayKit

var object = SKSpriteNode(imageNamed: "Planisferius")
var player = SKSpriteNode(imageNamed: "Planisferius")
var backgroundColorCustom = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)


class GameScene: SKScene{

    override func didMove(to view: SKView) {
        self.backgroundColor = backgroundColorCustom
        spawnPlayer()
        spawnObject()
    }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
            
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    func didBegin(_ contact: SKPhysicsContact){
    }

    override func update(_ currentTime: TimeInterval) {
    }
    
    func spawnPlayer(){
        player.name = "player"
        player.physicsBody = SKPhysicsBody(circleOfRadius: 16)
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.texture!.size())
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.isDynamic = true
        player.position = CGPointMake(self.frame.midX - 400, self.frame.midY)
        player.setScale(0.1)
        self.addChild(player)
        
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addCurve(to: CGPoint(x: 450, y: 300), controlPoint1: CGPoint(x: 100, y: 100), controlPoint2: CGPoint(x: 300, y: -200))
        let movement = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: 300)
        let sequence = SKAction.sequence([movement, .removeFromParent()])
        player.run (sequence)
    
        
    }
    func spawnObject(){
        object.name = "object"
        object.physicsBody = SKPhysicsBody(circleOfRadius: 16)
        object.physicsBody = SKPhysicsBody(texture: object.texture!, size: object.texture!.size())
        object.physicsBody?.affectedByGravity = false
        object.physicsBody?.isDynamic = true
        object.position = CGPointMake(self.frame.midX + 400, self.frame.midY)
        object.setScale(0.1)
        self.addChild(object)
        
        let path1 = UIBezierPath()
        path1.move(to: .zero)
        path1.addCurve(to: CGPoint(x: -500, y: 300), controlPoint1: CGPoint(x: -200, y: 200), controlPoint2: CGPoint(x: -400, y: -200))
        let movement1 = SKAction.follow(path1.cgPath, asOffset: true, orientToPath: true, speed: 300)
        let sequence1 = SKAction.sequence([movement1, .removeFromParent()])
        object.run (sequence1)
    }
    
}
