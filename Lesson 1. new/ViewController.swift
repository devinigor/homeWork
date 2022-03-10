//
//  ViewController.swift
//  Lesson 1. new
//
//  Created by Devins on 07.02.2022.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    
//MARK: - Outlets
    @IBOutlet var labelPlayList: UILabel!
    
    @IBOutlet var imageFirstSong: UIImageView!
    @IBOutlet var imageSecondSong: UIImageView!
    
    @IBOutlet var buttonNameSong: UIButton!
    @IBOutlet var buttonNameSinger: UIButton!
    @IBOutlet var labelTimeSong: UILabel!
    
    @IBOutlet var labelTimeSong2: UILabel!
    @IBOutlet var buttonNameSong2: UIButton!
    @IBOutlet var buttonNameSinger2: UIButton!
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set image for song
        imageFirstSong.image = UIImage(named: "Blade")
        imageSecondSong.image = UIImage(named: "rupert")
        
        //Set time for first song
        labelTimeSong.text = "6:38"
        labelTimeSong.font = .systemFont(ofSize: 18, weight: .semibold)
        labelTimeSong.textColor = .darkGray
        
        //Second Song
        labelTimeSong2.text = "4:33"
        labelTimeSong2.font = .systemFont(ofSize: 18, weight: .semibold)
        labelTimeSong2.textColor = .darkGray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showView",
           let destination = segue.destination as? SecondViewController {
            destination.name = "Ost Blade"
            destination.nameSinger = "Blade blood rave"
            destination.imageSong1 = imageFirstSong.image!
            destination.timeSong = 162
            
            do {
    if let audioPath = Bundle.main.path(forResource: "Song1", ofType: "mp3") {
    try destination.player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
    }
            } catch {
                print("Error")
            }
                destination.player.play()
        }
        
        if segue.identifier == "showView2",
           let destination = segue.destination as? SecondViewController {
            
            destination.name = "Escape"
            destination.nameSinger = "Rupert Holmes"
            destination.imageSong1 = imageSecondSong.image!
            destination.timeSong = 237
            
            do {
                if let audioPath = Bundle.main.path(forResource: "Song2", ofType: "mp3") {
                    try destination.player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                }
            } catch {
                print("Error")
            }
            
            destination.player.play()
        }
    }
}

