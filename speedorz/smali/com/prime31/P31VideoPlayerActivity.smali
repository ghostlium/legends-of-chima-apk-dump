.class public Lcom/prime31/P31VideoPlayerActivity;
.super Landroid/app/Activity;
.source "P31VideoPlayerActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnBufferingUpdateListener;
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/widget/MediaController$MediaPlayerControl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/prime31/P31VideoPlayerActivity$ScalingMode;
    }
.end annotation


# static fields
.field private static final SAVED_POSITION:Ljava/lang/String; = "SAVED_POSITION"

.field private static final TAG:Ljava/lang/String; = "Prime31"


# instance fields
.field private _bufferedPercent:I

.field private _closeOnTouch:Z

.field private _holder:Landroid/view/SurfaceHolder;

.field private _isRemoteVideo:Z

.field private _isVideoReadyToBePlayed:Z

.field private _isVideoSizeKnown:Z

.field private _layout:Landroid/widget/FrameLayout;

.field private _mediaController:Landroid/widget/MediaController;

.field private _mediaPlayer:Landroid/media/MediaPlayer;

.field private _path:Ljava/lang/String;

.field private _preview:Landroid/view/SurfaceView;

.field private _savedPositionBeforeRotation:I

.field private _scalingMode:I

.field private _showControls:Z

.field private _videoHeight:I

.field private _videoWidth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 26
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 34
    iput v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_savedPositionBeforeRotation:I

    .line 40
    iput-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_isVideoSizeKnown:Z

    .line 41
    iput-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_isVideoReadyToBePlayed:Z

    .line 42
    iput-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_isRemoteVideo:Z

    .line 44
    iput-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_closeOnTouch:Z

    .line 26
    return-void
.end method

.method private adjustVideoSize()V
    .locals 11

    .prologue
    .line 198
    iget v8, p0, Lcom/prime31/P31VideoPlayerActivity;->_scalingMode:I

    sget-object v9, Lcom/prime31/P31VideoPlayerActivity$ScalingMode;->FILL:Lcom/prime31/P31VideoPlayerActivity$ScalingMode;

    invoke-virtual {v9}, Lcom/prime31/P31VideoPlayerActivity$ScalingMode;->ordinal()I

    move-result v9

    if-ne v8, v9, :cond_1

    .line 239
    :cond_0
    :goto_0
    return-void

    .line 202
    :cond_1
    iget-object v8, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v8}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v8

    if-nez v8, :cond_0

    .line 205
    const-string v8, "window"

    invoke-virtual {p0, v8}, Lcom/prime31/P31VideoPlayerActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/WindowManager;

    .line 206
    .local v5, "winMan":Landroid/view/WindowManager;
    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Display;->getHeight()I

    move-result v4

    .line 207
    .local v4, "winHeight":I
    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Display;->getWidth()I

    move-result v6

    .line 210
    .local v6, "winWidth":I
    const/4 v3, 0x0

    .local v3, "width":I
    const/4 v0, 0x0

    .line 212
    .local v0, "height":I
    iget v8, p0, Lcom/prime31/P31VideoPlayerActivity;->_scalingMode:I

    sget-object v9, Lcom/prime31/P31VideoPlayerActivity$ScalingMode;->ASPECT_FIT:Lcom/prime31/P31VideoPlayerActivity$ScalingMode;

    invoke-virtual {v9}, Lcom/prime31/P31VideoPlayerActivity$ScalingMode;->ordinal()I

    move-result v9

    if-ne v8, v9, :cond_4

    .line 214
    iget v8, p0, Lcom/prime31/P31VideoPlayerActivity;->_videoWidth:I

    int-to-float v8, v8

    iget v9, p0, Lcom/prime31/P31VideoPlayerActivity;->_videoHeight:I

    int-to-float v9, v9

    div-float v2, v8, v9

    .line 215
    .local v2, "ratio":F
    int-to-float v8, v6

    int-to-float v9, v4

    div-float v7, v8, v9

    .line 217
    .local v7, "windowRatio":F
    cmpg-float v8, v7, v2

    if-gtz v8, :cond_3

    .line 219
    move v3, v6

    .line 220
    int-to-float v8, v3

    iget v9, p0, Lcom/prime31/P31VideoPlayerActivity;->_videoHeight:I

    int-to-float v9, v9

    iget v10, p0, Lcom/prime31/P31VideoPlayerActivity;->_videoWidth:I

    int-to-float v10, v10

    div-float/2addr v9, v10

    mul-float/2addr v8, v9

    float-to-int v0, v8

    .line 234
    .end local v2    # "ratio":F
    .end local v7    # "windowRatio":F
    :cond_2
    :goto_1
    const-string v8, "Prime31"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "calculated video width: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", height: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v8, 0x11

    invoke-direct {v1, v3, v0, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 238
    .local v1, "localLayoutParams":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v8, p0, Lcom/prime31/P31VideoPlayerActivity;->_layout:Landroid/widget/FrameLayout;

    iget-object v9, p0, Lcom/prime31/P31VideoPlayerActivity;->_preview:Landroid/view/SurfaceView;

    invoke-virtual {v8, v9, v1}, Landroid/widget/FrameLayout;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 224
    .end local v1    # "localLayoutParams":Landroid/widget/FrameLayout$LayoutParams;
    .restart local v2    # "ratio":F
    .restart local v7    # "windowRatio":F
    :cond_3
    move v0, v4

    .line 225
    int-to-float v8, v0

    mul-float/2addr v8, v2

    float-to-int v3, v8

    .line 227
    goto :goto_1

    .line 228
    .end local v2    # "ratio":F
    .end local v7    # "windowRatio":F
    :cond_4
    iget v8, p0, Lcom/prime31/P31VideoPlayerActivity;->_scalingMode:I

    sget-object v9, Lcom/prime31/P31VideoPlayerActivity$ScalingMode;->NONE:Lcom/prime31/P31VideoPlayerActivity$ScalingMode;

    invoke-virtual {v9}, Lcom/prime31/P31VideoPlayerActivity$ScalingMode;->ordinal()I

    move-result v9

    if-ne v8, v9, :cond_2

    .line 230
    iget v3, p0, Lcom/prime31/P31VideoPlayerActivity;->_videoWidth:I

    .line 231
    iget v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_videoHeight:I

    goto :goto_1
.end method

.method private doCleanUp()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 365
    iput v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_videoWidth:I

    .line 366
    iput v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_videoHeight:I

    .line 367
    iput-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_isVideoReadyToBePlayed:Z

    .line 368
    iput-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_isVideoSizeKnown:Z

    .line 369
    return-void
.end method

.method private releaseMediaPlayer()V
    .locals 1

    .prologue
    .line 352
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 357
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 358
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    .line 360
    :cond_0
    return-void
.end method

.method private startVideoPlayback()V
    .locals 3

    .prologue
    .line 374
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_holder:Landroid/view/SurfaceHolder;

    iget v1, p0, Lcom/prime31/P31VideoPlayerActivity;->_videoWidth:I

    iget v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_videoHeight:I

    invoke-interface {v0, v1, v2}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 377
    iget v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_savedPositionBeforeRotation:I

    if-lez v0, :cond_0

    .line 379
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    iget v1, p0, Lcom/prime31/P31VideoPlayerActivity;->_savedPositionBeforeRotation:I

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 380
    const/4 v0, 0x0

    iput v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_savedPositionBeforeRotation:I

    .line 383
    :cond_0
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 384
    return-void
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    .prologue
    .line 390
    const/4 v0, 0x1

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    .line 396
    const/4 v0, 0x1

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    .line 402
    const/4 v0, 0x1

    return v0
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    .line 408
    iget v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_bufferedPercent:I

    return v0
.end method

.method public getCurrentPosition()I
    .locals 1

    .prologue
    .line 414
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 415
    const/4 v0, 0x0

    .line 417
    :goto_0
    return v0

    .line 416
    :cond_0
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    iput v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_savedPositionBeforeRotation:I

    .line 417
    iget v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_savedPositionBeforeRotation:I

    goto :goto_0
.end method

.method public getDuration()I
    .locals 1

    .prologue
    .line 423
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 424
    const/4 v0, 0x0

    .line 425
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    goto :goto_0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 431
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 432
    const/4 v0, 0x0

    .line 433
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    goto :goto_0
.end method

.method public onBufferingUpdate(Landroid/media/MediaPlayer;I)V
    .locals 0
    .param p1, "arg0"    # Landroid/media/MediaPlayer;
    .param p2, "percent"    # I

    .prologue
    .line 244
    iput p2, p0, Lcom/prime31/P31VideoPlayerActivity;->_bufferedPercent:I

    .line 245
    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2
    .param p1, "arg0"    # Landroid/media/MediaPlayer;

    .prologue
    .line 250
    const-string v0, "Prime31"

    const-string v1, "onCompletion"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    iget-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_showControls:Z

    if-nez v0, :cond_0

    .line 254
    const-string v0, "Prime31"

    const-string v1, "video complete. releasing player and finishing"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->releaseMediaPlayer()V

    .line 256
    invoke-virtual {p0}, Lcom/prime31/P31VideoPlayerActivity;->finish()V

    .line 258
    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 123
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 124
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 60
    const v2, 0x1030007

    invoke-virtual {p0, v2}, Lcom/prime31/P31VideoPlayerActivity;->setTheme(I)V

    .line 61
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 64
    invoke-virtual {p0}, Lcom/prime31/P31VideoPlayerActivity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    .line 65
    .local v1, "returnData":Landroid/os/Bundle;
    if-eqz v1, :cond_0

    .line 67
    const-string v2, "SAVED_POSITION"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_savedPositionBeforeRotation:I

    .line 68
    const-string v2, "Prime31"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "retrieved saved position: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Lcom/prime31/P31VideoPlayerActivity;->_savedPositionBeforeRotation:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    :cond_0
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_layout:Landroid/widget/FrameLayout;

    .line 74
    new-instance v2, Landroid/view/SurfaceView;

    invoke-direct {v2, p0}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_preview:Landroid/view/SurfaceView;

    .line 75
    iget-object v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_layout:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/prime31/P31VideoPlayerActivity;->_preview:Landroid/view/SurfaceView;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 77
    iget-object v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_layout:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v2}, Lcom/prime31/P31VideoPlayerActivity;->setContentView(Landroid/view/View;)V

    .line 80
    iget-object v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_preview:Landroid/view/SurfaceView;

    invoke-virtual {v2}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v2

    iput-object v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_holder:Landroid/view/SurfaceHolder;

    .line 81
    iget-object v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_holder:Landroid/view/SurfaceHolder;

    invoke-interface {v2, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 82
    iget-object v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_holder:Landroid/view/SurfaceHolder;

    const/4 v3, 0x3

    invoke-interface {v2, v3}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 85
    invoke-virtual {p0}, Lcom/prime31/P31VideoPlayerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 86
    .local v0, "extras":Landroid/os/Bundle;
    const-string v2, "showControls"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_showControls:Z

    .line 89
    iget-boolean v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_showControls:Z

    if-nez v2, :cond_1

    .line 90
    const-string v2, "closeOnTouch"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_closeOnTouch:Z

    .line 92
    :cond_1
    const-string v2, "path"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_path:Ljava/lang/String;

    .line 93
    iget-object v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_path:Ljava/lang/String;

    const-string v3, "http"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_isRemoteVideo:Z

    .line 94
    iget-object v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_layout:Landroid/widget/FrameLayout;

    const-string v3, "color"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 95
    const-string v2, "scalingMode"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_scalingMode:I

    .line 96
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 326
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 327
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->releaseMediaPlayer()V

    .line 328
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->doCleanUp()V

    .line 329
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 316
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 318
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->releaseMediaPlayer()V

    .line 319
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->doCleanUp()V

    .line 320
    return-void
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 2
    .param p1, "mediaplayer"    # Landroid/media/MediaPlayer;

    .prologue
    .line 283
    const-string v0, "Prime31"

    const-string v1, "onPrepared called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_isVideoReadyToBePlayed:Z

    .line 286
    iget-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_isVideoReadyToBePlayed:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_isVideoSizeKnown:Z

    if-eqz v0, :cond_0

    .line 288
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->adjustVideoSize()V

    .line 289
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->startVideoPlayback()V

    .line 291
    :cond_0
    return-void
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 113
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 114
    .local v0, "data":Landroid/os/Bundle;
    const-string v1, "SAVED_POSITION"

    iget v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_savedPositionBeforeRotation:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 116
    return-object v0
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 102
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 103
    const-string v0, "Prime31"

    const-string v1, "onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->releaseMediaPlayer()V

    .line 105
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "evt"    # Landroid/view/MotionEvent;

    .prologue
    .line 335
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    .line 337
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaController:Landroid/widget/MediaController;

    invoke-virtual {v0, p1}, Landroid/widget/MediaController;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 346
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 339
    :cond_1
    iget-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_showControls:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_closeOnTouch:Z

    if-eqz v0, :cond_0

    .line 341
    const-string v0, "Prime31"

    const-string v1, "screen touched and closeOnTouch is true. releasing player and finishing"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->releaseMediaPlayer()V

    .line 343
    invoke-virtual {p0}, Lcom/prime31/P31VideoPlayerActivity;->finish()V

    goto :goto_0
.end method

.method public onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .locals 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 263
    const-string v0, "Prime31"

    const-string v1, "onVideoSizeChanged called"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    if-eqz p2, :cond_0

    if-nez p3, :cond_2

    .line 266
    :cond_0
    const-string v0, "Prime31"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "invalid video width("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") or height("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    :cond_1
    :goto_0
    return-void

    .line 269
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_isVideoSizeKnown:Z

    .line 270
    iput p2, p0, Lcom/prime31/P31VideoPlayerActivity;->_videoWidth:I

    .line 271
    iput p3, p0, Lcom/prime31/P31VideoPlayerActivity;->_videoHeight:I

    .line 273
    iget-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_isVideoReadyToBePlayed:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_isVideoSizeKnown:Z

    if-eqz v0, :cond_1

    .line 275
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->adjustVideoSize()V

    .line 276
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->startVideoPlayback()V

    goto :goto_0
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 439
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 442
    :goto_0
    return-void

    .line 441
    :cond_0
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    goto :goto_0
.end method

.method public playVideo()V
    .locals 10

    .prologue
    .line 130
    const-string v0, "Prime31"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "preparing to play video: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/prime31/P31VideoPlayerActivity;->_path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->doCleanUp()V

    .line 135
    :try_start_0
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    .line 138
    iget-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_isRemoteVideo:Z

    if-eqz v0, :cond_1

    .line 140
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/prime31/P31VideoPlayerActivity;->_path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 160
    :goto_0
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/prime31/P31VideoPlayerActivity;->_holder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 161
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 162
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 163
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 164
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 165
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 166
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 168
    iget-boolean v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_showControls:Z

    if-eqz v0, :cond_0

    .line 170
    new-instance v0, Landroid/widget/MediaController;

    invoke-direct {v0, p0}, Landroid/widget/MediaController;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaController:Landroid/widget/MediaController;

    .line 171
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaController:Landroid/widget/MediaController;

    invoke-virtual {v0, p0}, Landroid/widget/MediaController;->setMediaPlayer(Landroid/widget/MediaController$MediaPlayerControl;)V

    .line 172
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaController:Landroid/widget/MediaController;

    iget-object v1, p0, Lcom/prime31/P31VideoPlayerActivity;->_preview:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    .line 173
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaController:Landroid/widget/MediaController;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/MediaController;->setEnabled(Z)V

    .line 174
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->show()V

    .line 181
    :cond_0
    :goto_1
    return-void

    .line 145
    :cond_1
    invoke-virtual {p0}, Lcom/prime31/P31VideoPlayerActivity;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    .line 146
    .local v7, "cachesDir":Ljava/lang/String;
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_path:Ljava/lang/String;

    invoke-virtual {v0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 148
    const-string v0, "Prime31"

    const-string v1, "playing video from caches through a FileInputStream"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    new-instance v9, Ljava/io/FileInputStream;

    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_path:Ljava/lang/String;

    invoke-direct {v9, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 150
    .local v9, "fileInputStream":Ljava/io/FileInputStream;
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v9}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 177
    .end local v7    # "cachesDir":Ljava/lang/String;
    .end local v9    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_0
    move-exception v8

    .line 179
    .local v8, "e":Ljava/lang/Exception;
    const-string v0, "Prime31"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 154
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v7    # "cachesDir":Ljava/lang/String;
    :cond_2
    :try_start_1
    const-string v0, "Prime31"

    const-string v1, "playing video from assets"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    invoke-virtual {p0}, Lcom/prime31/P31VideoPlayerActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    iget-object v1, p0, Lcom/prime31/P31VideoPlayerActivity;->_path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 156
    .local v6, "afd":Landroid/content/res/AssetFileDescriptor;
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public seekTo(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 447
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 450
    :goto_0
    return-void

    .line 449
    :cond_0
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    goto :goto_0
.end method

.method public start()V
    .locals 1

    .prologue
    .line 455
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 458
    :goto_0
    return-void

    .line 457
    :cond_0
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    goto :goto_0
.end method

.method public stopAndReleaseVideoPlayer()V
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    .line 188
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 189
    iget-object v0, p0, Lcom/prime31/P31VideoPlayerActivity;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 190
    :cond_0
    invoke-direct {p0}, Lcom/prime31/P31VideoPlayerActivity;->releaseMediaPlayer()V

    .line 192
    :cond_1
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 2
    .param p1, "surfaceholder"    # Landroid/view/SurfaceHolder;
    .param p2, "i"    # I
    .param p3, "j"    # I
    .param p4, "k"    # I

    .prologue
    .line 296
    const-string v0, "Prime31"

    const-string v1, "surfaceChanged called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 308
    const-string v0, "Prime31"

    const-string v1, "surfaceCreated called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    invoke-virtual {p0}, Lcom/prime31/P31VideoPlayerActivity;->playVideo()V

    .line 310
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "surfaceholder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 302
    const-string v0, "Prime31"

    const-string v1, "surfaceDestroyed called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    return-void
.end method
