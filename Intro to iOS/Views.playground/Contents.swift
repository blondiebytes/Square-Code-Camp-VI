//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let spinner = UIImage(named: "spinner")

// What defines an image/view?
// Bounds (frame)
// Center
let imageView = UIImageView(frame: CGRect(origin: CGPointZero, size: spinner!.size))
imageView.image = spinner

imageView

imageView.bounds.size

let backgroundView = UIView(frame:CGRect(x: 0, y: 0, width: 300, height: 300))

backgroundView.backgroundColor = UIColor.orangeColor()

backgroundView.addSubview(imageView)
imageView.center = backgroundView.center
backgroundView

XCPlaygroundPage.currentPage.liveView = backgroundView

let animation = CABasicAnimation(keyPath: "transform.rotation")

animation.fromValue = 0.0

animation.toValue = 2 * M_PI

animation.duration = 1.0

animation.repeatCount = 15

imageView.layer.addAnimation(animation, forKey: "transform.rotation")

