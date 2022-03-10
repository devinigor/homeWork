//
//  SecondViewController.swift
//  Lesson 1. new
//
//  Created by Devins on 03.03.2022.
//

import Foundation
import AVFoundation
import UIKit

final class SecondViewController: UIViewController {
    
    @IBOutlet var labelPlayingFromAlbum: UILabel!
    @IBOutlet var labelSongName: UILabel!
    @IBOutlet var imageSong: UIImageView!
    @IBOutlet var labelNameSong1: UILabel!
    @IBOutlet var sliderSong: UISlider!
    @IBOutlet var startLabel: UILabel!
    @IBOutlet var endLabel: UILabel!
    @IBOutlet var labelNameSinger: UILabel!
    
    var player = AVAudioPlayer()
    
    var name = String()
    var nameSinger = String()
    var imageSong1 = UIImage()
    var timer: Timer?
    var timeSong = Double()
    var imageSongTwo = UIImage()
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSong.layer.cornerRadius = 5
        imageSong.image = imageSong1
        
        labelSongName.text = name
        labelNameSong1.text = name
        labelNameSinger.text = nameSinger
        
        sliderSong.setThumbImage(UIImage(systemName: "circle.fill"), for: .normal)
        sliderSong.tintColor = .systemGreen
        sliderSong.maximumValue = Float(player.duration)
        sliderSong.addTarget(self, action: #selector(sliderValue), for: .valueChanged)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        startLabel.text = String()
        startLabel.textColor = .lightGray
        startLabel.font = .systemFont(ofSize: 16)
        
        endLabel.text = String()
        endLabel.textColor = .lightGray
        endLabel.font = .systemFont(ofSize: 16)
        
    }
    
    @objc func updateTime() {
        
        let timePlayed = player.currentTime
        let minutes = Int(timePlayed / 60)
        let seconds = Int(timePlayed.truncatingRemainder(dividingBy: 60))
        startLabel.text = NSString(format: "%02d:%02d", minutes,seconds) as String
        
        let difftime = player.currentTime - timeSong
        let minutes1 = Int(difftime / 60)
        let seconds1 = Int(-difftime.truncatingRemainder(dividingBy: 60))
        endLabel.text = NSString(format: "%02d:%02d", minutes1,seconds1) as String
        
        sliderSong.setValue(Float(self.player.currentTime), animated: true)
    }
    
    @objc func sliderValue(sender: UISlider) {
        
        if sender == sliderSong {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    @IBAction func buttonPlayPause(_ sender: UIButton) {
        
        if player.isPlaying {
            
            player.pause()
            sender.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            sender.tintColor = .darkGray
            
        } else {
            
            player.play()
            sender.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            sender.tintColor = .darkGray
        }
    }
    
    @IBAction func buttonNextSong(_ sender: Any) {
        buttonBackSong(self)
    }
    
    @IBAction func buttonBackSong(_ sender: Any) {
        
        if self.count < 2 {
            self.count += 1
        } else {
            self.count = 1
        }
        
        let audioPath = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
        
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        
        if audioPath == Bundle.main.path(forResource: "Song1", ofType: "mp3") {
            labelSongName.text = "Blood TechnoRave"
            labelNameSong1.text = "Blood TechnoRave"
            labelNameSinger.text = "Ost Blade"
            imageSong.image = UIImage(named: "Blade")
            timeSong = 162
        }
        
        if audioPath == Bundle.main.path(forResource: "Song2", ofType: "mp3") {
            labelSongName.text = "Escape"
            labelNameSong1.text = "Escape"
            labelNameSinger.text = "Rupert Holmes"
            imageSong.image = UIImage(named: "rupert")
            timeSong = 237
        }
        
        player.play()
    }
    
    @IBAction func shareButton(_ sender: Any) {
        
        let activityItem = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Song1", ofType: "mp3")!)
        let activityItem2 = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Song2", ofType: "mp3")!)
        
        let audioPath = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
        
        if audioPath == Bundle.main.path(forResource: "Song1", ofType: "mp3") {
            let activityVC = UIActivityViewController(activityItems: [activityItem], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
            
        } else {
            
            let activityVC = UIActivityViewController(activityItems: [activityItem2], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func hideButton(_ sender: Any) {
        
        player.stop()
        dismiss(animated: true, completion: nil)
    }
}
