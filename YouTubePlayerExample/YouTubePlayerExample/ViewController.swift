//
//  ViewController.swift
//  YouTubePlayerExample
//
//  Created by Giles Van Gruisen on 1/31/15.
//  Copyright (c) 2015 Giles Van Gruisen. All rights reserved.
//

import UIKit
import YouTubePlayer

class ViewController: UIViewController {

    @IBOutlet var playerView: YouTubePlayerView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var currentTimeButton: UIButton!
    @IBOutlet var durationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func play(_ sender: Any) {
        if playerView.ready {
            if playerView.playerState != YouTubePlayerState.Playing {
                playerView.play()
                playButton.setTitle("Pause", for: [])
            } else {
                playerView.pause()
                playButton.setTitle("Play", for: [])
            }
        }
    }

    @IBAction func prev(_ sender: Any) {
        playerView.previousVideo()
    }

    @IBAction func next(_ sender: Any) {
        playerView.nextVideo()
    }

    @IBAction func loadVideo(_ sender: Any) {
        print("yo")
        playerView.playerVars = [
            "playsinline": "1" as AnyObject,
            "controls": "1" as AnyObject,
            "showinfo": "0" as AnyObject
        ]
        playerView.loadVideoID("j7NIdg9mof0")
    }

    @IBAction func loadPlaylist(_ sender: Any) {
        playerView.loadPlaylistID("RDe-ORhEE9VVg")
    }
    
    @IBAction func currentTime(_ sender: Any) {
        let title = String(format: "Current Time %@", playerView.getCurrentTime() ?? "0")
        currentTimeButton.setTitle(title, for: [])
    }
    
    @IBAction func duration(_ sender: Any) {
        let title = String(format: "Duration %@", playerView.getDuration() ?? "0")
        durationButton.setTitle(title, for: [])
    }

    func showAlert(message: String) {
        self.present(alertWithMessage(message: message), animated: true, completion: nil)
    }

    func alertWithMessage(message: String) -> UIAlertController {
        let alertController =  UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

        return alertController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

