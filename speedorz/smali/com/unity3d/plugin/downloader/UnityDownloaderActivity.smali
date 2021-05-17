.class public Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;
.super Landroid/app/Activity;

# interfaces
.implements Lcom/unity3d/plugin/downloader/a/n;


# instance fields
.field private a:Landroid/widget/ProgressBar;

.field private b:Landroid/widget/TextView;

.field private c:Landroid/widget/TextView;

.field private d:Landroid/widget/TextView;

.field private e:Landroid/widget/TextView;

.field private f:Landroid/widget/TextView;

.field private g:Landroid/view/View;

.field private h:Landroid/view/View;

.field private i:Landroid/widget/Button;

.field private j:Landroid/widget/Button;

.field private k:Z

.field private l:I

.field private m:Lcom/unity3d/plugin/downloader/a/o;

.field private n:Lcom/unity3d/plugin/downloader/a/p;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->a(Z)V

    return-void
.end method

.method private a(Z)V
    .locals 2

    iput-boolean p1, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->k:Z

    if-eqz p1, :cond_0

    const-string v0, "text_button_resume"

    :goto_0
    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->b(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->i:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(I)V

    return-void

    :cond_0
    const-string v0, "text_button_pause"

    goto :goto_0
.end method

.method static synthetic a(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->k:Z

    return v0
.end method

.method static synthetic b(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)Lcom/unity3d/plugin/downloader/a/o;
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->m:Lcom/unity3d/plugin/downloader/a/o;

    return-object v0
.end method

.method static synthetic c(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->h:Landroid/view/View;

    return-object v0
.end method


# virtual methods
.method public final a(I)V
    .locals 7

    const/16 v2, 0x8

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget v3, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->l:I

    if-eq v3, p1, :cond_0

    iput p1, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->l:I

    iget-object v3, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->b:Landroid/widget/TextView;

    invoke-static {p0, p1}, Lcom/unity3d/plugin/downloader/a/m;->a(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    :cond_0
    packed-switch p1, :pswitch_data_0

    :pswitch_0
    move v3, v0

    move v4, v1

    move v5, v0

    :goto_0
    if-eqz v0, :cond_3

    move v0, v1

    :goto_1
    iget-object v6, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->g:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-eq v6, v0, :cond_1

    iget-object v6, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->g:Landroid/view/View;

    invoke-virtual {v6, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    if-eqz v4, :cond_4

    :goto_2
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->h:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->h:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->a:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    invoke-direct {p0, v5}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->a(Z)V

    :goto_3
    return-void

    :pswitch_1
    move v3, v0

    move v4, v1

    move v5, v1

    goto :goto_0

    :pswitch_2
    move v3, v0

    move v4, v1

    move v5, v1

    goto :goto_0

    :pswitch_3
    move v3, v1

    move v4, v1

    move v5, v1

    goto :goto_0

    :pswitch_4
    move v3, v1

    move v4, v1

    move v5, v0

    move v0, v1

    goto :goto_0

    :pswitch_5
    move v3, v1

    move v4, v0

    move v5, v0

    move v0, v1

    goto :goto_0

    :pswitch_6
    move v3, v1

    move v4, v1

    move v5, v0

    goto :goto_0

    :pswitch_7
    move v3, v1

    move v4, v1

    move v5, v0

    goto :goto_0

    :pswitch_8
    invoke-virtual {p0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->finish()V

    goto :goto_3

    :cond_3
    move v0, v2

    goto :goto_1

    :cond_4
    move v1, v2

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_8
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_7
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method public final a(Landroid/os/Messenger;)V
    .locals 2

    invoke-static {p1}, Lcom/unity3d/plugin/downloader/a/i;->a(Landroid/os/Messenger;)Lcom/unity3d/plugin/downloader/a/o;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->m:Lcom/unity3d/plugin/downloader/a/o;

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->m:Lcom/unity3d/plugin/downloader/a/o;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->n:Lcom/unity3d/plugin/downloader/a/p;

    invoke-interface {v1}, Lcom/unity3d/plugin/downloader/a/p;->a()Landroid/os/Messenger;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/unity3d/plugin/downloader/a/o;->a(Landroid/os/Messenger;)V

    return-void
.end method

.method public final a(Lcom/unity3d/plugin/downloader/a/b;)V
    .locals 7

    const/16 v6, 0x8

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->e:Landroid/widget/TextView;

    const-string v1, "kilobytes_per_second"

    invoke-static {p0, v1}, Lcom/unity3d/plugin/downloader/a/m;->b(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    new-array v2, v4, [Ljava/lang/Object;

    iget v3, p1, Lcom/unity3d/plugin/downloader/a/b;->d:F

    invoke-static {v3}, Lcom/unity3d/plugin/downloader/a/m;->a(F)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {p0, v1, v2}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->f:Landroid/widget/TextView;

    const-string v1, "time_remaining"

    invoke-static {p0, v1}, Lcom/unity3d/plugin/downloader/a/m;->b(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    new-array v2, v4, [Ljava/lang/Object;

    iget-wide v3, p1, Lcom/unity3d/plugin/downloader/a/b;->c:J

    invoke-static {v3, v4}, Lcom/unity3d/plugin/downloader/a/m;->a(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {p0, v1, v2}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->a:Landroid/widget/ProgressBar;

    iget-wide v1, p1, Lcom/unity3d/plugin/downloader/a/b;->a:J

    shr-long/2addr v1, v6

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->a:Landroid/widget/ProgressBar;

    iget-wide v1, p1, Lcom/unity3d/plugin/downloader/a/b;->b:J

    shr-long/2addr v1, v6

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->d:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v2, p1, Lcom/unity3d/plugin/downloader/a/b;->b:J

    const-wide/16 v4, 0x64

    mul-long/2addr v2, v4

    iget-wide v4, p1, Lcom/unity3d/plugin/downloader/a/b;->a:J

    div-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->c:Landroid/widget/TextView;

    iget-wide v1, p1, Lcom/unity3d/plugin/downloader/a/b;->b:J

    iget-wide v3, p1, Lcom/unity3d/plugin/downloader/a/b;->a:J

    invoke-static {v1, v2, v3, v4}, Lcom/unity3d/plugin/downloader/a/m;->a(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->requestWindowFeature(I)Z

    :try_start_0
    invoke-virtual {p0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "unityplayer.Activity"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v0, 0x10200000

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v0, "android.intent.action.MAIN"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v0, 0x0

    const/high16 v2, 0x8000000

    invoke-static {p0, v0, v1, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    const-class v1, Lcom/unity3d/plugin/downloader/UnityDownloaderService;

    invoke-static {p0, v0, v1}, Lcom/unity3d/plugin/downloader/b/p;->a(Landroid/content/Context;Landroid/app/PendingIntent;Ljava/lang/Class;)I

    move-result v0

    if-eqz v0, :cond_0

    const-class v0, Lcom/unity3d/plugin/downloader/UnityDownloaderService;

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/d;->a(Lcom/unity3d/plugin/downloader/a/n;Ljava/lang/Class;)Lcom/unity3d/plugin/downloader/a/p;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->n:Lcom/unity3d/plugin/downloader/a/p;

    const-string v0, "main"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->c(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->setContentView(I)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-virtual {p0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v1, "bin/Data/splash.png"

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    const-string v0, "splashImage"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_0
    :try_start_2
    const-string v0, "progressBar"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->a:Landroid/widget/ProgressBar;

    const-string v0, "statusText"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->b:Landroid/widget/TextView;

    const-string v0, "progressAsFraction"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->c:Landroid/widget/TextView;

    const-string v0, "progressAsPercentage"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->d:Landroid/widget/TextView;

    const-string v0, "progressAverageSpeed"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->e:Landroid/widget/TextView;

    const-string v0, "progressTimeRemaining"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->f:Landroid/widget/TextView;

    const-string v0, "downloaderDashboard"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->g:Landroid/view/View;

    const-string v0, "approveCellular"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->h:Landroid/view/View;

    const-string v0, "pauseButton"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->i:Landroid/widget/Button;

    const-string v0, "wifiSettingsButton"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->j:Landroid/widget/Button;

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->i:Landroid/widget/Button;

    new-instance v1, Lcom/unity3d/plugin/downloader/a;

    invoke-direct {v1, p0}, Lcom/unity3d/plugin/downloader/a;-><init>(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->j:Landroid/widget/Button;

    new-instance v1, Lcom/unity3d/plugin/downloader/b;

    invoke-direct {v1, p0}, Lcom/unity3d/plugin/downloader/b;-><init>(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string v0, "resumeOverCellular"

    invoke-static {p0, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    new-instance v1, Lcom/unity3d/plugin/downloader/c;

    invoke-direct {v1, p0}, Lcom/unity3d/plugin/downloader/c;-><init>(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    :goto_1
    return-void

    :catch_0
    move-exception v0

    const-string v1, "OBB"

    const-string v2, "Cannot find own package! MAYDAY!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    :cond_0
    :goto_2
    invoke-virtual {p0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->finish()V

    goto :goto_1

    :catch_1
    move-exception v0

    const-string v1, "OBB"

    const-string v2, "Cannot find own package! MAYDAY!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_2

    :catch_2
    move-exception v0

    goto/16 :goto_0
.end method

.method protected onResume()V
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->n:Lcom/unity3d/plugin/downloader/a/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->n:Lcom/unity3d/plugin/downloader/a/p;

    invoke-interface {v0, p0}, Lcom/unity3d/plugin/downloader/a/p;->a(Landroid/content/Context;)V

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    return-void
.end method

.method protected onStop()V
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->n:Lcom/unity3d/plugin/downloader/a/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->n:Lcom/unity3d/plugin/downloader/a/p;

    invoke-interface {v0, p0}, Lcom/unity3d/plugin/downloader/a/p;->b(Landroid/content/Context;)V

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method
