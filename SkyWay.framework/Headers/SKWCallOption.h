////////////////////////////////////////////////////////////////////////
// SKWCallOption.h
// SkyWay SDK
////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>

//! \~japanese SKWPeer call オプション
//! \~english SKWPeer call options
//! \~
@interface SKWCallOption : NSObject < NSCopying >

//! \~japanese メタデータを指定します
//! \~english
//! Any type of metadata associated with the connection,
//! passed in by whoever initiated the connection.
//! \~
@property (nonatomic) NSString* __nullable metadata;

//! \~japanese コネクション ID を指定します
//! \~english
//! \~
@property (nonatomic) NSString* __nullable connectionId;

//! \~japanese ストリームのラベルを指定します
//! \~english
//! \~
@property (nonatomic) NSString* __nullable label;

//! \~japanese 映像の最大バンド幅を kbps で指定します。
//! \~english A max video bandwidth(kbps)
//! \~
@property (nonatomic) NSUInteger videoBandwidth;

//! \~japanese 音声の最大バンド幅を kbps で指定します。
//! \~english A max audio bandwidth(kbps)
//! \~
@property (nonatomic) NSUInteger audioBandwidth;

//! \~japanese 映像コーデックを明示的に指定します。 (例:H264)
//! \~english A video codec like 'H264'
//! \~
@property (nonatomic) NSString* __nullable videoCodec;

//! \~japanese 音声コーデックを明示的に指定します。 (例:PCMU)
//! \~english A audio codec like 'PCMU'
//! \~
@property (nonatomic) NSString* __nullable audioCodec;

@end
