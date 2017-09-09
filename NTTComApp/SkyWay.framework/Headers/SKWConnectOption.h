////////////////////////////////////////////////////////////////////////
// SKWConnectOption.h
// SkyWay SDK
////////////////////////////////////////////////////////////////////////
#import "SKWConnection.h"

//! \~japanese SKWPeer connect オプション
//! \~english SKWPeer connect options
//! \~
@interface SKWConnectOption : NSObject < NSCopying >

//! \~japanese ストリームのラベルを指定します
//! \~english The optional label passed in or assigned by PeerJS when the connection was initiated.
//! \~
@property (nonatomic) NSString* __nullable label;

//! \~japanese メタデータを指定します
//! \~english Any type of metadata associated with the connection, passed in by whoever initiated the connection.
//! \~
@property (nonatomic) NSString* __nullable metadata;

//! \~japanese データシリアライズ種別を指定します
//! \~english The serialization format of the data sent over the connection.
//! \~
@property (nonatomic) SKWSerializationEnum serialization;

#ifndef DOXYGEN_SKIP_THIS
//! \~japanese 廃止されました。互換性のために残っています。
//! \~english Whether the underlying data channels are reliable; defined when the connection was initiated.
//! \~
//! \deprecated
@property (nonatomic) BOOL reliable __attribute__((deprecated));
#endif // !DOXYGEN_SKIP_THIS

@end
