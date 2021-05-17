.class public Lcom/cobra/zufflin/ZufflinNative;
.super Ljava/lang/Object;
.source "ZufflinNative.java"


# static fields
.field static final Z_MSGBOX_HELP:I = 0x4000

.field static final Z_MSGBOX_OK:I = 0x0

.field static final Z_MSGBOX_OK_CANCEL:I = 0x1

.field static final Z_MSGBOX_YES_NO:I = 0x4

.field static final Z_MSGBOX_YES_NO_CANCEL:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native addPakFile(Ljava/lang/String;)V
.end method

.method public static androidShowUrl(Ljava/lang/String;)V
    .locals 1
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/cobra/zufflin/ZufflinActivity;->openUrl(Ljava/lang/String;)V

    .line 76
    return-void
.end method

.method public static native backPressed()V
.end method

.method private static capitalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 140
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    .line 142
    :cond_0
    const-string p0, ""

    .line 151
    .end local p0    # "s":Ljava/lang/String;
    .local v0, "first":C
    :cond_1
    :goto_0
    return-object p0

    .line 144
    .end local v0    # "first":C
    .restart local p0    # "s":Ljava/lang/String;
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 145
    .restart local v0    # "first":C
    invoke-static {v0}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v1

    if-nez v1, :cond_1

    .line 151
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static native exit()V
.end method

.method public static getApplicationName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->getApplicationName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDeviceManufacturer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    return-object v0
.end method

.method public static getDeviceModel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method

.method public static getDeviceName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 126
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 127
    .local v0, "manufacturer":Ljava/lang/String;
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 128
    .local v1, "model":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 130
    invoke-static {v1}, Lcom/cobra/zufflin/ZufflinNative;->capitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 134
    :goto_0
    return-object v2

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/cobra/zufflin/ZufflinNative;->capitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static getNativeSurface()Landroid/view/Surface;
    .locals 1

    .prologue
    .line 45
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getGameSurface()Lcom/cobra/zufflin/ZufflinSurface;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinSurface;->getNativeSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method

.method public static getPackage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->getPackage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPublisherKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->getPublicLicenseKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getScreenHeight()I
    .locals 1

    .prologue
    .line 105
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->getScreenHeight()I

    move-result v0

    return v0
.end method

.method public static getScreenWidth()I
    .locals 1

    .prologue
    .line 100
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->getScreenWidth()I

    move-result v0

    return v0
.end method

.method public static getSettings()Lcom/cobra/zufflin/ZufflinSettings;
    .locals 1

    .prologue
    .line 40
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->getSettings()Lcom/cobra/zufflin/ZufflinSettings;

    move-result-object v0

    return-object v0
.end method

.method public static getVersionString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Android_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/cobra/zufflin/ZufflinActivity;->getVersionString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static hasInternetConnection()Z
    .locals 1

    .prologue
    .line 95
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->hasInternetConnection()Z

    move-result v0

    return v0
.end method

.method public static hideWebView()V
    .locals 1

    .prologue
    .line 90
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->hideWebView()V

    .line 91
    return-void
.end method

.method public static native initialiseEngine()V
.end method

.method public static native initialisePlatform(Ljava/io/FileDescriptor;Landroid/content/res/AssetManager;Ljava/lang/String;ZI)V
.end method

.method public static native inputDeviceAdded(I)V
.end method

.method public static native inputDeviceRemoved(I)V
.end method

.method public static isDebugSet()Z
    .locals 1

    .prologue
    .line 70
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->getZufflinSettings()Lcom/cobra/zufflin/ZufflinSettings;

    move-result-object v0

    iget-boolean v0, v0, Lcom/cobra/zufflin/ZufflinSettings;->debug:Z

    return v0
.end method

.method public static isKindleFire()Z
    .locals 2

    .prologue
    .line 110
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v1, "Amazon"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 111
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "Kindle Fire"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "KF"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 110
    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static native keyPressed(II)V
.end method

.method public static native keyReleased(II)V
.end method

.method public static native mainLoop()V
.end method

.method public static messageBos(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 5
    .param p0, "heading"    # Ljava/lang/String;
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "msgType"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 163
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 164
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 165
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 167
    new-instance v1, Lcom/cobra/zufflin/ZufflinNative$1;

    invoke-direct {v1}, Lcom/cobra/zufflin/ZufflinNative$1;-><init>()V

    .line 176
    .local v1, "butListener":Landroid/content/DialogInterface$OnClickListener;
    packed-switch p2, :pswitch_data_0

    .line 200
    :goto_0
    :pswitch_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 201
    return v3

    .line 179
    :pswitch_1
    const-string v2, "OK"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 180
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 183
    :pswitch_2
    const-string v2, "OK"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 184
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 187
    :pswitch_3
    const-string v2, "Yes"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 188
    const-string v2, "No"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 189
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 192
    :pswitch_4
    const-string v2, "Yes"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 193
    const-string v2, "No"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 194
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 176
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public static native nativeSurfaceChanged()V
.end method

.method public static native nativeSurfaceDestroyed()V
.end method

.method public static native nativeSurfaceResized(II)V
.end method

.method public static native pauseMainLoop()V
.end method

.method public static native resume()V
.end method

.method public static native resumeMainLoop()V
.end method

.method public static native setAccelerometer(FFF)V
.end method

.method public static native setJoystickAxes(IFFFFFFFF)Z
.end method

.method public static native setScreenOrientation(I)V
.end method

.method public static showWebView(IIIIIIIILjava/lang/String;)V
    .locals 10
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "w"    # I
    .param p3, "h"    # I
    .param p4, "r"    # I
    .param p5, "g"    # I
    .param p6, "b"    # I
    .param p7, "a"    # I
    .param p8, "url"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    invoke-virtual/range {v0 .. v9}, Lcom/cobra/zufflin/ZufflinActivity;->showWebViewFromURL(IIIIIIIILjava/lang/String;)V

    .line 81
    return-void
.end method

.method public static showWebViewFromHTML(IIIIIIIILjava/lang/String;)V
    .locals 10
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "w"    # I
    .param p3, "h"    # I
    .param p4, "r"    # I
    .param p5, "g"    # I
    .param p6, "b"    # I
    .param p7, "a"    # I
    .param p8, "html"    # Ljava/lang/String;

    .prologue
    .line 85
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    invoke-virtual/range {v0 .. v9}, Lcom/cobra/zufflin/ZufflinActivity;->showWebViewFromHTML(IIIIIIIILjava/lang/String;)V

    .line 86
    return-void
.end method

.method public static native suspend()V
.end method

.method public static native touchBegan(III)V
.end method

.method public static native touchEnded(III)V
.end method

.method public static native touchMoved(III)V
.end method
