////////////////////////////////////////////////////////////////////////
// SKWMeshRoom.h
// SkyWay SDK
////////////////////////////////////////////////////////////////////////
#import "SKWRoom.h"

@class SKWMediaStream;

//! \~japanese メッシュルームクラス
//! \~english
//! \~
//!
//! \~japanese
//! ピアとの通信に複数のメディア接続とデータ接続を確立したルームです。
//! \~english
//! \~
@interface SKWMeshRoom : SKWRoom

//! \~japanese 現在のルームから退室します
//! \~english
//! \~
- (void)close;

//! \~japanese
//! 送信しているメディアストリームを更新します。
//! 受信のみモードから双方向に切り替えることも出来ます。
//! \~english
//! \~
//!
//! \code{.m}
//! SKWMeshRoom* room;
//! SKWMediaStream* stream;
//!
//! [room replaceStream:stream];
//!
//! \endcode
//!
//! @param newStream
//! \~japanese ルーム内のユーザに送るメディアストリーム
//! \~english
//! \~
- (void)replaceStream:(SKWMediaStream* __nullable)newStream;

@end
