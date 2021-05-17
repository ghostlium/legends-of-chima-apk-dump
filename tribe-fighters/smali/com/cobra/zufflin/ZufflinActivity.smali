.class public Lcom/cobra/zufflin/ZufflinActivity;
.super Landroid/app/Activity;
.source "ZufflinActivity.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;
.implements Landroid/hardware/input/InputManager$InputDeviceListener;


# static fields
.field public static DOWNLOAD_OBB_REQUEST_CODE:I = 0x0

.field public static final STORE_SYSTEM_AMAZON:I = 0x1

.field public static final STORE_SYSTEM_GOOGLE_PLAY:I

.field static gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

.field static hasFocus:Z

.field static mActivity:Lcom/cobra/zufflin/ZufflinActivity;

.field static mContext:Landroid/content/Context;

.field static mWebView:Landroid/webkit/WebView;


# instance fields
.field private activityListeners:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/cobra/zufflin/ZufflinActivityListener;",
            ">;"
        }
    .end annotation
.end field

.field private appBundle:Landroid/os/Bundle;

.field private bDownloadObbs:Z

.field private bIsPaused:Z

.field private bLandscapeDevice:Z

.field createViewUponFocus:Z

.field private mAccelerometer:Landroid/hardware/Sensor;

.field private mInputManager:Landroid/hardware/input/InputManager;

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private obbFiles:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/cobra/zufflin/OBBFileInfo;",
            ">;"
        }
    .end annotation
.end field

.field private publicLicenseKey:Ljava/lang/String;

.field private sensorRange:F

.field private storeSystem:I

.field private zufflinSettings:Lcom/cobra/zufflin/ZufflinSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 58
    const v0, 0xbd1d71

    sput v0, Lcom/cobra/zufflin/ZufflinActivity;->DOWNLOAD_OBB_REQUEST_CODE:I

    .line 59
    sput-object v1, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    .line 62
    sput-object v1, Lcom/cobra/zufflin/ZufflinActivity;->mWebView:Landroid/webkit/WebView;

    .line 68
    const/4 v0, 0x0

    sput-boolean v0, Lcom/cobra/zufflin/ZufflinActivity;->hasFocus:Z

    .line 109
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 97
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 69
    iput-boolean v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->createViewUponFocus:Z

    .line 74
    new-instance v0, Lcom/cobra/zufflin/ZufflinSettings;

    invoke-direct {v0}, Lcom/cobra/zufflin/ZufflinSettings;-><init>()V

    iput-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->zufflinSettings:Lcom/cobra/zufflin/ZufflinSettings;

    .line 76
    const-string v0, ""

    iput-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->publicLicenseKey:Ljava/lang/String;

    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->bDownloadObbs:Z

    .line 79
    iput-boolean v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->bIsPaused:Z

    .line 80
    iput-boolean v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->bLandscapeDevice:Z

    .line 82
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->activityListeners:Ljava/util/Vector;

    .line 84
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->obbFiles:Ljava/util/Vector;

    .line 110
    iput v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->storeSystem:I

    .line 99
    sput-object p0, Lcom/cobra/zufflin/ZufflinActivity;->mActivity:Lcom/cobra/zufflin/ZufflinActivity;

    .line 100
    return-void
.end method

.method public static getActivity()Lcom/cobra/zufflin/ZufflinActivity;
    .locals 1

    .prologue
    .line 518
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->mActivity:Lcom/cobra/zufflin/ZufflinActivity;

    return-object v0
.end method

.method public static getExternalFilesDir()Ljava/lang/String;
    .locals 2

    .prologue
    .line 459
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getGameSurface()Lcom/cobra/zufflin/ZufflinSurface;
    .locals 1

    .prologue
    .line 523
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    return-object v0
.end method

.method public static hasFocus()Z
    .locals 1

    .prologue
    .line 464
    sget-boolean v0, Lcom/cobra/zufflin/ZufflinActivity;->hasFocus:Z

    return v0
.end method


# virtual methods
.method public addActivityListener(Lcom/cobra/zufflin/ZufflinActivityListener;)V
    .locals 1
    .param p1, "zal"    # Lcom/cobra/zufflin/ZufflinActivityListener;

    .prologue
    .line 508
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->activityListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 509
    return-void
.end method

.method public addOBBFile(JJ)V
    .locals 2
    .param p1, "fileSize"    # J
    .param p3, "fileCRC"    # J

    .prologue
    .line 124
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->obbFiles:Ljava/util/Vector;

    new-instance v1, Lcom/cobra/zufflin/OBBFileInfo;

    invoke-direct {v1, p1, p2, p3, p4}, Lcom/cobra/zufflin/OBBFileInfo;-><init>(JJ)V

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 125
    return-void
.end method

.method public disableOBBDownload()V
    .locals 1

    .prologue
    .line 119
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->bDownloadObbs:Z

    .line 120
    return-void
.end method

.method public doMainLoopDestroy()V
    .locals 1

    .prologue
    .line 634
    invoke-static {}, Lcom/cobra/zufflin/ZufflinNative;->exit()V

    .line 638
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinSurface;->waitOnGameThreadExit()V

    .line 641
    return-void
.end method

.method public doMainLoopPause()V
    .locals 1

    .prologue
    .line 645
    iget-boolean v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->bIsPaused:Z

    if-nez v0, :cond_0

    .line 647
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->bIsPaused:Z

    .line 649
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinSurface;->isGameSurfaceReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 652
    invoke-static {}, Lcom/cobra/zufflin/ZufflinNative;->pauseMainLoop()V

    .line 655
    :cond_0
    return-void
.end method

.method public doMainLoopResume()V
    .locals 1

    .prologue
    .line 659
    iget-boolean v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->bIsPaused:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/cobra/zufflin/ZufflinActivity;->hasFocus:Z

    if-eqz v0, :cond_0

    .line 661
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->bIsPaused:Z

    .line 663
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinSurface;->isGameSurfaceReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 666
    invoke-static {}, Lcom/cobra/zufflin/ZufflinNative;->resumeMainLoop()V

    .line 669
    :cond_0
    return-void
.end method

.method public doNativeExit()V
    .locals 1

    .prologue
    .line 626
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 627
    return-void
.end method

.method public getApplicationName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 586
    :try_start_0
    sget-object v1, Lcom/cobra/zufflin/ZufflinActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v0, v1, Landroid/content/pm/ApplicationInfo;->labelRes:I

    .line 587
    .local v0, "stringId":I
    sget-object v1, Lcom/cobra/zufflin/ZufflinActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 592
    .end local v0    # "stringId":I
    :goto_0
    return-object v1

    .line 589
    :catch_0
    move-exception v1

    .line 592
    const-string v1, "NO_APPLICATION_NAME"

    goto :goto_0
.end method

.method public getBundle()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->appBundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public getObbFiles()Ljava/util/Vector;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Vector",
            "<",
            "Lcom/cobra/zufflin/OBBFileInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->obbFiles:Ljava/util/Vector;

    return-object v0
.end method

.method public getPackage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 599
    :try_start_0
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 605
    :goto_0
    return-object v0

    .line 601
    :catch_0
    move-exception v0

    .line 605
    const-string v0, "NO_PACKAGE"

    goto :goto_0
.end method

.method public getPublicLicenseKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 531
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->publicLicenseKey:Ljava/lang/String;

    return-object v0
.end method

.method public getScreenHeight()I
    .locals 1

    .prologue
    .line 615
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinSurface;->getHeight()I

    move-result v0

    return v0
.end method

.method public getScreenWidth()I
    .locals 1

    .prologue
    .line 610
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinSurface;->getWidth()I

    move-result v0

    return v0
.end method

.method public getSettings()Lcom/cobra/zufflin/ZufflinSettings;
    .locals 1

    .prologue
    .line 673
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->zufflinSettings:Lcom/cobra/zufflin/ZufflinSettings;

    return-object v0
.end method

.method public getVersionCode()I
    .locals 5

    .prologue
    .line 557
    const/4 v1, 0x0

    .line 560
    .local v1, "versionCode":I
    :try_start_0
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 561
    .local v0, "pinfo":Landroid/content/pm/PackageInfo;
    iget v1, v0, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 566
    .end local v0    # "pinfo":Landroid/content/pm/PackageInfo;
    :goto_0
    return v1

    .line 563
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public getVersionString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 573
    :try_start_0
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 574
    .local v0, "pinfo":Landroid/content/pm/PackageInfo;
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 579
    .end local v0    # "pinfo":Landroid/content/pm/PackageInfo;
    :goto_0
    return-object v1

    .line 576
    :catch_0
    move-exception v1

    .line 579
    const-string v1, "UNKNOWN_VERSION"

    goto :goto_0
.end method

.method public getZufflinSettings()Lcom/cobra/zufflin/ZufflinSettings;
    .locals 1

    .prologue
    .line 469
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->zufflinSettings:Lcom/cobra/zufflin/ZufflinSettings;

    return-object v0
.end method

.method public hasInternetConnection()Z
    .locals 3

    .prologue
    .line 452
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Lcom/cobra/zufflin/ZufflinActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 453
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 454
    .local v1, "netInfo":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public hideWebView()V
    .locals 2

    .prologue
    .line 440
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 442
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->mActivity:Lcom/cobra/zufflin/ZufflinActivity;

    new-instance v1, Lcom/cobra/zufflin/ZufflinActivity$3;

    invoke-direct {v1, p0}, Lcom/cobra/zufflin/ZufflinActivity$3;-><init>(Lcom/cobra/zufflin/ZufflinActivity;)V

    invoke-virtual {v0, v1}, Lcom/cobra/zufflin/ZufflinActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 448
    :cond_0
    return-void
.end method

.method public initialiseNativeEngine()V
    .locals 8

    .prologue
    .line 537
    sget-object v4, Lcom/cobra/zufflin/ZufflinActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 538
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    sget-object v4, Lcom/cobra/zufflin/ZufflinActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    .line 539
    .local v1, "filesDir":Ljava/io/File;
    const/4 v4, 0x0

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/cobra/zufflin/ZufflinActivity;->zufflinSettings:Lcom/cobra/zufflin/ZufflinSettings;

    iget-boolean v6, v6, Lcom/cobra/zufflin/ZufflinSettings;->debug:Z

    iget v7, p0, Lcom/cobra/zufflin/ZufflinActivity;->storeSystem:I

    invoke-static {v4, v0, v5, v6, v7}, Lcom/cobra/zufflin/ZufflinNative;->initialisePlatform(Ljava/io/FileDescriptor;Landroid/content/res/AssetManager;Ljava/lang/String;ZI)V

    .line 542
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v4, p0, Lcom/cobra/zufflin/ZufflinActivity;->obbFiles:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-lt v2, v4, :cond_0

    .line 552
    invoke-static {}, Lcom/cobra/zufflin/ZufflinNative;->initialiseEngine()V

    .line 553
    return-void

    .line 544
    :cond_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 545
    .local v3, "obbFile":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "/Android/obb/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/cobra/zufflin/ZufflinActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 546
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v6

    if-nez v2, :cond_1

    const/4 v4, 0x1

    :goto_1
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->getVersionCode()I

    move-result v7

    invoke-static {v6, v4, v7}, Lcom/google/android/vending/expansion/downloader/Helpers;->getExpansionAPKFileName(Landroid/content/Context;ZI)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 547
    invoke-static {v3}, Lcom/cobra/zufflin/ZufflinNative;->addPakFile(Ljava/lang/String;)V

    .line 542
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 546
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public isKindleFire()Z
    .locals 1

    .prologue
    .line 620
    invoke-static {}, Lcom/cobra/zufflin/ZufflinNative;->isKindleFire()Z

    move-result v0

    return v0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 404
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 475
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 477
    sget v1, Lcom/cobra/zufflin/ZufflinActivity;->DOWNLOAD_OBB_REQUEST_CODE:I

    if-ne p1, v1, :cond_0

    .line 479
    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 481
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->createViewUponFocus:Z

    .line 485
    :cond_0
    iget-object v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->activityListeners:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 490
    return-void

    .line 485
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/ZufflinActivityListener;

    .line 487
    .local v0, "zal":Lcom/cobra/zufflin/ZufflinActivityListener;
    invoke-interface {v0, p1, p2, p3}, Lcom/cobra/zufflin/ZufflinActivityListener;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 356
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    if-eqz v0, :cond_0

    .line 357
    invoke-static {}, Lcom/cobra/zufflin/ZufflinNative;->backPressed()V

    .line 358
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 14
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x1

    .line 147
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 155
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->isTaskRoot()Z

    move-result v9

    if-nez v9, :cond_0

    .line 157
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    .line 158
    .local v4, "intent":Landroid/content/Intent;
    invoke-virtual {v4}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    .line 159
    .local v5, "intentAction":Ljava/lang/String;
    const-string v9, "android.intent.category.LAUNCHER"

    invoke-virtual {v4, v9}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    if-eqz v5, :cond_0

    const-string v9, "android.intent.action.MAIN"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 161
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->finish()V

    .line 165
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v5    # "intentAction":Ljava/lang/String;
    :cond_0
    iput-object p1, p0, Lcom/cobra/zufflin/ZufflinActivity;->appBundle:Landroid/os/Bundle;

    .line 166
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    sput-object v9, Lcom/cobra/zufflin/ZufflinActivity;->mContext:Landroid/content/Context;

    .line 169
    iget-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->zufflinSettings:Lcom/cobra/zufflin/ZufflinSettings;

    invoke-virtual {v9, p0}, Lcom/cobra/zufflin/ZufflinSettings;->load(Landroid/app/Activity;)V

    .line 172
    iget-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->zufflinSettings:Lcom/cobra/zufflin/ZufflinSettings;

    iget-boolean v9, v9, Lcom/cobra/zufflin/ZufflinSettings;->orientationLandscape:Z

    if-eqz v9, :cond_2

    iget-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->zufflinSettings:Lcom/cobra/zufflin/ZufflinSettings;

    iget-boolean v9, v9, Lcom/cobra/zufflin/ZufflinSettings;->orientationPortrait:Z

    if-nez v9, :cond_2

    .line 174
    invoke-virtual {p0, v13}, Lcom/cobra/zufflin/ZufflinActivity;->setRequestedOrientation(I)V

    .line 181
    :cond_1
    :goto_0
    const-string v9, "sensor"

    invoke-virtual {p0, v9}, Lcom/cobra/zufflin/ZufflinActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/hardware/SensorManager;

    iput-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->mSensorManager:Landroid/hardware/SensorManager;

    .line 182
    iget-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v9, v12}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v9

    iput-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->mAccelerometer:Landroid/hardware/Sensor;

    .line 183
    iget-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v10, p0, Lcom/cobra/zufflin/ZufflinActivity;->mAccelerometer:Landroid/hardware/Sensor;

    const/4 v11, 0x3

    invoke-virtual {v9, p0, v10, v11}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 186
    const-string v9, "input"

    invoke-virtual {p0, v9}, Lcom/cobra/zufflin/ZufflinActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/hardware/input/InputManager;

    iput-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->mInputManager:Landroid/hardware/input/InputManager;

    .line 187
    iget-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->mInputManager:Landroid/hardware/input/InputManager;

    const/4 v10, 0x0

    invoke-virtual {v9, p0, v10}, Landroid/hardware/input/InputManager;->registerInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;Landroid/os/Handler;)V

    .line 189
    iget-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->mInputManager:Landroid/hardware/input/InputManager;

    invoke-virtual {v9}, Landroid/hardware/input/InputManager;->getInputDeviceIds()[I

    move-result-object v3

    .line 190
    .local v3, "ids":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v9, v3

    if-lt v2, v9, :cond_3

    .line 198
    const/high16 v9, 0x41200000    # 10.0f

    iput v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->sensorRange:F

    .line 201
    iget-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->obbFiles:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    if-lez v9, :cond_5

    iget-boolean v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->bDownloadObbs:Z

    if-eqz v9, :cond_5

    .line 204
    new-instance v2, Landroid/content/Intent;

    .end local v2    # "i":I
    const-class v9, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    invoke-direct {v2, p0, v9}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 205
    .local v2, "i":Landroid/content/Intent;
    sget v9, Lcom/cobra/zufflin/ZufflinActivity;->DOWNLOAD_OBB_REQUEST_CODE:I

    invoke-virtual {p0, v2, v9}, Lcom/cobra/zufflin/ZufflinActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 212
    .end local v2    # "i":Landroid/content/Intent;
    :goto_2
    const-string v9, "window"

    invoke-virtual {p0, v9}, Lcom/cobra/zufflin/ZufflinActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/WindowManager;

    invoke-interface {v9}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/Display;->getRotation()I

    move-result v6

    .line 213
    .local v6, "naturalOrientation":I
    invoke-static {v6}, Lcom/cobra/zufflin/ZufflinNative;->setScreenOrientation(I)V

    .line 215
    new-instance v7, Landroid/graphics/Point;

    invoke-direct {v7}, Landroid/graphics/Point;-><init>()V

    .line 216
    .local v7, "size":Landroid/graphics/Point;
    const-string v9, "window"

    invoke-virtual {p0, v9}, Lcom/cobra/zufflin/ZufflinActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/WindowManager;

    invoke-interface {v9}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v9

    invoke-virtual {v9, v7}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 217
    iget v8, v7, Landroid/graphics/Point;->x:I

    .line 218
    .local v8, "width":I
    iget v1, v7, Landroid/graphics/Point;->y:I

    .line 219
    .local v1, "height":I
    if-le v8, v1, :cond_6

    .line 222
    iput-boolean v12, p0, Lcom/cobra/zufflin/ZufflinActivity;->bLandscapeDevice:Z

    .line 231
    :goto_3
    return-void

    .line 176
    .end local v1    # "height":I
    .end local v3    # "ids":[I
    .end local v6    # "naturalOrientation":I
    .end local v7    # "size":Landroid/graphics/Point;
    .end local v8    # "width":I
    :cond_2
    iget-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->zufflinSettings:Lcom/cobra/zufflin/ZufflinSettings;

    iget-boolean v9, v9, Lcom/cobra/zufflin/ZufflinSettings;->orientationLandscape:Z

    if-nez v9, :cond_1

    iget-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->zufflinSettings:Lcom/cobra/zufflin/ZufflinSettings;

    iget-boolean v9, v9, Lcom/cobra/zufflin/ZufflinSettings;->orientationPortrait:Z

    if-eqz v9, :cond_1

    .line 178
    invoke-virtual {p0, v12}, Lcom/cobra/zufflin/ZufflinActivity;->setRequestedOrientation(I)V

    goto/16 :goto_0

    .line 192
    .local v2, "i":I
    .restart local v3    # "ids":[I
    :cond_3
    iget-object v9, p0, Lcom/cobra/zufflin/ZufflinActivity;->mInputManager:Landroid/hardware/input/InputManager;

    aget v10, v3, v2

    invoke-virtual {v9, v10}, Landroid/hardware/input/InputManager;->getInputDevice(I)Landroid/view/InputDevice;

    move-result-object v0

    .line 194
    .local v0, "device":Landroid/view/InputDevice;
    invoke-virtual {v0}, Landroid/view/InputDevice;->getSources()I

    move-result v9

    and-int/lit8 v9, v9, 0x10

    if-eqz v9, :cond_4

    .line 195
    aget v9, v3, v2

    invoke-static {v9}, Lcom/cobra/zufflin/ZufflinNative;->inputDeviceAdded(I)V

    .line 190
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 209
    .end local v0    # "device":Landroid/view/InputDevice;
    :cond_5
    iput-boolean v12, p0, Lcom/cobra/zufflin/ZufflinActivity;->createViewUponFocus:Z

    goto :goto_2

    .line 227
    .end local v2    # "i":I
    .restart local v1    # "height":I
    .restart local v6    # "naturalOrientation":I
    .restart local v7    # "size":Landroid/graphics/Point;
    .restart local v8    # "width":I
    :cond_6
    iput-boolean v13, p0, Lcom/cobra/zufflin/ZufflinActivity;->bLandscapeDevice:Z

    goto :goto_3
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 296
    iget-object v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->activityListeners:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 304
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 305
    return-void

    .line 296
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/ZufflinActivityListener;

    .line 298
    .local v0, "zal":Lcom/cobra/zufflin/ZufflinActivityListener;
    invoke-interface {v0}, Lcom/cobra/zufflin/ZufflinActivityListener;->onDestroy()V

    goto :goto_0
.end method

.method public onInputDeviceAdded(I)V
    .locals 2
    .param p1, "deviceId"    # I

    .prologue
    .line 364
    iget-object v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->mInputManager:Landroid/hardware/input/InputManager;

    invoke-virtual {v1, p1}, Landroid/hardware/input/InputManager;->getInputDevice(I)Landroid/view/InputDevice;

    move-result-object v0

    .line 366
    .local v0, "device":Landroid/view/InputDevice;
    invoke-virtual {v0}, Landroid/view/InputDevice;->getSources()I

    move-result v1

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_0

    .line 367
    invoke-static {p1}, Lcom/cobra/zufflin/ZufflinNative;->inputDeviceAdded(I)V

    .line 368
    :cond_0
    return-void
.end method

.method public onInputDeviceChanged(I)V
    .locals 0
    .param p1, "deviceid"    # I

    .prologue
    .line 373
    return-void
.end method

.method public onInputDeviceRemoved(I)V
    .locals 0
    .param p1, "deviceId"    # I

    .prologue
    .line 378
    invoke-static {p1}, Lcom/cobra/zufflin/ZufflinNative;->inputDeviceRemoved(I)V

    .line 379
    return-void
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 267
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 269
    iget-object v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->activityListeners:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 274
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->doMainLoopPause()V

    .line 275
    return-void

    .line 269
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/ZufflinActivityListener;

    .line 271
    .local v0, "zal":Lcom/cobra/zufflin/ZufflinActivityListener;
    invoke-interface {v0}, Lcom/cobra/zufflin/ZufflinActivityListener;->onPause()V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 3

    .prologue
    .line 282
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 284
    iget-object v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->activityListeners:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 289
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->doMainLoopResume()V

    .line 290
    return-void

    .line 284
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/ZufflinActivityListener;

    .line 286
    .local v0, "zal":Lcom/cobra/zufflin/ZufflinActivityListener;
    invoke-interface {v0}, Lcom/cobra/zufflin/ZufflinActivityListener;->onResume()V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 495
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 497
    iget-object v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->activityListeners:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 501
    return-void

    .line 497
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/ZufflinActivityListener;

    .line 499
    .local v0, "zal":Lcom/cobra/zufflin/ZufflinActivityListener;
    invoke-interface {v0, p1}, Lcom/cobra/zufflin/ZufflinActivityListener;->onSaveInstanceState(Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 8
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    .line 310
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v6, 0x3

    if-lt v0, v6, :cond_1

    .line 318
    const/high16 v6, 0x3f800000    # 1.0f

    iget v7, p0, Lcom/cobra/zufflin/ZufflinActivity;->sensorRange:F

    div-float v2, v6, v7

    .line 319
    .local v2, "scale":F
    iget-object v6, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v7, 0x0

    aget v6, v6, v7

    mul-float/2addr v6, v2

    const/high16 v7, -0x40800000    # -1.0f

    mul-float v3, v6, v7

    .line 320
    .local v3, "x":F
    iget-object v6, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v7, 0x1

    aget v6, v6, v7

    mul-float v4, v6, v2

    .line 321
    .local v4, "y":F
    iget-object v6, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v7, 0x2

    aget v6, v6, v7

    mul-float v5, v6, v2

    .line 323
    .local v5, "z":F
    sget-object v6, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    if-eqz v6, :cond_0

    .line 325
    const-string v6, "window"

    invoke-virtual {p0, v6}, Lcom/cobra/zufflin/ZufflinActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/WindowManager;

    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Display;->getRotation()I

    move-result v1

    .line 326
    .local v1, "naturalOrientation":I
    invoke-static {v1}, Lcom/cobra/zufflin/ZufflinNative;->setScreenOrientation(I)V

    .line 327
    iget-boolean v6, p0, Lcom/cobra/zufflin/ZufflinActivity;->bLandscapeDevice:Z

    if-eqz v6, :cond_3

    .line 329
    packed-switch v1, :pswitch_data_0

    .line 343
    :pswitch_0
    invoke-static {v4, v3, v5}, Lcom/cobra/zufflin/ZufflinNative;->setAccelerometer(FFF)V

    .line 351
    .end local v1    # "naturalOrientation":I
    :cond_0
    :goto_1
    return-void

    .line 312
    .end local v2    # "scale":F
    .end local v3    # "x":F
    .end local v4    # "y":F
    .end local v5    # "z":F
    :cond_1
    iget-object v6, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v6, v6, v0

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Lcom/cobra/zufflin/ZufflinActivity;->sensorRange:F

    cmpl-float v6, v6, v7

    if-lez v6, :cond_2

    .line 314
    iget-object v6, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v6, v6, v0

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iput v6, p0, Lcom/cobra/zufflin/ZufflinActivity;->sensorRange:F

    .line 310
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 333
    .restart local v1    # "naturalOrientation":I
    .restart local v2    # "scale":F
    .restart local v3    # "x":F
    .restart local v4    # "y":F
    .restart local v5    # "z":F
    :pswitch_1
    invoke-static {v3, v5, v4}, Lcom/cobra/zufflin/ZufflinNative;->setAccelerometer(FFF)V

    goto :goto_1

    .line 338
    :pswitch_2
    neg-float v6, v4

    neg-float v7, v3

    invoke-static {v6, v7, v5}, Lcom/cobra/zufflin/ZufflinNative;->setAccelerometer(FFF)V

    goto :goto_1

    .line 349
    :cond_3
    invoke-static {v3, v4, v5}, Lcom/cobra/zufflin/ZufflinNative;->setAccelerometer(FFF)V

    goto :goto_1

    .line 329
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method protected onStart()V
    .locals 3

    .prologue
    .line 237
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 238
    iget-object v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->activityListeners:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 243
    return-void

    .line 238
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/ZufflinActivityListener;

    .line 240
    .local v0, "zal":Lcom/cobra/zufflin/ZufflinActivityListener;
    invoke-interface {v0}, Lcom/cobra/zufflin/ZufflinActivityListener;->onStart()V

    goto :goto_0
.end method

.method protected onStop()V
    .locals 3

    .prologue
    .line 250
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 251
    iget-object v1, p0, Lcom/cobra/zufflin/ZufflinActivity;->activityListeners:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 256
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 258
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->doMainLoopDestroy()V

    .line 260
    :cond_0
    return-void

    .line 251
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/ZufflinActivityListener;

    .line 253
    .local v0, "zal":Lcom/cobra/zufflin/ZufflinActivityListener;
    invoke-interface {v0}, Lcom/cobra/zufflin/ZufflinActivityListener;->onStop()V

    goto :goto_0
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2
    .param p1, "focus"    # Z

    .prologue
    .line 383
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 385
    sput-boolean p1, Lcom/cobra/zufflin/ZufflinActivity;->hasFocus:Z

    .line 387
    sget-boolean v0, Lcom/cobra/zufflin/ZufflinActivity;->hasFocus:Z

    if-eqz v0, :cond_1

    .line 391
    sget-boolean v0, Lcom/cobra/zufflin/ZufflinActivity;->hasFocus:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->createViewUponFocus:Z

    if-eqz v0, :cond_0

    .line 393
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->createViewUponFocus:Z

    .line 394
    new-instance v0, Lcom/cobra/zufflin/ZufflinSurface;

    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/cobra/zufflin/ZufflinSurface;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    .line 395
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->gameSurface:Lcom/cobra/zufflin/ZufflinSurface;

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/ZufflinActivity;->setContentView(Landroid/view/View;)V

    .line 398
    :cond_0
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinActivity;->doMainLoopResume()V

    .line 400
    :cond_1
    return-void
.end method

.method public openUrl(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 408
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 409
    .local v0, "browserIntent":Landroid/content/Intent;
    sget-object v1, Lcom/cobra/zufflin/ZufflinActivity;->mActivity:Lcom/cobra/zufflin/ZufflinActivity;

    invoke-virtual {v1, v0}, Lcom/cobra/zufflin/ZufflinActivity;->startActivity(Landroid/content/Intent;)V

    .line 410
    return-void
.end method

.method public removeActivityListener(Lcom/cobra/zufflin/ZufflinActivityListener;)V
    .locals 1
    .param p1, "zal"    # Lcom/cobra/zufflin/ZufflinActivityListener;

    .prologue
    .line 513
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity;->activityListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 514
    return-void
.end method

.method public setPublicLicenseKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "publisherPublicKey"    # Ljava/lang/String;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/cobra/zufflin/ZufflinActivity;->publicLicenseKey:Ljava/lang/String;

    .line 140
    return-void
.end method

.method public setPublisherPublicKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "publisherPublicKey"    # Ljava/lang/String;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/cobra/zufflin/ZufflinActivity;->publicLicenseKey:Ljava/lang/String;

    .line 135
    return-void
.end method

.method public setStoreSystem(I)V
    .locals 0
    .param p1, "ss"    # I

    .prologue
    .line 114
    iput p1, p0, Lcom/cobra/zufflin/ZufflinActivity;->storeSystem:I

    .line 115
    return-void
.end method

.method public showWebView(IIIIIIII)V
    .locals 4
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I
    .param p5, "r"    # I
    .param p6, "g"    # I
    .param p7, "b"    # I
    .param p8, "a"    # I

    .prologue
    const/4 v3, 0x0

    .line 414
    new-instance v1, Landroid/webkit/WebView;

    sget-object v2, Lcom/cobra/zufflin/ZufflinActivity;->mActivity:Lcom/cobra/zufflin/ZufflinActivity;

    invoke-direct {v1, v2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/cobra/zufflin/ZufflinActivity;->mWebView:Landroid/webkit/WebView;

    .line 415
    new-instance v0, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-direct {v0, p3, p4, v3, v3}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    .line 416
    .local v0, "layoutParams":Landroid/widget/AbsoluteLayout$LayoutParams;
    sget-object v1, Lcom/cobra/zufflin/ZufflinActivity;->mActivity:Lcom/cobra/zufflin/ZufflinActivity;

    sget-object v2, Lcom/cobra/zufflin/ZufflinActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v2, v0}, Lcom/cobra/zufflin/ZufflinActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 417
    sget-object v1, Lcom/cobra/zufflin/ZufflinActivity;->mWebView:Landroid/webkit/WebView;

    int-to-float v2, p1

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setTranslationX(F)V

    .line 418
    sget-object v1, Lcom/cobra/zufflin/ZufflinActivity;->mWebView:Landroid/webkit/WebView;

    int-to-float v2, p2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setTranslationY(F)V

    .line 419
    sget-object v1, Lcom/cobra/zufflin/ZufflinActivity;->mWebView:Landroid/webkit/WebView;

    invoke-static {p8, p5, p6, p7}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 420
    return-void
.end method

.method public showWebViewFromHTML(IIIIIIIILjava/lang/String;)V
    .locals 12
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I
    .param p5, "r"    # I
    .param p6, "g"    # I
    .param p7, "b"    # I
    .param p8, "a"    # I
    .param p9, "html"    # Ljava/lang/String;

    .prologue
    .line 432
    sget-object v11, Lcom/cobra/zufflin/ZufflinActivity;->mActivity:Lcom/cobra/zufflin/ZufflinActivity;

    new-instance v0, Lcom/cobra/zufflin/ZufflinActivity$2;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move-object/from16 v10, p9

    invoke-direct/range {v0 .. v10}, Lcom/cobra/zufflin/ZufflinActivity$2;-><init>(Lcom/cobra/zufflin/ZufflinActivity;IIIIIIIILjava/lang/String;)V

    invoke-virtual {v11, v0}, Lcom/cobra/zufflin/ZufflinActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 436
    return-void
.end method

.method public showWebViewFromURL(IIIIIIIILjava/lang/String;)V
    .locals 12
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I
    .param p5, "r"    # I
    .param p6, "g"    # I
    .param p7, "b"    # I
    .param p8, "a"    # I
    .param p9, "url"    # Ljava/lang/String;

    .prologue
    .line 424
    sget-object v11, Lcom/cobra/zufflin/ZufflinActivity;->mActivity:Lcom/cobra/zufflin/ZufflinActivity;

    new-instance v0, Lcom/cobra/zufflin/ZufflinActivity$1;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move-object/from16 v10, p9

    invoke-direct/range {v0 .. v10}, Lcom/cobra/zufflin/ZufflinActivity$1;-><init>(Lcom/cobra/zufflin/ZufflinActivity;IIIIIIIILjava/lang/String;)V

    invoke-virtual {v11, v0}, Lcom/cobra/zufflin/ZufflinActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 428
    return-void
.end method
