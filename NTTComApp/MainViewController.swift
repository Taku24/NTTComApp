//
//  ViewController.swift
//  NTTComApp
//
//  Created by TAKU on 2017/09/09.
//  Copyright © 2017年 NttCmmApp. All rights reserved.
//

import UIKit
import SkyWay

class MainViewController: UIViewController {
    
    var targetView:SKWVideo!
    var myView:SKWVideo!
    
    var peer:SKWPeer!
    var localStream:SKWMediaStream!
    var remoteStream:SKWMediaStream!
    var mediaConnection:SKWMediaConnection!
    
    var id:String? = nil
    var isEstablished:Bool = false
    var peerIds: Array<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpViewoView()
        setUpSkyway()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUpViewoView(){
        let targetSize:CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
        let mySize:CGRect = CGRect(x: 180, y:420, width:200, height:200)
        targetView = SKWVideo(frame: targetSize)
        myView = SKWVideo(frame: mySize)
        self.view.addSubview(targetView)
        self.view.addSubview(myView)
    }
    
    private func setUpSkyway(){
        let option: SKWPeerOption = SKWPeerOption.init();
        let kAPIkey:String = "ff7b67c5-07e0-4fbc-9130-2895edb9480c"
        let kDomain:String = "nttcomapp"
        option.key = kAPIkey
        option.domain = kDomain
        option.debug = SKWDebugLevelEnum(rawValue: 3)!
        peer = SKWPeer(options: option)
        
        //ON
        peer.on(SKWPeerEventEnum.PEER_EVENT_OPEN,callback:{ (obj) -> Void in
            if let peerId = obj as? String{
                self.id = peerId
                DispatchQueue.main.async {
                    self.getPeerList()
                }
            }
        })
        
        //OFF
        peer.on(SKWPeerEventEnum.PEER_EVENT_ERROR,callback:{ (obj) -> Void in
            if let error:SKWPeerError = obj as? SKWPeerError{
                print(error)
            }
        })
        
        //メディアを取得
        SKWNavigator.initialize(peer);
        let constraints:SKWMediaConstraints = SKWMediaConstraints()
        localStream = SKWNavigator.getUserMedia(constraints)!
        
        //ローカルビデオメディアをセット
        myView.addSrc(localStream, track: 0)
        
        // MARK: 2.4.相手から着信
        
        //コールバックを登録（CALL)
        // MARK: PEER_EVENT_CALL
        peer?.on(SKWPeerEventEnum.PEER_EVENT_CALL, callback: { (obj) -> Void in
            self.mediaConnection = obj as? SKWMediaConnection
            self.mediaConnection?.answer(self.localStream);
            self.isEstablished = true
        })
    }
    
}

// MARK: 2.5.　相手へのビデオ発信
extension MainViewController{
    
    func getPeerList(){
        if let peer = self.peer, let myPeerId = self.id, myPeerId.characters.count != 0{
            peer.listAllPeers({ (peers) -> Void in
                if let connectedPeerIds = peers as? [String]{
                    self.peerIds = connectedPeerIds.filter({ (connectedPeerId) -> Bool in
                        return connectedPeerId != myPeerId
                    })
                    if self.peerIds.count > 0{
                        self.showPeerDialog()
                    }else{
                        let alert: UIAlertController = UIAlertController(title: "No connected peerIds", message: nil, preferredStyle:  .alert)
                        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
                        alert.addAction(cancelAction)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            })
        }
    }
    
    //ビデオ通話を開始する
    func call(strDestId: String) {
        let option = SKWCallOption()
        if let connection = peer?.call(withId: strDestId, stream: localStream, options: option){
            mediaConnection = connection
            self.setMediaCallbacks(media: connection)
            isEstablished = true
        }
    }
    
    //ビデオ通話を終了する
    func closeChat(){
        if let _ = mediaConnection, let _ = remoteStream{
            targetView.removeSrc(remoteStream, track: 0)
            remoteStream.close()
            remoteStream = nil
            mediaConnection?.close()
        }
    }
    
    func showPeerDialog(){
        let alert: UIAlertController = UIAlertController(title: "Select Call PeerID", message: nil, preferredStyle:  .alert)
        for peerId in peerIds{
            let action = UIAlertAction(title: peerId, style: .default) { _ in
                self.call(strDestId: peerId)
            }
            alert.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension MainViewController {
    func setMediaCallbacks(media:SKWMediaConnection){
        
        //コールバックを登録（Stream）
        // MARK: MEDIACONNECTION_EVENT_STREAM
        media.on(SKWMediaConnectionEventEnum.MEDIACONNECTION_EVENT_STREAM, callback: { (obj) -> Void in
            if let msStream = obj as? SKWMediaStream{
                self.remoteStream = msStream
                DispatchQueue.main.async {
                    self.targetView.isHidden = false
                    self.targetView.addSrc(self.remoteStream, track: 0)
                }
            }
        })
        
        //コールバックを登録（Close）
        // MARK: MEDIACONNECTION_EVENT_CLOSE
        media.on(SKWMediaConnectionEventEnum.MEDIACONNECTION_EVENT_CLOSE, callback: { (obj) -> Void in
            if let msStream = obj as? SKWMediaStream{
                self.remoteStream = msStream
                DispatchQueue.main.async {
                    self.targetView.removeSrc(msStream, track: 0)
                    self.remoteStream = nil
                    self.mediaConnection = nil
                    self.isEstablished = false
//                    self.targetView.isHidden = true
                }
            }
        })
    }
}
