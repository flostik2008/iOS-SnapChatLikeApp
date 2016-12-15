//
//  Header.h
//  DevChat
//
//  Created by Evgeny Vlasov on 11/29/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

#ifndef Header_h
#define Header_h


@protocol AAPLCameraVCDelegate <NSObject>

-(void)shouldEnableRecordUI:(BOOL)enable;
-(void)shouldEnableCameraUI:(BOOL)enable;
-(void)canStartRecording;
-(void)recordingHasStarted; 
-(void)videoRecordingComplete:(NSURL*)videoURL;
-(void)videoRecordingFailed;
-(void)snapshotTaken:(NSData*)snapshotData;
-(void)snapshotFailed;


@end

#endif /* Header_h */
