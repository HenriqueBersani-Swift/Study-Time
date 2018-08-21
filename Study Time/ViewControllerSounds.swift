//
//  ViewControllerSounds.swift
//  Study Time
//
//  Created by Henrique Bersani on 8/19/18.
//  Copyright © 2018 Henrique Bersani. All rights reserved.
//

import UIKit
import AVFoundation

var songs: [String] = []
var audioPlayer = AVAudioPlayer()
var thisSong = 0
var audioStuffed = false

class ViewControllerSounds: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        cell.textLabel?.text = songs[indexPath.row]
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do {
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            audioPlayer.numberOfLoops = -1
            thisSong = indexPath.row
            audioStuffed = true
            musicLabel.text = songs[thisSong]
            pauseOutlet.isHidden = false
        }catch{
            print("ERROR")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      gettingSongName()
        // Do any additional setup after loading the view.
        

    }
  
    // Music Section
    
    @IBOutlet weak var playOutlet: UIButton!
    
    @IBOutlet weak var pauseOutlet: UIButton!
    
    
    @IBOutlet weak var musicLabel: UILabel!
    
    @IBAction func play(_ sender: Any) {
        print(songs)
        if audioStuffed == true && audioPlayer.isPlaying == false {
            audioPlayer.play()
            pauseOutlet.isHidden = false
        } else {
            
        }
    }
    
    @IBAction func preview(_ sender: Any) {
        if audioStuffed == true && thisSong != 0 {
            playThis(thisOne: songs[thisSong-1])
            thisSong -= 1
            musicLabel.text = songs[thisSong]
        } else {
           
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        if audioStuffed == true && audioPlayer.isPlaying {
            audioPlayer.pause()
            pauseOutlet.isHidden = true
            playOutlet.isHidden = false
        } else {
            
        }
    }
    
    @IBAction func next(_ sender: Any) {
        if audioStuffed == true && thisSong < songs.count-1 {
            playThis(thisOne: songs[thisSong+1])
            thisSong += 1
            musicLabel.text = songs[thisSong]
        }
        else {
            
        }
        
    }
    
    @IBAction func slider(_ sender: UISlider) {
        if audioStuffed == true {
            audioPlayer.volume = sender.value
        }
    }
    
    func playThis(thisOne: String){
        do {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            
            
            
        }catch{
            print("ERROR")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    //
    func gettingSongName() {
        
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        do {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            for song in songPath {
                var mySong = song.absoluteString
                
                if mySong.contains(".mp3")
                {
               let findString = mySong.components(separatedBy: "/")
                   mySong = findString[findString.count-1]
                   mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                   mySong =   mySong.replacingOccurrences(of: ".mp3", with: "")
                  songs.append(mySong)
                }
            }
            myTableView.reloadData()
        } catch {
            
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
