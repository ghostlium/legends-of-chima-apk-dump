.class public final Lcom/flurry/android/FlurryFullscreenTakeoverActivity;
.super Landroid/app/Activity;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/android/FlurryFullscreenTakeoverActivity$1;,
        Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;,
        Lcom/flurry/android/FlurryFullscreenTakeoverActivity$a;,
        Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;
    }
.end annotation


# static fields
.field public static final EXTRA_KEY_ADSPACENAME:Ljava/lang/String; = "adSpaceName"

.field public static final EXTRA_KEY_FRAMEINDEX:Ljava/lang/String; = "frameIndex"

.field public static final EXTRA_KEY_TARGETINTENT:Ljava/lang/String; = "targetIntent"

.field public static final EXTRA_KEY_URL:Ljava/lang/String; = "url"

.field private static final a:Ljava/lang/String;


# instance fields
.field private b:Ljava/lang/String;

.field private c:Lcom/flurry/sdk/g;

.field private d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

.field private e:Landroid/view/ViewGroup;

.field private f:Lcom/flurry/sdk/m;

.field private g:Landroid/app/ProgressDialog;

.field private h:Landroid/widget/VideoView;

.field private i:Z

.field private j:Landroid/widget/MediaController;

.field private k:Z

.field private l:Landroid/content/Intent;

.field private m:J

.field private n:Ljava/lang/String;

.field private o:Lcom/flurry/sdk/m$e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    const-class v0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 73
    sget-object v0, Lcom/flurry/sdk/m$e;->a:Lcom/flurry/sdk/m$e;

    iput-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->o:Lcom/flurry/sdk/m$e;

    .line 474
    return-void
.end method

.method static synthetic a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;)Landroid/widget/VideoView;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    return-object v0
.end method

.method static synthetic a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Landroid/widget/VideoView;)Landroid/widget/VideoView;
    .locals 0

    .prologue
    .line 42
    iput-object p1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    return-object p1
.end method

.method static synthetic a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Lcom/flurry/sdk/m$e;)Lcom/flurry/sdk/m$e;
    .locals 0

    .prologue
    .line 42
    iput-object p1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->o:Lcom/flurry/sdk/m$e;

    return-object p1
.end method

.method private a()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 402
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->g:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_1

    .line 403
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->g:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 404
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->g:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 406
    :cond_0
    iput-object v2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->g:Landroid/app/ProgressDialog;

    .line 409
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    if-eqz v0, :cond_2

    .line 410
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    invoke-virtual {v0, v3}, Lcom/flurry/sdk/m;->setVisibility(I)V

    .line 413
    :cond_2
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    if-eqz v0, :cond_5

    .line 414
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 415
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->stopPlayback()V

    .line 418
    :cond_3
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->e:Landroid/view/ViewGroup;

    if-eqz v0, :cond_4

    .line 419
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->e:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 422
    :cond_4
    iput-object v2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    .line 425
    :cond_5
    iput-boolean v3, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->i:Z

    .line 426
    iput-object v2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->j:Landroid/widget/MediaController;

    .line 427
    return-void
.end method

.method static synthetic a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Z)Z
    .locals 0

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->i:Z

    return p1
.end method

.method private a(Ljava/lang/String;)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 336
    .line 337
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 338
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v1

    invoke-static {p1}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 340
    if-eqz v1, :cond_0

    const-string v2, "video/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 342
    :cond_0
    return v0
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    .prologue
    .line 355
    const/4 v0, 0x0

    .line 356
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 370
    :cond_0
    :goto_0
    return v0

    .line 360
    :cond_1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 361
    const-string v2, "link"

    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 362
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 366
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 367
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static synthetic b(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->n:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic b(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c(Ljava/lang/String;)V

    return-void
.end method

.method private b(Ljava/lang/String;)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 346
    .line 347
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 348
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 349
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v2, "market"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 351
    :cond_0
    return v0
.end method

.method private c(Ljava/lang/String;)V
    .locals 5

    .prologue
    const/4 v4, -0x1

    .line 374
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->e:Landroid/view/ViewGroup;

    if-nez v0, :cond_1

    .line 399
    :cond_0
    :goto_0
    return-void

    .line 378
    :cond_1
    new-instance v0, Landroid/widget/MediaController;

    invoke-direct {v0, p0}, Landroid/widget/MediaController;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->j:Landroid/widget/MediaController;

    .line 380
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    invoke-virtual {v0, p0}, Landroid/widget/VideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 381
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    invoke-virtual {v0, p0}, Landroid/widget/VideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 382
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    invoke-virtual {v0, p0}, Landroid/widget/VideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 383
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->j:Landroid/widget/MediaController;

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setMediaController(Landroid/widget/MediaController;)V

    .line 384
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 386
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->e:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x11

    invoke-direct {v2, v4, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 390
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->g:Landroid/app/ProgressDialog;

    .line 391
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->g:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 392
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->g:Landroid/app/ProgressDialog;

    const-string v1, "Loading..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 393
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->g:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 394
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->g:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 396
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    if-eqz v0, :cond_0

    .line 397
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/m;->setVisibility(I)V

    goto :goto_0
.end method

.method static synthetic c(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->b(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;
    .locals 1

    .prologue
    .line 537
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    return-object v0
.end method

.method public getAdUnityView()Lcom/flurry/sdk/g;
    .locals 1

    .prologue
    .line 542
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    return-object v0
.end method

.method public getResult()Lcom/flurry/sdk/m$e;
    .locals 1

    .prologue
    .line 547
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->o:Lcom/flurry/sdk/m$e;

    return-object v0
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 3

    .prologue
    .line 317
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v2, "onCompletion"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 318
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    .prologue
    .line 181
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v2, "onConfigurationChange"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 182
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 183
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7

    .prologue
    const/4 v4, 0x3

    const/4 v5, -0x1

    const/4 v6, -0x2

    const/4 v3, 0x0

    .line 78
    sget-object v0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v1, "onCreate"

    invoke-static {v4, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 79
    const v0, 0x1030007

    invoke-virtual {p0, v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->setTheme(I)V

    .line 80
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 82
    invoke-virtual {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/bw;->a(Landroid/view/Window;)V

    .line 84
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->f()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->b:Ljava/lang/String;

    .line 86
    invoke-virtual {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 87
    const-string v0, "targetIntent"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->l:Landroid/content/Intent;

    .line 88
    const-string v0, "adSpaceName"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->n:Ljava/lang/String;

    .line 90
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->l:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 92
    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->l:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->startActivity(Landroid/content/Intent;)V

    .line 93
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->m:J
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    :goto_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    .line 143
    invoke-virtual {v0, p0, p1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 144
    return-void

    .line 94
    :catch_0
    move-exception v0

    .line 95
    sget-object v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v2, "Cannot launch Activity"

    invoke-static {v1, v2, v0}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 96
    iput-object v3, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->l:Landroid/content/Intent;

    .line 97
    invoke-virtual {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->finish()V

    goto :goto_0

    .line 100
    :cond_0
    const-string v0, "url"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 101
    if-nez v0, :cond_4

    .line 103
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->e:Landroid/view/ViewGroup;

    .line 105
    if-nez p1, :cond_2

    .line 106
    :goto_1
    if-gez v5, :cond_1

    .line 108
    const-string v0, "frameIndex"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 110
    :cond_1
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v2

    .line 111
    invoke-virtual {v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->H()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 112
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    if-eqz v0, :cond_3

    .line 113
    new-instance v0, Lcom/flurry/sdk/g;

    invoke-virtual {v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->G()Lcom/flurry/sdk/e;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/g;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;I)V

    iput-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    .line 114
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->initLayout()V

    .line 115
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 116
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 117
    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->e:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->e:Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->setContentView(Landroid/view/View;)V

    goto :goto_0

    .line 105
    :cond_2
    const-string v0, "frameIndex"

    invoke-virtual {p1, v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    goto :goto_1

    .line 120
    :cond_3
    sget-object v0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v1, "appSpotModule.getTakeoverAdUnit() IS null "

    invoke-static {v4, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 125
    :cond_4
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->e:Landroid/view/ViewGroup;

    .line 126
    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->e:Landroid/view/ViewGroup;

    invoke-virtual {p0, v1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->setContentView(Landroid/view/View;)V

    .line 128
    invoke-direct {p0, v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 129
    new-instance v1, Lcom/flurry/sdk/f;

    invoke-direct {v1, p0}, Lcom/flurry/sdk/f;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    .line 130
    invoke-direct {p0, v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 132
    :cond_5
    new-instance v1, Lcom/flurry/sdk/m;

    invoke-direct {v1, p0, v0}, Lcom/flurry/sdk/m;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    .line 133
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    new-instance v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;

    invoke-direct {v1, p0, v3}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;-><init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Lcom/flurry/android/FlurryFullscreenTakeoverActivity$1;)V

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/m;->setBasicWebViewUrlLoadingHandler(Lcom/flurry/sdk/m$f;)V

    .line 134
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    new-instance v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$a;

    invoke-direct {v1, p0, v3}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$a;-><init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Lcom/flurry/android/FlurryFullscreenTakeoverActivity$1;)V

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/m;->setBasicWebViewClosingHandler(Lcom/flurry/sdk/m$c;)V

    .line 135
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    new-instance v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;

    invoke-direct {v1, p0, v3}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;-><init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Lcom/flurry/android/FlurryFullscreenTakeoverActivity$1;)V

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/m;->setBasicWebViewFullScreenTransitionHandler(Lcom/flurry/sdk/m$d;)V

    .line 137
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->e:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 222
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v2, "onDestroy"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 223
    invoke-direct {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a()V

    .line 224
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    if-eqz v0, :cond_0

    .line 225
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    invoke-virtual {v0}, Lcom/flurry/sdk/m;->c()V

    .line 228
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    if-eqz v0, :cond_1

    .line 229
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->stop()V

    .line 232
    :cond_1
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    .line 233
    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Landroid/app/Activity;)V

    .line 235
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 236
    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 3

    .prologue
    .line 292
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v2, "onError"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 293
    sget-object v0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v1, "Error occurs during video playback"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    if-eqz v0, :cond_2

    .line 297
    iget-boolean v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->i:Z

    if-eqz v0, :cond_1

    .line 298
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    invoke-virtual {v0}, Lcom/flurry/sdk/m;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 299
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    invoke-virtual {v0}, Lcom/flurry/sdk/m;->b()V

    .line 300
    invoke-direct {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a()V

    .line 311
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 302
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->finish()V

    goto :goto_0

    .line 305
    :cond_1
    invoke-direct {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a()V

    goto :goto_0

    .line 308
    :cond_2
    invoke-virtual {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->finish()V

    goto :goto_0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 257
    const/4 v0, 0x4

    if-ne p1, v0, :cond_4

    .line 258
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    if-eqz v0, :cond_0

    .line 259
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    const-string v1, "adWillClose"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    iget-object v3, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v3}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v4}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    iget-object v5, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v5}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    move v0, v7

    .line 286
    :goto_0
    return v0

    .line 261
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    if-eqz v0, :cond_2

    .line 262
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    if-eqz v0, :cond_4

    .line 264
    iget-boolean v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->i:Z

    if-eqz v0, :cond_1

    .line 265
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    invoke-virtual {v0}, Lcom/flurry/sdk/m;->a()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 266
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    invoke-virtual {v0}, Lcom/flurry/sdk/m;->b()V

    .line 267
    invoke-direct {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a()V

    move v0, v7

    .line 268
    goto :goto_0

    .line 271
    :cond_1
    invoke-direct {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a()V

    move v0, v7

    .line 272
    goto :goto_0

    .line 275
    :cond_2
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    if-eqz v0, :cond_4

    .line 276
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    invoke-virtual {v0}, Lcom/flurry/sdk/m;->a()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 277
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->f:Lcom/flurry/sdk/m;

    invoke-virtual {v0}, Lcom/flurry/sdk/m;->b()V

    :goto_1
    move v0, v7

    .line 282
    goto :goto_0

    .line 279
    :cond_3
    sget-object v0, Lcom/flurry/sdk/m$e;->b:Lcom/flurry/sdk/m$e;

    iput-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->o:Lcom/flurry/sdk/m$e;

    .line 280
    invoke-virtual {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->finish()V

    goto :goto_1

    .line 286
    :cond_4
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 208
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v2, "onPause"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 209
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 210
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->k:Z

    .line 211
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 213
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->pause()V

    .line 216
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    if-eqz v0, :cond_1

    .line 217
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->c()V

    .line 219
    :cond_1
    return-void
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 3

    .prologue
    .line 323
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v2, "onPrepared"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 324
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->g:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->g:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 326
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->g:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 329
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->k:Z

    if-eqz v0, :cond_1

    .line 331
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->h:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->start()V

    .line 333
    :cond_1
    return-void
.end method

.method protected onRestart()V
    .locals 3

    .prologue
    .line 187
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v2, "onRestart"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 188
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 189
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    .line 193
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v2, "onResume"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 194
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 195
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->k:Z

    .line 196
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->j:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 198
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->j:Landroid/widget/MediaController;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/MediaController;->show(I)V

    .line 201
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    if-eqz v0, :cond_1

    .line 202
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->b()V

    .line 204
    :cond_1
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .prologue
    .line 171
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 172
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    if-eqz v0, :cond_0

    .line 174
    const-string v0, "frameIndex"

    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v1}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 176
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 3

    .prologue
    .line 149
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v2, "onStart"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 150
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 151
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->b:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 152
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->b:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/flurry/android/FlurryAgent;->onStartSession(Landroid/content/Context;Ljava/lang/String;)V

    .line 156
    :goto_0
    return-void

    .line 154
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->finish()V

    goto :goto_0
.end method

.method public onStop()V
    .locals 3

    .prologue
    .line 161
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v2, "onStop"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 162
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->b:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 163
    invoke-static {p0}, Lcom/flurry/android/FlurryAgent;->onEndSession(Landroid/content/Context;)V

    .line 165
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 166
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 5

    .prologue
    const/4 v4, 0x3

    .line 240
    sget-object v0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onWindowFocusChanged hasFocus = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 241
    iget-boolean v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->k:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 242
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->l:Landroid/content/Intent;

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->m:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0xfa

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 243
    sget-object v0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a:Ljava/lang/String;

    const-string v1, "terminate this launcher activity because launched activity was terminated or wasn\'t launched"

    invoke-static {v4, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 244
    invoke-virtual {p0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->finish()V

    .line 248
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 249
    return-void
.end method
