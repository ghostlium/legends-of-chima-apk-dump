.class public Lcom/tapjoy/TJAdUnitView;
.super Landroid/app/Activity;
.source "TJAdUnitView.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "SetJavaScriptEnabled"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tapjoy/TJAdUnitView$TJAdUnitViewListener;
    }
.end annotation


# static fields
.field private static final CLOSE_BUTTON_OFFSET:I = 0xa

.field private static final DELAY_BEFORE_CLOSE_FADE_IN:J = 0x7d0L

.field private static final DURATION_OF_CLOSE_FADE_IN:J = 0x1f4L

.field private static final TAG:Ljava/lang/String; = "TJAdUnitView"


# instance fields
.field protected bridge:Lcom/tapjoy/TJAdUnitJSBridge;

.field private callbackID:Ljava/lang/String;

.field private connectivityErrorMessage:Ljava/lang/String;

.field private event:Lcom/tapjoy/TJEvent;

.field private eventData:Lcom/tapjoy/TJEventData;

.field protected historyIndex:I

.field private isLegacyView:Z

.field protected layout:Landroid/widget/RelativeLayout;

.field protected offersURL:Ljava/lang/String;

.field protected pauseCalled:Z

.field private progressBar:Landroid/widget/ProgressBar;

.field protected redirectedActivity:Z

.field protected skipOfferWall:Z

.field protected url:Ljava/lang/String;

.field private viewType:I

.field protected webView:Lcom/tapjoy/mraid/view/MraidView;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 50
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 53
    iput-object v1, p0, Lcom/tapjoy/TJAdUnitView;->layout:Landroid/widget/RelativeLayout;

    .line 54
    iput-object v1, p0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    .line 55
    iput-object v1, p0, Lcom/tapjoy/TJAdUnitView;->offersURL:Ljava/lang/String;

    .line 56
    iput-object v1, p0, Lcom/tapjoy/TJAdUnitView;->url:Ljava/lang/String;

    .line 57
    iput-boolean v0, p0, Lcom/tapjoy/TJAdUnitView;->pauseCalled:Z

    .line 58
    iput-boolean v0, p0, Lcom/tapjoy/TJAdUnitView;->skipOfferWall:Z

    .line 60
    iput v0, p0, Lcom/tapjoy/TJAdUnitView;->viewType:I

    .line 65
    iput-boolean v0, p0, Lcom/tapjoy/TJAdUnitView;->isLegacyView:Z

    .line 69
    iput v0, p0, Lcom/tapjoy/TJAdUnitView;->historyIndex:I

    .line 78
    const-string v0, "A connection error occurred loading this content."

    iput-object v0, p0, Lcom/tapjoy/TJAdUnitView;->connectivityErrorMessage:Ljava/lang/String;

    .line 469
    return-void
.end method

.method static synthetic access$100(Lcom/tapjoy/TJAdUnitView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TJAdUnitView;

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/tapjoy/TJAdUnitView;->isLegacyView:Z

    return v0
.end method

.method static synthetic access$200(Lcom/tapjoy/TJAdUnitView;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TJAdUnitView;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->progressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$300(Lcom/tapjoy/TJAdUnitView;)I
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TJAdUnitView;

    .prologue
    .line 50
    iget v0, p0, Lcom/tapjoy/TJAdUnitView;->viewType:I

    return v0
.end method

.method static synthetic access$400(Lcom/tapjoy/TJAdUnitView;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TJAdUnitView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/tapjoy/TJAdUnitView;->finishWithResult(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/tapjoy/TJAdUnitView;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TJAdUnitView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/tapjoy/TJAdUnitView;->handleTJVideoURL(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/tapjoy/TJAdUnitView;)V
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TJAdUnitView;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/tapjoy/TJAdUnitView;->finishActivity()V

    return-void
.end method

.method private finishActivity()V
    .locals 2

    .prologue
    .line 911
    iget v0, p0, Lcom/tapjoy/TJAdUnitView;->viewType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 914
    const-string v0, "offer_wall"

    invoke-direct {p0, v0}, Lcom/tapjoy/TJAdUnitView;->finishWithResult(Ljava/lang/String;)V

    .line 921
    :cond_0
    :goto_0
    return-void

    .line 918
    :cond_1
    if-eqz p0, :cond_0

    .line 919
    invoke-virtual {p0}, Lcom/tapjoy/TJAdUnitView;->finish()V

    goto :goto_0
.end method

.method private finishWithResult(Ljava/lang/String;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 815
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 816
    .local v0, "returnIntent":Landroid/content/Intent;
    const-string v1, "result"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 817
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/tapjoy/TJAdUnitView;->setResult(ILandroid/content/Intent;)V

    .line 818
    invoke-virtual {p0}, Lcom/tapjoy/TJAdUnitView;->finish()V

    .line 819
    return-void
.end method

.method private getCloseBitmap()Landroid/graphics/Bitmap;
    .locals 20

    .prologue
    .line 328
    const/4 v5, 0x0

    .line 331
    .local v5, "closeBitmap":Landroid/graphics/Bitmap;
    new-instance v11, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v11}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 332
    .local v11, "options":Landroid/graphics/BitmapFactory$Options;
    const/16 v17, 0x1

    move/from16 v0, v17

    iput-boolean v0, v11, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 335
    const-string v17, "tj_close_button.png"

    invoke-static/range {v17 .. v17}, Lcom/tapjoy/TapjoyUtil;->getResource(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, [B

    move-object/from16 v4, v17

    check-cast v4, [B

    .line 336
    .local v4, "bytes":[B
    if-eqz v4, :cond_0

    .line 337
    const/16 v17, 0x0

    array-length v0, v4

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v4, v0, v1, v11}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 338
    const/16 v17, 0x0

    array-length v0, v4

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v4, v0, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 342
    :cond_0
    if-nez v5, :cond_1

    .line 345
    :try_start_0
    const-string v15, "com/tapjoy/res/tj_close_button.png"

    .line 346
    .local v15, "source":Ljava/lang/String;
    const/4 v9, 0x0

    .line 347
    .local v9, "in":Ljava/io/InputStream;
    const-class v17, Lcom/tapjoy/TJAdUnitView;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v16

    .line 349
    .local v16, "url":Ljava/net/URL;
    if-nez v16, :cond_3

    .line 351
    invoke-virtual/range {p0 .. p0}, Lcom/tapjoy/TJAdUnitView;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    .line 352
    .local v3, "am":Landroid/content/res/AssetManager;
    invoke-virtual {v3, v15}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v9

    .line 355
    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-static {v9, v0, v11}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 358
    invoke-virtual {v3, v15}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v9

    .line 384
    .end local v3    # "am":Landroid/content/res/AssetManager;
    :goto_0
    invoke-static {v9}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 385
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 392
    .end local v9    # "in":Ljava/io/InputStream;
    .end local v15    # "source":Ljava/lang/String;
    .end local v16    # "url":Ljava/net/URL;
    :cond_1
    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getDeviceScreenDensityScale()F

    move-result v13

    .line 393
    .local v13, "scale":F
    if-eqz v5, :cond_2

    .line 395
    iget v0, v11, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    mul-float v17, v17, v13

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    iget v0, v11, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    mul-float v18, v18, v13

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v5, v0, v1, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v14

    .line 396
    .local v14, "scaledBitmap":Landroid/graphics/Bitmap;
    move-object v5, v14

    .end local v14    # "scaledBitmap":Landroid/graphics/Bitmap;
    :cond_2
    move-object/from16 v17, v5

    .line 399
    .end local v13    # "scale":F
    :goto_1
    return-object v17

    .line 362
    .restart local v9    # "in":Ljava/io/InputStream;
    .restart local v15    # "source":Ljava/lang/String;
    .restart local v16    # "url":Ljava/net/URL;
    :cond_3
    :try_start_1
    invoke-virtual/range {v16 .. v16}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v8

    .line 363
    .local v8, "file":Ljava/lang/String;
    const-string v17, "jar:"

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 364
    const/16 v17, 0x4

    move/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 366
    :cond_4
    const-string v17, "file:"

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 367
    const/16 v17, 0x5

    move/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 369
    :cond_5
    const-string v17, "!"

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v12

    .line 370
    .local v12, "pos":I
    if-lez v12, :cond_6

    .line 371
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v8, v0, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 372
    :cond_6
    new-instance v10, Ljava/util/jar/JarFile;

    invoke-direct {v10, v8}, Ljava/util/jar/JarFile;-><init>(Ljava/lang/String;)V

    .line 373
    .local v10, "jf":Ljava/util/jar/JarFile;
    invoke-virtual {v10, v15}, Ljava/util/jar/JarFile;->getJarEntry(Ljava/lang/String;)Ljava/util/jar/JarEntry;

    move-result-object v7

    .line 374
    .local v7, "entry":Ljava/util/jar/JarEntry;
    invoke-virtual {v10, v7}, Ljava/util/jar/JarFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v9

    .line 377
    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-static {v9, v0, v11}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 380
    invoke-virtual {v10, v7}, Ljava/util/jar/JarFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v9

    goto/16 :goto_0

    .line 386
    .end local v7    # "entry":Ljava/util/jar/JarEntry;
    .end local v8    # "file":Ljava/lang/String;
    .end local v9    # "in":Ljava/io/InputStream;
    .end local v10    # "jf":Ljava/util/jar/JarFile;
    .end local v12    # "pos":I
    .end local v15    # "source":Ljava/lang/String;
    .end local v16    # "url":Ljava/net/URL;
    :catch_0
    move-exception v6

    .line 387
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 388
    const/16 v17, 0x0

    goto :goto_1
.end method

.method private handleTJVideoURL(Ljava/lang/String;)V
    .locals 14
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 657
    const/4 v9, 0x0

    .line 666
    .local v9, "index":I
    const-string v0, "://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const-string v12, "://"

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    add-int v9, v0, v12

    .line 668
    invoke-virtual {p1, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    .line 670
    .local v11, "source":Ljava/lang/String;
    const/4 v0, 0x1

    invoke-static {v11, v0}, Lcom/tapjoy/TapjoyUtil;->convertURLParams(Ljava/lang/String;Z)Ljava/util/Map;

    move-result-object v10

    .line 672
    .local v10, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "video_id"

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 673
    .local v1, "videoID":Ljava/lang/String;
    const-string v0, "amount"

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 674
    .local v3, "amount":Ljava/lang/String;
    const-string v0, "currency_name"

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 675
    .local v2, "currencyName":Ljava/lang/String;
    const-string v0, "click_url"

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 676
    .local v4, "clickURL":Ljava/lang/String;
    const-string v0, "video_complete_url"

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 677
    .local v5, "videoCompleteURL":Ljava/lang/String;
    const-string v0, "video_url"

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 679
    .local v6, "videoURL":Ljava/lang/String;
    const-string v0, "TJAdUnitView"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "video_id: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 680
    const-string v0, "TJAdUnitView"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "amount: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 681
    const-string v0, "TJAdUnitView"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "currency_name: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 682
    const-string v0, "TJAdUnitView"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "click_url: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 683
    const-string v0, "TJAdUnitView"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "video_complete_url: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 684
    const-string v0, "TJAdUnitView"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "video_url: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 686
    invoke-static {}, Lcom/tapjoy/TapjoyVideo;->getInstance()Lcom/tapjoy/TapjoyVideo;

    move-result-object v0

    invoke-virtual/range {v0 .. v6}, Lcom/tapjoy/TapjoyVideo;->startVideo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 688
    const-string v0, "TJAdUnitView"

    const-string v12, "Video started successfully"

    invoke-static {v0, v12}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 711
    :goto_0
    return-void

    .line 693
    :cond_0
    const-string v0, "TJAdUnitView"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Unable to play video: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 694
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v12, ""

    invoke-virtual {v0, v12}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v12, "Unable to play video."

    invoke-virtual {v0, v12}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v12, "OK"

    new-instance v13, Lcom/tapjoy/TJAdUnitView$4;

    invoke-direct {v13, p0}, Lcom/tapjoy/TJAdUnitView$4;-><init>(Lcom/tapjoy/TJAdUnitView;)V

    invoke-virtual {v0, v12, v13}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    .line 704
    .local v7, "dialog":Landroid/app/AlertDialog;
    :try_start_0
    invoke-virtual {v7}, Landroid/app/AlertDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 706
    :catch_0
    move-exception v8

    .line 708
    .local v8, "e":Ljava/lang/Exception;
    const-string v0, "TJAdUnitView"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "e: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v8}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public finish()V
    .locals 3

    .prologue
    .line 802
    iget v1, p0, Lcom/tapjoy/TJAdUnitView;->viewType:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    iget v1, p0, Lcom/tapjoy/TJAdUnitView;->viewType:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_0

    .line 804
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 805
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "result"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 806
    const-string v1, "callback_id"

    iget-object v2, p0, Lcom/tapjoy/TJAdUnitView;->callbackID:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 807
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/tapjoy/TJAdUnitView;->setResult(ILandroid/content/Intent;)V

    .line 810
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 811
    return-void
.end method

.method public handleClose()V
    .locals 4

    .prologue
    .line 858
    iget-object v2, p0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    invoke-virtual {v2}, Lcom/tapjoy/mraid/view/MraidView;->videoPlaying()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 859
    iget-object v2, p0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    invoke-virtual {v2}, Lcom/tapjoy/mraid/view/MraidView;->videoViewCleanup()V

    .line 904
    :goto_0
    return-void

    .line 864
    :cond_0
    iget-object v2, p0, Lcom/tapjoy/TJAdUnitView;->bridge:Lcom/tapjoy/TJAdUnitJSBridge;

    iget-boolean v2, v2, Lcom/tapjoy/TJAdUnitJSBridge;->customClose:Z

    if-eqz v2, :cond_2

    .line 866
    const-string v2, "TJAdUnitView"

    const-string v3, "customClose"

    invoke-static {v2, v3}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 870
    iget-object v2, p0, Lcom/tapjoy/TJAdUnitView;->bridge:Lcom/tapjoy/TJAdUnitJSBridge;

    iget-boolean v2, v2, Lcom/tapjoy/TJAdUnitJSBridge;->shouldClose:Z

    if-eqz v2, :cond_1

    .line 872
    invoke-direct {p0}, Lcom/tapjoy/TJAdUnitView;->finishActivity()V

    goto :goto_0

    .line 876
    :cond_1
    const-string v2, "TJAdUnitView"

    const-string v3, "closeRequested..."

    invoke-static {v2, v3}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 879
    iget-object v2, p0, Lcom/tapjoy/TJAdUnitView;->bridge:Lcom/tapjoy/TJAdUnitJSBridge;

    invoke-virtual {v2}, Lcom/tapjoy/TJAdUnitJSBridge;->closeRequested()V

    .line 882
    new-instance v1, Lcom/tapjoy/TJAdUnitView$5;

    invoke-direct {v1, p0}, Lcom/tapjoy/TJAdUnitView$5;-><init>(Lcom/tapjoy/TJAdUnitView;)V

    .line 895
    .local v1, "timerTask":Ljava/util/TimerTask;
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    .line 896
    .local v0, "timer":Ljava/util/Timer;
    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0

    .line 902
    .end local v0    # "timer":Ljava/util/Timer;
    .end local v1    # "timerTask":Ljava/util/TimerTask;
    :cond_2
    invoke-direct {p0}, Lcom/tapjoy/TJAdUnitView;->finishActivity()V

    goto :goto_0
.end method

.method public handleWebViewOnPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 466
    const-string v0, "TJAdUnitView"

    const-string v1, "handleWebViewOnPageFinished"

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    return-void
.end method

.method public handleWebViewOnReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 443
    const-string v1, "TJAdUnitView"

    const-string v2, "handleWebViewError"

    invoke-static {v1, v2}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 445
    invoke-virtual {p0}, Lcom/tapjoy/TJAdUnitView;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 448
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/tapjoy/TJAdUnitView;->connectivityErrorMessage:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "OK"

    new-instance v3, Lcom/tapjoy/TJAdUnitView$3;

    invoke-direct {v3, p0}, Lcom/tapjoy/TJAdUnitView$3;-><init>(Lcom/tapjoy/TJAdUnitView;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 456
    .local v0, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 458
    .end local v0    # "dialog":Landroid/app/AlertDialog;
    :cond_0
    return-void
.end method

.method protected initUI()V
    .locals 20
    .annotation build Landroid/annotation/TargetApi;
        value = 0xc
    .end annotation

    .prologue
    .line 101
    const-string v2, "TJAdUnitView"

    const-string v3, "initUI"

    invoke-static {v2, v3}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    const/16 v16, 0x0

    .line 103
    .local v16, "loadURL":Z
    const/4 v14, 0x0

    .line 104
    .local v14, "html":Ljava/lang/String;
    const/4 v8, 0x0

    .line 106
    .local v8, "baseURL":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/tapjoy/TJAdUnitView;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v12

    .line 109
    .local v12, "extras":Landroid/os/Bundle;
    if-eqz v12, :cond_6

    .line 112
    const-string v2, "DISPLAY_AD_URL"

    invoke-virtual {v12, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 114
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/tapjoy/TJAdUnitView;->skipOfferWall:Z

    .line 115
    const-string v2, "DISPLAY_AD_URL"

    invoke-virtual {v12, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/tapjoy/TJAdUnitView;->offersURL:Ljava/lang/String;

    .line 131
    :cond_0
    :goto_0
    const-string v2, "tjevent"

    invoke-virtual {v12, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    check-cast v2, Lcom/tapjoy/TJEventData;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/tapjoy/TJAdUnitView;->eventData:Lcom/tapjoy/TJEventData;

    .line 133
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->eventData:Lcom/tapjoy/TJEventData;

    if-eqz v2, :cond_1

    .line 134
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v2, v2, Lcom/tapjoy/TJEventData;->guid:Ljava/lang/String;

    invoke-static {v2}, Lcom/tapjoy/TJEventManager;->get(Ljava/lang/String;)Lcom/tapjoy/TJEvent;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/tapjoy/TJAdUnitView;->event:Lcom/tapjoy/TJEvent;

    .line 136
    :cond_1
    const-string v2, "view_type"

    invoke-virtual {v12, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/tapjoy/TJAdUnitView;->viewType:I

    .line 138
    const-string v2, "html"

    invoke-virtual {v12, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 139
    const-string v2, "base_url"

    invoke-virtual {v12, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 140
    const-string v2, "url"

    invoke-virtual {v12, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/tapjoy/TJAdUnitView;->url:Ljava/lang/String;

    .line 141
    const-string v2, "callback_id"

    invoke-virtual {v12, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/tapjoy/TJAdUnitView;->callbackID:Ljava/lang/String;

    .line 142
    const-string v2, "legacy_view"

    invoke-virtual {v12, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/tapjoy/TJAdUnitView;->isLegacyView:Z

    .line 146
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    if-nez v2, :cond_6

    .line 148
    new-instance v2, Lcom/tapjoy/mraid/view/MraidView;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/tapjoy/mraid/view/MraidView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    .line 149
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    invoke-virtual {v2}, Lcom/tapjoy/mraid/view/MraidView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 151
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    new-instance v3, Lcom/tapjoy/TJAdUnitView$TJAdUnitViewListener;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v4}, Lcom/tapjoy/TJAdUnitView$TJAdUnitViewListener;-><init>(Lcom/tapjoy/TJAdUnitView;Lcom/tapjoy/TJAdUnitView$1;)V

    invoke-virtual {v2, v3}, Lcom/tapjoy/mraid/view/MraidView;->setListener(Lcom/tapjoy/mraid/listener/MraidViewListener;)V

    .line 154
    new-instance v2, Lcom/tapjoy/TJAdUnitJSBridge;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/tapjoy/TJAdUnitView;->eventData:Lcom/tapjoy/TJEventData;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3, v4}, Lcom/tapjoy/TJAdUnitJSBridge;-><init>(Landroid/content/Context;Landroid/webkit/WebView;Lcom/tapjoy/TJEventData;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/tapjoy/TJAdUnitView;->bridge:Lcom/tapjoy/TJAdUnitJSBridge;

    .line 157
    move-object/from16 v0, p0

    iget v2, v0, Lcom/tapjoy/TJAdUnitView;->viewType:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_8

    .line 159
    const-string v2, "TJAdUnitView"

    const-string v3, "Loading event data"

    invoke-static {v2, v3}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->event:Lcom/tapjoy/TJEvent;

    if-eqz v2, :cond_2

    .line 163
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitView;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v3, v3, Lcom/tapjoy/TJEventData;->baseURL:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/tapjoy/TJAdUnitView;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v4, v4, Lcom/tapjoy/TJEventData;->httpResponse:Ljava/lang/String;

    const-string v5, "text/html"

    const-string v6, "utf-8"

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/tapjoy/mraid/view/MraidView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/tapjoy/mraid/view/MraidView;->setVisibility(I)V

    .line 170
    const/4 v2, 0x4

    invoke-static {v2}, Lcom/tapjoy/TapjoyConnectCore;->viewWillOpen(I)V

    .line 173
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->event:Lcom/tapjoy/TJEvent;

    invoke-virtual {v2}, Lcom/tapjoy/TJEvent;->getCallback()Lcom/tapjoy/TJEventCallback;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 174
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->event:Lcom/tapjoy/TJEvent;

    invoke-virtual {v2}, Lcom/tapjoy/TJEvent;->getCallback()Lcom/tapjoy/TJEventCallback;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitView;->event:Lcom/tapjoy/TJEvent;

    invoke-interface {v2, v3}, Lcom/tapjoy/TJEventCallback;->contentDidShow(Lcom/tapjoy/TJEvent;)V

    .line 209
    :cond_2
    :goto_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_3

    .line 210
    invoke-virtual/range {p0 .. p0}, Lcom/tapjoy/TJAdUnitView;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/high16 v3, 0x1000000

    const/high16 v4, 0x1000000

    invoke-virtual {v2, v3, v4}, Landroid/view/Window;->setFlags(II)V

    .line 213
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/tapjoy/TJAdUnitView;->getWindow()Landroid/view/Window;

    move-result-object v2

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v4, 0x60000000

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 216
    new-instance v18, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x1

    move-object/from16 v0, v18

    invoke-direct {v0, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 217
    .local v18, "params":Landroid/view/ViewGroup$LayoutParams;
    new-instance v2, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/tapjoy/TJAdUnitView;->layout:Landroid/widget/RelativeLayout;

    .line 218
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 221
    move-object/from16 v0, p0

    iget v2, v0, Lcom/tapjoy/TJAdUnitView;->viewType:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_d

    .line 223
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->layout:Landroid/widget/RelativeLayout;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 224
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->layout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 233
    :goto_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Lcom/tapjoy/mraid/view/MraidView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 236
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    invoke-virtual {v2}, Lcom/tapjoy/mraid/view/MraidView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 237
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    invoke-virtual {v2}, Lcom/tapjoy/mraid/view/MraidView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 240
    :cond_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    const/4 v4, -0x1

    const/4 v5, -0x1

    invoke-virtual {v2, v3, v4, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;II)V

    .line 241
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/tapjoy/TJAdUnitView;->setContentView(Landroid/view/View;)V

    .line 245
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/tapjoy/TJAdUnitView;->isLegacyView:Z

    if-eqz v2, :cond_5

    if-eqz v16, :cond_5

    .line 248
    new-instance v2, Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    const v4, 0x101007a

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3, v4}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/tapjoy/TJAdUnitView;->progressBar:Landroid/widget/ProgressBar;

    .line 249
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->progressBar:Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 252
    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x2

    invoke-direct {v15, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 253
    .local v15, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xd

    invoke-virtual {v15, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 254
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v15}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 255
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 259
    .end local v15    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    invoke-virtual {v2}, Lcom/tapjoy/mraid/view/MraidView;->isMraid()Z

    move-result v2

    if-nez v2, :cond_6

    .line 261
    new-instance v10, Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    invoke-direct {v10, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 263
    .local v10, "closeButton":Landroid/widget/ImageButton;
    invoke-direct/range {p0 .. p0}, Lcom/tapjoy/TJAdUnitView;->getCloseBitmap()Landroid/graphics/Bitmap;

    move-result-object v9

    .line 264
    .local v9, "closeBitmap":Landroid/graphics/Bitmap;
    if-eqz v9, :cond_e

    .line 266
    invoke-virtual {v10, v9}, Landroid/widget/ImageButton;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 267
    const v2, 0xffffff

    invoke-virtual {v10, v2}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 269
    new-instance v2, Lcom/tapjoy/TJAdUnitView$1;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/tapjoy/TJAdUnitView$1;-><init>(Lcom/tapjoy/TJAdUnitView;)V

    invoke-virtual {v10, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 277
    new-instance v11, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x2

    invoke-direct {v11, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 278
    .local v11, "closeButtonLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xa

    invoke-virtual {v11, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 279
    const/16 v2, 0xb

    invoke-virtual {v11, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 280
    const/high16 v2, -0x3ee00000    # -10.0f

    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getDeviceScreenDensityScale()F

    move-result v3

    mul-float/2addr v2, v3

    float-to-int v0, v2

    move/from16 v17, v0

    .line 281
    .local v17, "offset":I
    const/4 v2, 0x0

    const/4 v3, 0x0

    move/from16 v0, v17

    move/from16 v1, v17

    invoke-virtual {v11, v2, v0, v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 283
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->layout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v10, v11}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 286
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xc

    if-lt v2, v3, :cond_6

    .line 287
    const/4 v2, 0x0

    invoke-virtual {v10, v2}, Landroid/widget/ImageButton;->setAlpha(F)V

    .line 288
    const/4 v2, 0x0

    invoke-virtual {v10, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 289
    const/4 v2, 0x0

    invoke-virtual {v10, v2}, Landroid/widget/ImageButton;->setClickable(Z)V

    .line 293
    new-instance v13, Landroid/os/Handler;

    invoke-direct {v13}, Landroid/os/Handler;-><init>()V

    .line 294
    .local v13, "handler":Landroid/os/Handler;
    new-instance v2, Lcom/tapjoy/TJAdUnitView$2;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v10}, Lcom/tapjoy/TJAdUnitView$2;-><init>(Lcom/tapjoy/TJAdUnitView;Landroid/widget/ImageButton;)V

    const-wide/16 v3, 0x7d0

    invoke-virtual {v13, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 324
    .end local v9    # "closeBitmap":Landroid/graphics/Bitmap;
    .end local v10    # "closeButton":Landroid/widget/ImageButton;
    .end local v11    # "closeButtonLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v13    # "handler":Landroid/os/Handler;
    .end local v17    # "offset":I
    .end local v18    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_6
    :goto_3
    return-void

    .line 119
    :cond_7
    const-string v2, "URL_PARAMS"

    invoke-virtual {v12, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 121
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/tapjoy/TJAdUnitView;->skipOfferWall:Z

    .line 122
    const/16 v19, 0x0

    .line 123
    .local v19, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "URL_PARAMS"

    invoke-virtual {v12, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v19

    .end local v19    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    check-cast v19, Ljava/util/HashMap;

    .line 125
    .restart local v19    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "TJAdUnitView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "urlParams: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getHostURL()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "get_offers/webpage?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x0

    move-object/from16 v0, v19

    invoke-static {v0, v3}, Lcom/tapjoy/TapjoyUtil;->convertURLParams(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/tapjoy/TJAdUnitView;->offersURL:Ljava/lang/String;

    goto/16 :goto_0

    .line 181
    .end local v19    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_8
    if-eqz v14, :cond_b

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_b

    .line 183
    const-string v2, "TJAdUnitView"

    const-string v3, "Loading HTML data"

    invoke-static {v2, v3}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/tapjoy/TJAdUnitView;->isLegacyView:Z

    if-eqz v2, :cond_a

    .line 186
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    const-string v5, "text/html"

    const-string v6, "utf-8"

    const/4 v7, 0x0

    move-object v3, v8

    move-object v4, v14

    invoke-virtual/range {v2 .. v7}, Lcom/tapjoy/mraid/view/MraidView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    :cond_9
    :goto_4
    const/16 v16, 0x1

    goto/16 :goto_1

    .line 188
    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    const/4 v3, 0x0

    const-string v5, "text/html"

    const-string v6, "utf-8"

    const/4 v7, 0x0

    move-object v4, v14

    invoke-virtual/range {v2 .. v7}, Lcom/tapjoy/mraid/view/MraidView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 192
    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->url:Ljava/lang/String;

    if-eqz v2, :cond_c

    .line 194
    const-string v2, "TJAdUnitView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Load URL: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/tapjoy/TJAdUnitView;->url:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitView;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/tapjoy/mraid/view/MraidView;->loadUrl(Ljava/lang/String;)V

    goto :goto_4

    .line 199
    :cond_c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->offersURL:Ljava/lang/String;

    if-eqz v2, :cond_9

    .line 201
    const-string v2, "TJAdUnitView"

    const-string v3, "Load Offer Wall URL"

    invoke-static {v2, v3}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitView;->offersURL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/tapjoy/mraid/view/MraidView;->loadUrl(Ljava/lang/String;)V

    goto :goto_4

    .line 229
    .restart local v18    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->layout:Landroid/widget/RelativeLayout;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 230
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tapjoy/TJAdUnitView;->layout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/16 v3, 0xff

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto/16 :goto_2

    .line 319
    .restart local v9    # "closeBitmap":Landroid/graphics/Bitmap;
    .restart local v10    # "closeButton":Landroid/widget/ImageButton;
    :cond_e
    const-string v2, "TJAdUnitView"

    const-string v3, "Error loading bitmap data for close button!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3
.end method

.method protected isNetworkAvailable()Z
    .locals 2

    .prologue
    .line 927
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Lcom/tapjoy/TJAdUnitView;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 928
    .local v0, "conMgr":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 824
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 826
    const-string v1, "TJAdUnitView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onActivityResult requestCode:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", resultCode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 828
    const/4 v0, 0x0

    .line 830
    .local v0, "extras":Landroid/os/Bundle;
    if-eqz p3, :cond_0

    .line 831
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 833
    :cond_0
    if-eqz v0, :cond_1

    const-string v1, "callback_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 835
    const-string v1, "TJAdUnitView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onActivityResult extras: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 837
    iget-object v1, p0, Lcom/tapjoy/TJAdUnitView;->bridge:Lcom/tapjoy/TJAdUnitJSBridge;

    const-string v2, "callback_id"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "result"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "result_string1"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string v5, "result_string2"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/tapjoy/TJAdUnitJSBridge;->invokeJSCallback(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 839
    :cond_1
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 405
    const-string v0, "TJAdUnitView"

    const-string v1, "onConfigurationChanged"

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 411
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 414
    invoke-virtual {p0}, Lcom/tapjoy/TJAdUnitView;->initUI()V

    .line 415
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v2, 0x400

    .line 83
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_0

    .line 84
    const v0, 0x103000f

    invoke-virtual {p0, v0}, Lcom/tapjoy/TJAdUnitView;->setTheme(I)V

    .line 91
    :goto_0
    const-string v0, "TJAdUnitView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "TJAdUnitView onCreate: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 94
    invoke-virtual {p0}, Lcom/tapjoy/TJAdUnitView;->initUI()V

    .line 95
    return-void

    .line 87
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/tapjoy/TJAdUnitView;->requestWindowFeature(I)Z

    .line 88
    invoke-virtual {p0}, Lcom/tapjoy/TJAdUnitView;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setFlags(II)V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 716
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 718
    const-string v0, "TJAdUnitView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDestroy isFinishing: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/tapjoy/TJAdUnitView;->isFinishing()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 721
    invoke-virtual {p0}, Lcom/tapjoy/TJAdUnitView;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 723
    iget v0, p0, Lcom/tapjoy/TJAdUnitView;->viewType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 726
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->bridge:Lcom/tapjoy/TJAdUnitJSBridge;

    invoke-virtual {v0}, Lcom/tapjoy/TJAdUnitJSBridge;->destroy()V

    .line 729
    const/4 v0, 0x4

    invoke-static {v0}, Lcom/tapjoy/TapjoyConnectCore;->viewDidClose(I)V

    .line 732
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->event:Lcom/tapjoy/TJEvent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->event:Lcom/tapjoy/TJEvent;

    invoke-virtual {v0}, Lcom/tapjoy/TJEvent;->getCallback()Lcom/tapjoy/TJEventCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 733
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->event:Lcom/tapjoy/TJEvent;

    invoke-virtual {v0}, Lcom/tapjoy/TJEvent;->getCallback()Lcom/tapjoy/TJEventCallback;

    move-result-object v0

    iget-object v1, p0, Lcom/tapjoy/TJAdUnitView;->event:Lcom/tapjoy/TJEvent;

    invoke-interface {v0, v1}, Lcom/tapjoy/TJEventCallback;->contentDidDisappear(Lcom/tapjoy/TJEvent;)V

    .line 735
    :cond_0
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v0, v0, Lcom/tapjoy/TJEventData;->guid:Ljava/lang/String;

    invoke-static {v0}, Lcom/tapjoy/TJEventManager;->remove(Ljava/lang/String;)V

    .line 738
    :cond_1
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    if-eqz v0, :cond_2

    .line 743
    :try_start_0
    const-class v0, Landroid/webkit/WebView;

    const-string v1, "onPause"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v1, p0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 751
    :goto_0
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 756
    :cond_2
    :goto_1
    return-void

    .line 753
    :catch_0
    move-exception v0

    goto :goto_1

    .line 745
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 844
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 846
    invoke-virtual {p0}, Lcom/tapjoy/TJAdUnitView;->handleClose()V

    .line 847
    const/4 v0, 0x1

    .line 850
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 761
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 762
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tapjoy/TJAdUnitView;->pauseCalled:Z

    .line 767
    :try_start_0
    const-class v0, Landroid/webkit/WebView;

    const-string v1, "onPause"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v1, p0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 770
    :goto_0
    return-void

    .line 769
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 430
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 433
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    if-eqz v0, :cond_0

    .line 434
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    invoke-virtual {v0, p1}, Lcom/tapjoy/mraid/view/MraidView;->restoreState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    .line 435
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 5

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 775
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 780
    :try_start_0
    const-class v0, Landroid/webkit/WebView;

    const-string v1, "onResume"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v1, p0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 784
    :goto_0
    iget v0, p0, Lcom/tapjoy/TJAdUnitView;->viewType:I

    if-ne v0, v3, :cond_0

    .line 787
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->bridge:Lcom/tapjoy/TJAdUnitJSBridge;

    iget-boolean v0, v0, Lcom/tapjoy/TJAdUnitJSBridge;->didLaunchOtherActivity:Z

    if-eqz v0, :cond_0

    .line 789
    const-string v0, "TJAdUnitView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onResume bridge.didLaunchOtherActivity callbackID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/tapjoy/TJAdUnitView;->bridge:Lcom/tapjoy/TJAdUnitJSBridge;

    iget-object v2, v2, Lcom/tapjoy/TJAdUnitJSBridge;->otherActivityCallbackID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 791
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->bridge:Lcom/tapjoy/TJAdUnitJSBridge;

    iget-object v1, p0, Lcom/tapjoy/TJAdUnitView;->bridge:Lcom/tapjoy/TJAdUnitJSBridge;

    iget-object v1, v1, Lcom/tapjoy/TJAdUnitJSBridge;->otherActivityCallbackID:Ljava/lang/String;

    new-array v2, v3, [Ljava/lang/Object;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lcom/tapjoy/TJAdUnitJSBridge;->invokeJSCallback(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 792
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->bridge:Lcom/tapjoy/TJAdUnitJSBridge;

    iput-boolean v4, v0, Lcom/tapjoy/TJAdUnitJSBridge;->didLaunchOtherActivity:Z

    .line 795
    :cond_0
    return-void

    .line 782
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 420
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 423
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    if-eqz v0, :cond_0

    .line 424
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView;->webView:Lcom/tapjoy/mraid/view/MraidView;

    invoke-virtual {v0, p1}, Lcom/tapjoy/mraid/view/MraidView;->saveState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    .line 425
    :cond_0
    return-void
.end method
