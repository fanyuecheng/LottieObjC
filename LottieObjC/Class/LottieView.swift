//
//  LottieView.swift
//  LottieObjC
//
//  Created by 米画师 on 2024/4/16.
//

import Foundation
import UIKit
import Lottie

@objcMembers
public class LottieView : UIView {
    
    lazy var animationView : LottieAnimationView = LottieAnimationView()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(animationView)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(animationView)
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        animationView.frame = self.bounds
    }

    public var loop: Bool {
        get {
            return animationView.loopMode == .loop
        }
        set {
            animationView.loopMode = newValue ? .loop : .playOnce
        }
    }
    
    public var speed: CGFloat {
        get {
            return animationView.animationSpeed
        }
        set {
            animationView.animationSpeed = newValue
        }
    }

    public var progress: AnimationProgressTime {
        get {
            return animationView.currentProgress
        }
        set {
            animationView.currentProgress = newValue
        }
    }
    
    public func loadAnimation(name animationName: String) {
        let animation = LottieAnimation.named(animationName)
        animationView.animation = animation
    }
    
    public func loadAnimation(json animationJSON: [String: Any]) {
        do {
            let animation = try LottieAnimation.init(dictionary: animationJSON)
            animationView.animation = animation
        } catch {
            assertionFailure("Could not read Lottie json file")
        }
    }
    
    public var isAnimationPlaying: Bool {
        return animationView.isAnimationPlaying
    }

    public func play(completion: LottieCompletionBlock? = nil) {
        if isAnimationPlaying {
            return
        }
        animationView.play(completion: completion)
    }
    
    public func play() {
        if isAnimationPlaying {
            return
        }
        animationView.play()
    }

    public func stop() {
        if isAnimationPlaying {
            animationView.stop()
        }
    }

    public func pause() {
        if isAnimationPlaying {
            animationView.pause()
        }
    }
    
    public func play(fromProgress from: AnimationProgressTime,
                     toProgress to: AnimationProgressTime,
                     loop loopBool: Bool,
                     completion: LottieCompletionBlock? = nil) {
        let loopMode:LottieLoopMode = loopBool ? .loop : .playOnce
        animationView.play(fromProgress: from, toProgress: to, loopMode: loopMode, completion: completion)
    }
    
    public func play(fromProgress from: AnimationProgressTime,
                     toProgress to: AnimationProgressTime,
                     completion: LottieCompletionBlock? = nil) {
        animationView.play(fromProgress: from, toProgress: to, loopMode: nil, completion: completion)
    }
    
    public func play(toProgress to: AnimationProgressTime,
                     loop loopBool: Bool,
                     completion: LottieCompletionBlock? = nil) {
        let loopMode:LottieLoopMode = loopBool ? .loop : .playOnce
        animationView.play(fromProgress: nil, toProgress: to, loopMode: loopMode, completion: completion)
    }
    
    public func play(toProgress to: AnimationProgressTime,
                     completion: LottieCompletionBlock? = nil) {
        animationView.play(fromProgress: nil, toProgress: to, loopMode: nil, completion: completion)
    }
   
    public func play(fromFrame from: AnimationFrameTime,
                     toFrame to: AnimationFrameTime,
                     loop loopBool: Bool,
                     completion: LottieCompletionBlock? = nil) {
        let loopMode:LottieLoopMode = loopBool ? .loop : .playOnce
        animationView.play(fromFrame: from, toFrame: to, loopMode: loopMode, completion: completion)
    }
   
    public func play(fromFrame from: AnimationFrameTime,
                     toFrame to: AnimationFrameTime,
                     completion: LottieCompletionBlock? = nil) {
        animationView.play(fromFrame: from, toFrame: to, loopMode: nil, completion: completion)
    }
   
    public func play(toFrame to: AnimationFrameTime,
                     loop loopBool: Bool,
                     completion: LottieCompletionBlock? = nil) {
        let loopMode:LottieLoopMode = loopBool ? .loop : .playOnce
        animationView.play(fromFrame: nil, toFrame: to, loopMode: loopMode, completion: completion)
    }
    
    public func play(toFrame to: AnimationFrameTime,
                     completion: LottieCompletionBlock? = nil) {
        animationView.play(fromFrame: nil, toFrame: to, loopMode: nil, completion: completion)
    }
   
    public func play(fromMarker from: String,
                     toMarker to: String,
                     loop loopBool: Bool,
                     completion: LottieCompletionBlock? = nil) {
        let loopMode:LottieLoopMode = loopBool ? .loop : .playOnce
        animationView.play(fromMarker: from, toMarker: to, loopMode: loopMode, completion: completion)
    }
   
    public func play(fromMarker from: String,
                     toMarker to: String,
                     completion: LottieCompletionBlock? = nil) {
        animationView.play(fromMarker: from, toMarker: to, loopMode: nil, completion: completion)
    }
    
    public func play(toMarker to: String,
                     loop loopBool: Bool,
                     completion: LottieCompletionBlock? = nil) {
        let loopMode:LottieLoopMode = loopBool ? .loop : .playOnce
        animationView.play(fromMarker: nil, toMarker: to, loopMode: loopMode, completion: completion)
    }
    
    public func play(toMarker to: String,
                     completion: LottieCompletionBlock? = nil) {
        animationView.play(fromMarker: nil, toMarker: to, loopMode: nil, completion: completion)
    }
}
 
 
