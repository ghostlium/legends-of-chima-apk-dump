.class public Lcom/prime31/EtceteraPlugin;
.super Lcom/prime31/EtceteraPluginBase;
.source "EtceteraPlugin.java"

# interfaces
.implements Landroid/speech/tts/TextToSpeech$OnInitListener;
.implements Landroid/speech/tts/TextToSpeech$OnUtteranceCompletedListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "DefaultLocale"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/prime31/EtceteraPlugin$P31MediaScanner;
    }
.end annotation


# instance fields
.field private final DONT_SHOW_AGAIN_KEY:Ljava/lang/String;

.field private final FIRST_LAUNCH_DATE_KEY:Ljava/lang/String;

.field private final LAST_TIME_ASKED:Ljava/lang/String;

.field private final LAUNCH_COUNT_KEY:Ljava/lang/String;

.field private _desiredFileName:Ljava/lang/String;

.field private _desiredHeight:I

.field private _desiredWidth:I

.field private _dialog:Landroid/app/ProgressDialog;

.field private _tts:Landroid/speech/tts/TextToSpeech;

.field private _utteranceId:I

.field private _webView:Landroid/webkit/WebView;

.field private _webViewLayout:Landroid/widget/RelativeLayout;

.field public isAmazonAppStore:Z

.field private random:Ljava/util/Random;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/16 v1, 0x200

    const/4 v0, 0x0

    .line 70
    invoke-direct {p0}, Lcom/prime31/EtceteraPluginBase;-><init>()V

    .line 72
    iput-boolean v0, p0, Lcom/prime31/EtceteraPlugin;->isAmazonAppStore:Z

    .line 76
    iput v0, p0, Lcom/prime31/EtceteraPlugin;->_utteranceId:I

    .line 77
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/prime31/EtceteraPlugin;->random:Ljava/util/Random;

    .line 80
    iput v1, p0, Lcom/prime31/EtceteraPlugin;->_desiredWidth:I

    .line 81
    iput v1, p0, Lcom/prime31/EtceteraPlugin;->_desiredHeight:I

    .line 82
    const-string v0, "image.jpg"

    iput-object v0, p0, Lcom/prime31/EtceteraPlugin;->_desiredFileName:Ljava/lang/String;

    .line 1011
    const-string v0, "RTADontShowAgain"

    iput-object v0, p0, Lcom/prime31/EtceteraPlugin;->DONT_SHOW_AGAIN_KEY:Ljava/lang/String;

    .line 1012
    const-string v0, "RTALaunchCount"

    iput-object v0, p0, Lcom/prime31/EtceteraPlugin;->LAUNCH_COUNT_KEY:Ljava/lang/String;

    .line 1013
    const-string v0, "RTAFirstLaunchDate"

    iput-object v0, p0, Lcom/prime31/EtceteraPlugin;->FIRST_LAUNCH_DATE_KEY:Ljava/lang/String;

    .line 1014
    const-string v0, "RTALastTimeAsked"

    iput-object v0, p0, Lcom/prime31/EtceteraPlugin;->LAST_TIME_ASKED:Ljava/lang/String;

    .line 70
    return-void
.end method

.method static synthetic access$0(Lcom/prime31/EtceteraPlugin;Landroid/app/ProgressDialog;)V
    .locals 0

    .prologue
    .line 74
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin;->_dialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method static synthetic access$1(Lcom/prime31/EtceteraPlugin;)Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin;->_dialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$10(Lcom/prime31/EtceteraPlugin;)Landroid/widget/RelativeLayout;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin;->_webViewLayout:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$2(Lcom/prime31/EtceteraPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin;->_desiredFileName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3(Lcom/prime31/EtceteraPlugin;)Landroid/speech/tts/TextToSpeech;
    .locals 1

    .prologue
    .line 91
    invoke-direct {p0}, Lcom/prime31/EtceteraPlugin;->tts()Landroid/speech/tts/TextToSpeech;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$4(Lcom/prime31/EtceteraPlugin;)Landroid/speech/tts/TextToSpeech;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin;->_tts:Landroid/speech/tts/TextToSpeech;

    return-object v0
.end method

.method static synthetic access$5(Lcom/prime31/EtceteraPlugin;Landroid/speech/tts/TextToSpeech;)V
    .locals 0

    .prologue
    .line 75
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin;->_tts:Landroid/speech/tts/TextToSpeech;

    return-void
.end method

.method static synthetic access$6(Lcom/prime31/EtceteraPlugin;)Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 103
    invoke-direct {p0}, Lcom/prime31/EtceteraPlugin;->getTtsUtteranceIdHashMap()Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$7(Lcom/prime31/EtceteraPlugin;Landroid/webkit/WebView;)V
    .locals 0

    .prologue
    .line 86
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin;->_webView:Landroid/webkit/WebView;

    return-void
.end method

.method static synthetic access$8(Lcom/prime31/EtceteraPlugin;)Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin;->_webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$9(Lcom/prime31/EtceteraPlugin;Landroid/widget/RelativeLayout;)V
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin;->_webViewLayout:Landroid/widget/RelativeLayout;

    return-void
.end method

.method private copyExifData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "sourcePath"    # Ljava/lang/String;
    .param p2, "destPath"    # Ljava/lang/String;

    .prologue
    .line 606
    :try_start_0
    new-instance v2, Landroid/media/ExifInterface;

    invoke-direct {v2, p1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 607
    .local v2, "sourceFile":Landroid/media/ExifInterface;
    new-instance v0, Landroid/media/ExifInterface;

    invoke-direct {v0, p1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 609
    .local v0, "destFile":Landroid/media/ExifInterface;
    if-eqz v2, :cond_0

    if-nez v0, :cond_1

    .line 611
    :cond_0
    sget-object v4, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    const-string v5, "ExifInterface could not be created for both source and destination file so Exif data will not be copied over"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    .end local v0    # "destFile":Landroid/media/ExifInterface;
    .end local v2    # "sourceFile":Landroid/media/ExifInterface;
    :goto_0
    return-void

    .line 615
    .restart local v0    # "destFile":Landroid/media/ExifInterface;
    .restart local v2    # "sourceFile":Landroid/media/ExifInterface;
    :cond_1
    const-string v4, "Orientation"

    invoke-virtual {v2, v4}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 616
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 617
    const-string v4, "Orientation"

    invoke-virtual {v0, v4, v3}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 619
    :cond_2
    const-string v4, "GPSLatitude"

    invoke-virtual {v2, v4}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 620
    if-eqz v3, :cond_3

    .line 621
    const-string v4, "GPSLatitude"

    invoke-virtual {v0, v4, v3}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 623
    :cond_3
    const-string v4, "GPSLatitudeRef"

    invoke-virtual {v2, v4}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 624
    if-eqz v3, :cond_4

    .line 625
    const-string v4, "GPSLatitudeRef"

    invoke-virtual {v0, v4, v3}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 627
    :cond_4
    const-string v4, "GPSLongitude"

    invoke-virtual {v2, v4}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 628
    if-eqz v3, :cond_5

    .line 629
    const-string v4, "GPSLongitude"

    invoke-virtual {v0, v4, v3}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 631
    :cond_5
    const-string v4, "GPSLongitudeRef"

    invoke-virtual {v2, v4}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 632
    if-eqz v3, :cond_6

    .line 633
    const-string v4, "GPSLongitudeRef"

    invoke-virtual {v0, v4, v3}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 635
    :cond_6
    sget-object v4, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    const-string v5, "Exif data copied to new file"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 636
    invoke-virtual {v0}, Landroid/media/ExifInterface;->saveAttributes()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 638
    .end local v0    # "destFile":Landroid/media/ExifInterface;
    .end local v2    # "sourceFile":Landroid/media/ExifInterface;
    .end local v3    # "value":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 640
    .local v1, "e":Ljava/io/IOException;
    sget-object v4, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "ExifInterface could not be created for both source and destination file so Exif data will not be copied over: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static copyFile(Ljava/io/File;Ljava/io/File;)V
    .locals 6
    .param p0, "sourceFile"    # Ljava/io/File;
    .param p1, "destFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 580
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 581
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    .line 583
    :cond_0
    const/4 v1, 0x0

    .line 584
    .local v1, "source":Ljava/nio/channels/FileChannel;
    const/4 v0, 0x0

    .line 587
    .local v0, "destination":Ljava/nio/channels/FileChannel;
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 588
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .line 589
    const-wide/16 v2, 0x0

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 593
    if-eqz v1, :cond_1

    .line 594
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V

    .line 596
    :cond_1
    if-eqz v0, :cond_2

    .line 597
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 599
    :cond_2
    return-void

    .line 592
    :catchall_0
    move-exception v2

    .line 593
    if-eqz v1, :cond_3

    .line 594
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V

    .line 596
    :cond_3
    if-eqz v0, :cond_4

    .line 597
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 598
    :cond_4
    throw v2
.end method

.method private getTtsUtteranceIdHashMap()Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 105
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 106
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "utteranceId"

    iget v2, p0, Lcom/prime31/EtceteraPlugin;->_utteranceId:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    iget v1, p0, Lcom/prime31/EtceteraPlugin;->_utteranceId:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/prime31/EtceteraPlugin;->_utteranceId:I

    .line 108
    return-object v0
.end method

.method private isAppInForeground(Landroid/content/Context;)Z
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 114
    if-nez p1, :cond_0

    move v2, v3

    .line 128
    :goto_0
    return v2

    .line 119
    :cond_0
    :try_start_0
    const-string v2, "activity"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager;

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;

    move-result-object v2

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager$RunningTaskInfo;

    iget-object v2, v2, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 120
    .local v1, "topPackage":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, "currentPackage":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    goto :goto_0

    .line 125
    .end local v0    # "currentPackage":Ljava/lang/String;
    .end local v1    # "topPackage":Ljava/lang/String;
    :catch_0
    move-exception v2

    move v2, v3

    .line 128
    goto :goto_0
.end method

.method private resizeImageAtPath(Ljava/lang/String;Ljava/lang/String;)V
    .locals 15
    .param p1, "sourcePath"    # Ljava/lang/String;
    .param p2, "destPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 647
    invoke-static/range {p1 .. p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 650
    .local v1, "bitmapOrg":Landroid/graphics/Bitmap;
    if-nez v1, :cond_0

    .line 652
    new-instance v14, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 653
    .local v14, "source":Ljava/io/File;
    new-instance v8, Ljava/io/File;

    move-object/from16 v0, p2

    invoke-direct {v8, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 656
    .local v8, "dest":Ljava/io/File;
    :try_start_0
    invoke-static {v14, v8}, Lcom/prime31/EtceteraPlugin;->copyFile(Ljava/io/File;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 665
    .end local v8    # "dest":Ljava/io/File;
    .end local v14    # "source":Ljava/io/File;
    :cond_0
    sget-object v2, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v7, "resizing image at path: "

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 667
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    .line 668
    .local v4, "width":I
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    .line 670
    .local v5, "height":I
    sget-object v2, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v7, "raw image size: "

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, " x "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 672
    iget v2, p0, Lcom/prime31/EtceteraPlugin;->_desiredWidth:I

    if-nez v2, :cond_1

    iget v2, p0, Lcom/prime31/EtceteraPlugin;->_desiredHeight:I

    if-nez v2, :cond_1

    .line 674
    iput v4, p0, Lcom/prime31/EtceteraPlugin;->_desiredWidth:I

    .line 675
    iput v5, p0, Lcom/prime31/EtceteraPlugin;->_desiredHeight:I

    .line 679
    :cond_1
    iget v2, p0, Lcom/prime31/EtceteraPlugin;->_desiredWidth:I

    int-to-float v2, v2

    int-to-float v3, v4

    div-float v13, v2, v3

    .line 680
    .local v13, "scaleWidth":F
    iget v2, p0, Lcom/prime31/EtceteraPlugin;->_desiredHeight:I

    int-to-float v2, v2

    int-to-float v3, v5

    div-float v12, v2, v3

    .line 683
    .local v12, "scaleHeight":F
    new-instance v6, Landroid/graphics/Matrix;

    invoke-direct {v6}, Landroid/graphics/Matrix;-><init>()V

    .line 686
    .local v6, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {v6, v13, v12}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 687
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v7, 0x1

    invoke-static/range {v1 .. v7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v11

    .line 689
    .local v11, "resizedBitmap":Landroid/graphics/Bitmap;
    new-instance v10, Ljava/io/FileOutputStream;

    move-object/from16 v0, p2

    invoke-direct {v10, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 690
    .local v10, "out":Ljava/io/FileOutputStream;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x46

    invoke-virtual {v11, v2, v3, v10}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 693
    invoke-direct/range {p0 .. p2}, Lcom/prime31/EtceteraPlugin;->copyExifData(Ljava/lang/String;Ljava/lang/String;)V

    .line 694
    return-void

    .line 658
    .end local v4    # "width":I
    .end local v5    # "height":I
    .end local v6    # "matrix":Landroid/graphics/Matrix;
    .end local v10    # "out":Ljava/io/FileOutputStream;
    .end local v11    # "resizedBitmap":Landroid/graphics/Bitmap;
    .end local v12    # "scaleHeight":F
    .end local v13    # "scaleWidth":F
    .restart local v8    # "dest":Ljava/io/File;
    .restart local v14    # "source":Ljava/io/File;
    :catch_0
    move-exception v9

    .line 660
    .local v9, "e":Ljava/io/IOException;
    sget-object v2, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v7, "failed to perform fallback copy of file: "

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 661
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-direct {v2}, Ljava/io/FileNotFoundException;-><init>()V

    throw v2
.end method

.method private tts()Landroid/speech/tts/TextToSpeech;
    .locals 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin;->_tts:Landroid/speech/tts/TextToSpeech;

    if-nez v0, :cond_0

    .line 95
    new-instance v0, Landroid/speech/tts/TextToSpeech;

    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    iput-object v0, p0, Lcom/prime31/EtceteraPlugin;->_tts:Landroid/speech/tts/TextToSpeech;

    .line 96
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin;->_tts:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v0, p0}, Landroid/speech/tts/TextToSpeech;->setOnUtteranceCompletedListener(Landroid/speech/tts/TextToSpeech$OnUtteranceCompletedListener;)I

    .line 99
    :cond_0
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin;->_tts:Landroid/speech/tts/TextToSpeech;

    return-object v0
.end method


# virtual methods
.method public askForReview(IIILjava/lang/String;Ljava/lang/String;)V
    .locals 14
    .param p1, "launchesUntilPrompt"    # I
    .param p2, "hoursUntilFirstPrompt"    # I
    .param p3, "hoursBetweenPrompts"    # I
    .param p4, "title"    # Ljava/lang/String;
    .param p5, "message"    # Ljava/lang/String;

    .prologue
    .line 1018
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const-string v9, "RTA"

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 1020
    .local v7, "prefs":Landroid/content/SharedPreferences;
    const-string v8, "RTADontShowAgain"

    const/4 v9, 0x0

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1061
    :goto_0
    return-void

    .line 1023
    :cond_0
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 1026
    .local v2, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v8, "RTALaunchCount"

    const-wide/16 v9, 0x0

    invoke-interface {v7, v8, v9, v10}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    const-wide/16 v10, 0x1

    add-long v5, v8, v10

    .line 1027
    .local v5, "launchCount":J
    const-string v8, "RTALaunchCount"

    invoke-interface {v2, v8, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 1030
    const-string v8, "RTAFirstLaunchDate"

    const-wide/16 v9, 0x0

    invoke-interface {v7, v8, v9, v10}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 1031
    .local v3, "firstLaunchDate":Ljava/lang/Long;
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-nez v8, :cond_1

    .line 1033
    sget-object v8, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    const-string v9, "first launch date not set in prefs. setting it now"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1034
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 1035
    const-string v8, "RTAFirstLaunchDate"

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    invoke-interface {v2, v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 1039
    :cond_1
    int-to-long v8, p1

    cmp-long v8, v5, v8

    if-ltz v8, :cond_3

    .line 1041
    sget-object v8, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    const-string v9, "launch count > launchesUntilPrompt. checking to see if first launch was greater than hoursUntilPrompt"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1044
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    mul-int/lit8 v12, p2, 0x3c

    mul-int/lit8 v12, v12, 0x3c

    mul-int/lit16 v12, v12, 0x3e8

    int-to-long v12, v12

    add-long/2addr v10, v12

    cmp-long v8, v8, v10

    if-ltz v8, :cond_3

    .line 1046
    sget-object v8, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    const-string v9, "hoursUntilFirstPrompt have expired so we are clear to proceed"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1049
    const-string v8, "RTALastTimeAsked"

    const-wide/16 v9, 0x0

    invoke-interface {v7, v8, v9, v10}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 1051
    .local v4, "lastPromptDate":Ljava/lang/Long;
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-eqz v8, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    mul-int/lit8 v12, p3, 0x3c

    mul-int/lit8 v12, v12, 0x3c

    mul-int/lit16 v12, v12, 0x3e8

    int-to-long v12, v12

    add-long/2addr v10, v12

    cmp-long v8, v8, v10

    if-ltz v8, :cond_3

    .line 1053
    :cond_2
    sget-object v8, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    const-string v9, "lastPromptDate is either 0 or enough time has elapsed to prompt again"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1054
    const-string v8, "RTALastTimeAsked"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-interface {v2, v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 1055
    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-virtual {p0, v0, v1}, Lcom/prime31/EtceteraPlugin;->askForReviewNow(Ljava/lang/String;Ljava/lang/String;)V

    .line 1060
    .end local v4    # "lastPromptDate":Ljava/lang/Long;
    :cond_3
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_0
.end method

.method public askForReviewNow(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1067
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "RTA"

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1068
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "RTADontShowAgain"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1180
    :goto_0
    return-void

    .line 1071
    :cond_0
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/prime31/EtceteraPlugin$23;

    invoke-direct {v2, p0, p1, p2, v0}, Lcom/prime31/EtceteraPlugin$23;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;Ljava/lang/String;Landroid/content/SharedPreferences;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public cameraPhotoTaken(Ljava/lang/String;)V
    .locals 6
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 808
    if-nez p1, :cond_0

    .line 810
    const-string v3, "EtceteraAndroidManager"

    const-string v4, "photoChooserCancelled"

    const-string v5, ""

    invoke-virtual {p0, v3, v4, v5}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 829
    :goto_0
    return-void

    .line 814
    :cond_0
    sget-object v3, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "going to resize the file at path: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 816
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 817
    .local v0, "cacheDir":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/prime31/EtceteraPlugin;->_desiredFileName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 821
    .local v1, "destPath":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0, p1, v1}, Lcom/prime31/EtceteraPlugin;->resizeImageAtPath(Ljava/lang/String;Ljava/lang/String;)V

    .line 822
    const-string v3, "EtceteraAndroidManager"

    const-string v4, "photoChooserSucceeded"

    invoke-virtual {p0, v3, v4, v1}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 824
    :catch_0
    move-exception v2

    .line 826
    .local v2, "e":Ljava/io/FileNotFoundException;
    sget-object v3, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "file could not be found to resize it: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 827
    const-string v3, "EtceteraAndroidManager"

    const-string v4, "photoChooserCancelled"

    const-string v5, ""

    invoke-virtual {p0, v3, v4, v5}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public cancelNotification(I)V
    .locals 5
    .param p1, "notificationId"    # I

    .prologue
    .line 227
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-class v4, Lcom/prime31/AlarmManagerReceiver;

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 228
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const/high16 v4, 0x8000000

    invoke-static {v3, p1, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 229
    .local v2, "pendingIntent":Landroid/app/PendingIntent;
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "alarm"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 230
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 231
    return-void
.end method

.method public checkForNotifications()V
    .locals 2

    .prologue
    .line 237
    sget-object v1, Lcom/prime31/EtceteraPlugin;->_instance:Lcom/prime31/EtceteraPlugin;

    invoke-virtual {v1}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 238
    .local v0, "intentExtras":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 239
    const-string v1, "notificationData"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/prime31/EtceteraPlugin;->receivedNotification(Ljava/lang/String;)Z

    .line 240
    :cond_0
    return-void
.end method

.method public getScreenDensity()I
    .locals 2

    .prologue
    .line 134
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 135
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 137
    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    float-to-int v1, v1

    return v1
.end method

.method public hideProgressDialog()V
    .locals 2

    .prologue
    .line 387
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$8;

    invoke-direct {v1, p0}, Lcom/prime31/EtceteraPlugin$8;-><init>(Lcom/prime31/EtceteraPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 398
    return-void
.end method

.method public initTTS()V
    .locals 2

    .prologue
    .line 890
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$16;

    invoke-direct {v1, p0}, Lcom/prime31/EtceteraPlugin$16;-><init>(Lcom/prime31/EtceteraPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 897
    return-void
.end method

.method public inlineWebViewClose()V
    .locals 2

    .prologue
    .line 1305
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin;->_webViewLayout:Landroid/widget/RelativeLayout;

    if-nez v0, :cond_0

    .line 1324
    :goto_0
    return-void

    .line 1308
    :cond_0
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$25;

    invoke-direct {v1, p0}, Lcom/prime31/EtceteraPlugin$25;-><init>(Lcom/prime31/EtceteraPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public inlineWebViewSetFrame(IIII)V
    .locals 7
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 1345
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin;->_webView:Landroid/webkit/WebView;

    if-nez v0, :cond_0

    .line 1364
    :goto_0
    return-void

    .line 1348
    :cond_0
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v0, Lcom/prime31/EtceteraPlugin$27;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/prime31/EtceteraPlugin$27;-><init>(Lcom/prime31/EtceteraPlugin;IIII)V

    invoke-virtual {v6, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public inlineWebViewSetUrl(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 1329
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin;->_webView:Landroid/webkit/WebView;

    if-nez v0, :cond_0

    .line 1340
    :goto_0
    return-void

    .line 1332
    :cond_0
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$26;

    invoke-direct {v1, p0, p1}, Lcom/prime31/EtceteraPlugin$26;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public inlineWebViewShow(Ljava/lang/String;IIII)V
    .locals 8
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I

    .prologue
    .line 1242
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin;->_webViewLayout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_0

    .line 1243
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->inlineWebViewClose()V

    .line 1245
    :cond_0
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v7

    new-instance v0, Lcom/prime31/EtceteraPlugin$24;

    move-object v1, p0

    move v2, p4

    move v3, p5

    move v4, p2

    move v5, p3

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/prime31/EtceteraPlugin$24;-><init>(Lcom/prime31/EtceteraPlugin;IIIILjava/lang/String;)V

    invoke-virtual {v7, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1300
    return-void
.end method

.method public isSMSComposerAvailable()Z
    .locals 2

    .prologue
    .line 473
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.hardware.telephony"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public onInit(I)V
    .locals 3
    .param p1, "status"    # I

    .prologue
    .line 995
    if-nez p1, :cond_0

    .line 996
    const-string v0, "EtceteraAndroidManager"

    const-string v1, "ttsInitialized"

    const-string v2, "1"

    invoke-virtual {p0, v0, v1, v2}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 999
    :goto_0
    return-void

    .line 998
    :cond_0
    const-string v0, "EtceteraAndroidManager"

    const-string v1, "ttsInitialized"

    const-string v2, "0"

    invoke-virtual {p0, v0, v1, v2}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onUtteranceCompleted(Ljava/lang/String;)V
    .locals 2
    .param p1, "utteranceId"    # Ljava/lang/String;

    .prologue
    .line 1005
    const-string v0, "EtceteraAndroidManager"

    const-string v1, "ttsUtteranceCompleted"

    invoke-virtual {p0, v0, v1, p1}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1006
    return-void
.end method

.method public photoAlbumItemChosen(Ljava/lang/String;)V
    .locals 6
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 781
    if-nez p1, :cond_0

    .line 783
    const-string v3, "EtceteraAndroidManager"

    const-string v4, "albumChooserCancelled"

    const-string v5, ""

    invoke-virtual {p0, v3, v4, v5}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 802
    :goto_0
    return-void

    .line 787
    :cond_0
    sget-object v3, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "going to resize the file at path: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 789
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 790
    .local v0, "cacheDir":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/prime31/EtceteraPlugin;->_desiredFileName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 794
    .local v1, "destPath":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0, p1, v1}, Lcom/prime31/EtceteraPlugin;->resizeImageAtPath(Ljava/lang/String;Ljava/lang/String;)V

    .line 795
    const-string v3, "EtceteraAndroidManager"

    const-string v4, "albumChooserSucceeded"

    invoke-virtual {p0, v3, v4, v1}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 797
    :catch_0
    move-exception v2

    .line 799
    .local v2, "e":Ljava/io/FileNotFoundException;
    sget-object v3, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "file could not be found to resize it: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 800
    const-string v3, "EtceteraAndroidManager"

    const-string v4, "albumChooserCancelled"

    const-string v5, ""

    invoke-virtual {p0, v3, v4, v5}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public playMovie(Ljava/lang/String;IZIZ)V
    .locals 8
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "bgColor"    # I
    .param p3, "showControls"    # Z
    .param p4, "scalingMode"    # I
    .param p5, "closeOnTouch"    # Z

    .prologue
    .line 171
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v7

    new-instance v0, Lcom/prime31/EtceteraPlugin$2;

    move-object v1, p0

    move-object v2, p1

    move v3, p3

    move v4, p2

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/prime31/EtceteraPlugin$2;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;ZIIZ)V

    invoke-virtual {v7, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 187
    return-void
.end method

.method public playSilence(JI)V
    .locals 2
    .param p1, "durationInMs"    # J
    .param p3, "queueMode"    # I

    .prologue
    .line 948
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$20;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/prime31/EtceteraPlugin$20;-><init>(Lcom/prime31/EtceteraPlugin;JI)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 958
    return-void
.end method

.method public promptForPictureFromAlbum(IILjava/lang/String;)V
    .locals 2
    .param p1, "desiredWidth"    # I
    .param p2, "desiredHeight"    # I
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 562
    iput p1, p0, Lcom/prime31/EtceteraPlugin;->_desiredWidth:I

    .line 563
    iput p2, p0, Lcom/prime31/EtceteraPlugin;->_desiredHeight:I

    .line 564
    iput-object p3, p0, Lcom/prime31/EtceteraPlugin;->_desiredFileName:Ljava/lang/String;

    .line 566
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$15;

    invoke-direct {v1, p0}, Lcom/prime31/EtceteraPlugin$15;-><init>(Lcom/prime31/EtceteraPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 575
    return-void
.end method

.method public promptToTakePhoto(IILjava/lang/String;)V
    .locals 2
    .param p1, "desiredWidth"    # I
    .param p2, "desiredHeight"    # I
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 511
    iput p1, p0, Lcom/prime31/EtceteraPlugin;->_desiredWidth:I

    .line 512
    iput p2, p0, Lcom/prime31/EtceteraPlugin;->_desiredHeight:I

    .line 513
    iput-object p3, p0, Lcom/prime31/EtceteraPlugin;->_desiredFileName:Ljava/lang/String;

    .line 515
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$13;

    invoke-direct {v1, p0}, Lcom/prime31/EtceteraPlugin$13;-><init>(Lcom/prime31/EtceteraPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 524
    return-void
.end method

.method public promptToTakeVideo(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 529
    const-string v1, "3gp"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 532
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 534
    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x3

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 535
    .local v0, "substring":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "3gp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 542
    .end local v0    # "substring":Ljava/lang/String;
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin;->_desiredFileName:Ljava/lang/String;

    .line 544
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/prime31/EtceteraPlugin$14;

    invoke-direct {v2, p0}, Lcom/prime31/EtceteraPlugin$14;-><init>(Lcom/prime31/EtceteraPlugin;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 557
    return-void

    .line 539
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ".3gp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public receivedNotification(Ljava/lang/String;)Z
    .locals 2
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 194
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->isActivityAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/prime31/EtceteraPlugin;->isAppInForeground(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 196
    sget-object v0, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    const-string v1, "app IS in the foreground. sending notification to Unity"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    const-string v0, "EtceteraAndroidManager"

    const-string v1, "notificationReceived"

    invoke-virtual {p0, v0, v1, p1}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    const/4 v0, 0x1

    .line 201
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public resetAskForReview()V
    .locals 5

    .prologue
    .line 1185
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "RTA"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1186
    .local v1, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1187
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 1188
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1189
    return-void
.end method

.method public saveImageToGallery(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 13
    .param p1, "imagePath"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 734
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 735
    .local v9, "v":Landroid/content/ContentValues;
    const-string v10, "title"

    invoke-virtual {v9, v10, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 738
    const-string v10, "date_added"

    new-instance v11, Ljava/util/Date;

    invoke-direct {v11}, Ljava/util/Date;-><init>()V

    invoke-virtual {v11}, Ljava/util/Date;->getTime()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 739
    const-string v10, "datetaken"

    new-instance v11, Ljava/util/Date;

    invoke-direct {v11}, Ljava/util/Date;-><init>()V

    invoke-virtual {v11}, Ljava/util/Date;->getTime()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 740
    const-string v10, "date_modified"

    new-instance v11, Ljava/util/Date;

    invoke-direct {v11}, Ljava/util/Date;-><init>()V

    invoke-virtual {v11}, Ljava/util/Date;->getTime()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 741
    const-string v10, "mime_type"

    const-string v11, "image/png"

    invoke-virtual {v9, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 746
    :try_start_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 747
    .local v3, "f":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    .line 748
    .local v5, "parent":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    .line 749
    .local v6, "path":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    .line 751
    .local v4, "name":Ljava/lang/String;
    const-string v10, "bucket_id"

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 752
    const-string v10, "bucket_display_name"

    invoke-virtual {v9, v10, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 753
    const-string v10, "_size"

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 754
    const-string v10, "_data"

    invoke-virtual {v9, v10, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 756
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v10}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 757
    .local v0, "c":Landroid/content/ContentResolver;
    sget-object v10, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v10, v9}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v8

    .line 760
    .local v8, "uri":Landroid/net/Uri;
    new-instance v1, Lcom/prime31/EtceteraPlugin$P31MediaScanner;

    invoke-direct {v1, p0, v3}, Lcom/prime31/EtceteraPlugin$P31MediaScanner;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/io/File;)V

    .line 761
    .local v1, "client":Lcom/prime31/EtceteraPlugin$P31MediaScanner;
    new-instance v7, Landroid/media/MediaScannerConnection;

    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-direct {v7, v10, v1}, Landroid/media/MediaScannerConnection;-><init>(Landroid/content/Context;Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;)V

    .line 762
    .local v7, "scanner":Landroid/media/MediaScannerConnection;
    invoke-virtual {v1, v7}, Lcom/prime31/EtceteraPlugin$P31MediaScanner;->setScanner(Landroid/media/MediaScannerConnection;)V

    .line 763
    invoke-virtual {v7}, Landroid/media/MediaScannerConnection;->connect()V

    .line 765
    sget-object v10, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, " saved to gallery with uri: "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 772
    const/4 v10, 0x1

    .end local v0    # "c":Landroid/content/ContentResolver;
    .end local v1    # "client":Lcom/prime31/EtceteraPlugin$P31MediaScanner;
    .end local v3    # "f":Ljava/io/File;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "parent":Ljava/io/File;
    .end local v6    # "path":Ljava/lang/String;
    .end local v7    # "scanner":Landroid/media/MediaScannerConnection;
    .end local v8    # "uri":Landroid/net/Uri;
    :goto_0
    return v10

    .line 767
    :catch_0
    move-exception v2

    .line 769
    .local v2, "e":Ljava/lang/Exception;
    sget-object v10, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "saveImageToGallery failed: "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 770
    const/4 v10, 0x0

    goto :goto_0
.end method

.method public scaleImageAtPath(Ljava/lang/String;F)V
    .locals 11
    .param p1, "sourcePath"    # Ljava/lang/String;
    .param p2, "scale"    # F

    .prologue
    const/4 v1, 0x0

    .line 699
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 702
    .local v0, "bitmapOrg":Landroid/graphics/Bitmap;
    if-nez v0, :cond_0

    .line 704
    sget-object v1, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v6, "could not find image at path: "

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 728
    :goto_0
    return-void

    .line 708
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 709
    .local v3, "width":I
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 712
    .local v4, "height":I
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 715
    .local v5, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {v5, p2, p2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 716
    const/4 v6, 0x1

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 718
    .local v10, "resizedBitmap":Landroid/graphics/Bitmap;
    const/4 v8, 0x0

    .line 721
    .local v8, "out":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v9, Ljava/io/FileOutputStream;

    invoke-direct {v9, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 722
    .end local v8    # "out":Ljava/io/FileOutputStream;
    .local v9, "out":Ljava/io/FileOutputStream;
    :try_start_1
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x46

    invoke-virtual {v10, v1, v2, v9}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v8, v9

    .line 723
    .end local v9    # "out":Ljava/io/FileOutputStream;
    .restart local v8    # "out":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 724
    :catch_0
    move-exception v7

    .line 726
    .local v7, "e":Ljava/io/FileNotFoundException;
    :goto_1
    sget-object v1, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v6, "error saving image to disk: "

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 724
    .end local v7    # "e":Ljava/io/FileNotFoundException;
    .end local v8    # "out":Ljava/io/FileOutputStream;
    .restart local v9    # "out":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v7

    move-object v8, v9

    .end local v9    # "out":Ljava/io/FileOutputStream;
    .restart local v8    # "out":Ljava/io/FileOutputStream;
    goto :goto_1
.end method

.method public scheduleNotification(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 11
    .param p1, "secondsFromNow"    # J
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "subtitle"    # Ljava/lang/String;
    .param p5, "tickerText"    # Ljava/lang/String;
    .param p6, "data"    # Ljava/lang/String;

    .prologue
    .line 207
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v2

    .line 208
    .local v2, "context":Landroid/app/Activity;
    new-instance v3, Landroid/content/Intent;

    const-class v6, Lcom/prime31/AlarmManagerReceiver;

    invoke-direct {v3, v2, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 209
    .local v3, "intent":Landroid/content/Intent;
    const-string v6, "title"

    invoke-virtual {v3, v6, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 210
    const-string v6, "subtitle"

    invoke-virtual {v3, v6, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 211
    const-string v6, "tickerText"

    move-object/from16 v0, p5

    invoke-virtual {v3, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 212
    const-string v6, "data"

    move-object/from16 v0, p6

    invoke-virtual {v3, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 213
    const-string v6, "contextClassName"

    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 215
    iget-object v6, p0, Lcom/prime31/EtceteraPlugin;->random:Ljava/util/Random;

    invoke-virtual {v6}, Ljava/util/Random;->nextInt()I

    move-result v5

    .line 216
    .local v5, "randomId":I
    const/high16 v6, 0x8000000

    invoke-static {v2, v5, v3, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 218
    .local v4, "pendingIntent":Landroid/app/PendingIntent;
    const-string v6, "alarm"

    invoke-virtual {v2, v6}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    .line 219
    .local v1, "alarmManager":Landroid/app/AlarmManager;
    const/4 v6, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const-wide/16 v9, 0x3e8

    mul-long/2addr v9, p1

    add-long/2addr v7, v9

    invoke-virtual {v1, v6, v7, v8, v4}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 221
    return v5
.end method

.method public setPitch(F)V
    .locals 2
    .param p1, "pitch"    # F

    .prologue
    .line 964
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$21;

    invoke-direct {v1, p0, p1}, Lcom/prime31/EtceteraPlugin$21;-><init>(Lcom/prime31/EtceteraPlugin;F)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 973
    return-void
.end method

.method public setSpeechRate(F)V
    .locals 2
    .param p1, "rate"    # F

    .prologue
    .line 980
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$22;

    invoke-direct {v1, p0, p1}, Lcom/prime31/EtceteraPlugin$22;-><init>(Lcom/prime31/EtceteraPlugin;F)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 989
    return-void
.end method

.method public setSystemUiVisibilityToLowProfile(Z)V
    .locals 2
    .param p1, "setLowProfile"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 144
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$1;

    invoke-direct {v1, p0, p1}, Lcom/prime31/EtceteraPlugin$1;-><init>(Lcom/prime31/EtceteraPlugin;Z)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 166
    return-void
.end method

.method public showAlert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "positiveButton"    # Ljava/lang/String;
    .param p4, "negativeButton"    # Ljava/lang/String;

    .prologue
    .line 257
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v0, Lcom/prime31/EtceteraPlugin$4;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/prime31/EtceteraPlugin$4;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 283
    return-void
.end method

.method public showAlertPrompt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "promptHint"    # Ljava/lang/String;
    .param p4, "promptText"    # Ljava/lang/String;
    .param p5, "positiveButton"    # Ljava/lang/String;
    .param p6, "negativeButton"    # Ljava/lang/String;

    .prologue
    .line 288
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v8

    new-instance v0, Lcom/prime31/EtceteraPlugin$5;

    move-object v1, p0

    move-object v2, p3

    move-object v3, p4

    move-object v4, p1

    move-object v5, p2

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/prime31/EtceteraPlugin$5;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 325
    return-void
.end method

.method public showAlertPromptWithTwoFields(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "promptHintOne"    # Ljava/lang/String;
    .param p4, "promptTextOne"    # Ljava/lang/String;
    .param p5, "promptHintTwo"    # Ljava/lang/String;
    .param p6, "promptTextTwo"    # Ljava/lang/String;
    .param p7, "positiveButton"    # Ljava/lang/String;
    .param p8, "negativeButton"    # Ljava/lang/String;

    .prologue
    .line 331
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v10

    new-instance v0, Lcom/prime31/EtceteraPlugin$6;

    move-object v1, p0

    move-object v2, p3

    move-object v3, p4

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move-object v6, p1

    move-object v7, p2

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-direct/range {v0 .. v9}, Lcom/prime31/EtceteraPlugin$6;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 370
    return-void
.end method

.method public showCustomWebView(Ljava/lang/String;ZZ)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "disableTitle"    # Z
    .param p3, "disableBackButton"    # Z

    .prologue
    .line 417
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$10;

    invoke-direct {v1, p0, p1, p3, p2}, Lcom/prime31/EtceteraPlugin$10;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;ZZ)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 428
    return-void
.end method

.method public showEmailComposer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 8
    .param p1, "toAddress"    # Ljava/lang/String;
    .param p2, "subject"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "isHTML"    # Z
    .param p5, "attachmentFilePath"    # Ljava/lang/String;

    .prologue
    .line 433
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v7

    new-instance v0, Lcom/prime31/EtceteraPlugin$11;

    move-object v1, p0

    move v2, p4

    move-object v3, p3

    move-object v4, p1

    move-object v5, p2

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/prime31/EtceteraPlugin$11;-><init>(Lcom/prime31/EtceteraPlugin;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 468
    return-void
.end method

.method public showProgressDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 375
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$7;

    invoke-direct {v1, p0, p1, p2}, Lcom/prime31/EtceteraPlugin$7;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 382
    return-void
.end method

.method public showSMSComposer(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "recipientDataUri"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 479
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->isSMSComposerAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 481
    sget-object v0, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    const-string v1, "SMS is not available on this device"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    :goto_0
    return-void

    .line 485
    :cond_0
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$12;

    invoke-direct {v1, p0, p2, p1}, Lcom/prime31/EtceteraPlugin$12;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public showToast(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "shortDuration"    # Z

    .prologue
    .line 245
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/prime31/EtceteraPlugin$3;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 252
    return-void
.end method

.method public showWebView(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 403
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$9;

    invoke-direct {v1, p0, p1}, Lcom/prime31/EtceteraPlugin$9;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 412
    return-void
.end method

.method public speak(Ljava/lang/String;I)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "queueMode"    # I

    .prologue
    .line 919
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$18;

    invoke-direct {v1, p0, p1, p2}, Lcom/prime31/EtceteraPlugin$18;-><init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 929
    return-void
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 934
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$19;

    invoke-direct {v1, p0}, Lcom/prime31/EtceteraPlugin$19;-><init>(Lcom/prime31/EtceteraPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 943
    return-void
.end method

.method public teardownTTS()V
    .locals 2

    .prologue
    .line 902
    invoke-virtual {p0}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/EtceteraPlugin$17;

    invoke-direct {v1, p0}, Lcom/prime31/EtceteraPlugin$17;-><init>(Lcom/prime31/EtceteraPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 914
    return-void
.end method

.method public videoTaken(Ljava/lang/String;)V
    .locals 3
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 834
    if-nez p1, :cond_0

    .line 836
    const-string v0, "EtceteraAndroidManager"

    const-string v1, "videoRecordingCancelled"

    const-string v2, ""

    invoke-virtual {p0, v0, v1, v2}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 841
    :goto_0
    return-void

    .line 840
    :cond_0
    const-string v0, "EtceteraAndroidManager"

    const-string v1, "videoRecordingSucceeded"

    invoke-virtual {p0, v0, v1, p1}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
