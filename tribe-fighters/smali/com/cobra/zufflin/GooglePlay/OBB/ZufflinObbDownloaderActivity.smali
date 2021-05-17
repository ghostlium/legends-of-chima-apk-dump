.class public Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;
.super Landroid/app/Activity;
.source "ZufflinObbDownloaderActivity.java"

# interfaces
.implements Lcom/google/android/vending/expansion/downloader/IDownloaderClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "LVLDownloader"


# instance fields
.field private mAverageSpeed:Landroid/widget/TextView;

.field private mCellMessage:Landroid/view/View;

.field private mDashboard:Landroid/view/View;

.field private mDownloaderClientStub:Lcom/google/android/vending/expansion/downloader/IStub;

.field private mPB:Landroid/widget/ProgressBar;

.field private mPauseButton:Landroid/widget/Button;

.field private mProgressFraction:Landroid/widget/TextView;

.field private mProgressPercent:Landroid/widget/TextView;

.field private mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

.field private mState:I

.field private mStatePaused:Z

.field private mStatusText:Landroid/widget/TextView;

.field private mTimeRemaining:Landroid/widget/TextView;

.field private mWiFiSettingsButton:Landroid/widget/Button;

.field xAPKS:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 120
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->xAPKS:Ljava/util/Vector;

    .line 50
    return-void
.end method

.method static synthetic access$0(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)Z
    .locals 1

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mStatePaused:Z

    return v0
.end method

.method static synthetic access$1(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    return-object v0
.end method

.method static synthetic access$2(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;Z)V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0, p1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->setButtonPausedState(Z)V

    return-void
.end method

.method static synthetic access$3(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)Landroid/view/View;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mCellMessage:Landroid/view/View;

    return-object v0
.end method

.method private doReturn(Z)V
    .locals 2
    .param p1, "b"    # Z

    .prologue
    .line 171
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 172
    .local v0, "returnIntent":Landroid/content/Intent;
    if-eqz p1, :cond_0

    const/4 v1, -0x1

    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->setResult(ILandroid/content/Intent;)V

    .line 173
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->finish()V

    .line 174
    return-void

    .line 172
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private initializeDownloadUI()V
    .locals 3

    .prologue
    .line 182
    const-class v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderService;

    invoke-static {p0, v1}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller;->CreateStub(Lcom/google/android/vending/expansion/downloader/IDownloaderClient;Ljava/lang/Class;)Lcom/google/android/vending/expansion/downloader/IStub;

    move-result-object v1

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mDownloaderClientStub:Lcom/google/android/vending/expansion/downloader/IStub;

    .line 183
    sget v1, Lcom/cobra/zufflin/R$layout;->main:I

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->setContentView(I)V

    .line 185
    sget v1, Lcom/cobra/zufflin/R$id;->progressBar:I

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mPB:Landroid/widget/ProgressBar;

    .line 186
    sget v1, Lcom/cobra/zufflin/R$id;->statusText:I

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mStatusText:Landroid/widget/TextView;

    .line 187
    sget v1, Lcom/cobra/zufflin/R$id;->progressAsFraction:I

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mProgressFraction:Landroid/widget/TextView;

    .line 188
    sget v1, Lcom/cobra/zufflin/R$id;->progressAsPercentage:I

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mProgressPercent:Landroid/widget/TextView;

    .line 189
    sget v1, Lcom/cobra/zufflin/R$id;->progressAverageSpeed:I

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mAverageSpeed:Landroid/widget/TextView;

    .line 190
    sget v1, Lcom/cobra/zufflin/R$id;->progressTimeRemaining:I

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mTimeRemaining:Landroid/widget/TextView;

    .line 191
    sget v1, Lcom/cobra/zufflin/R$id;->downloaderDashboard:I

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mDashboard:Landroid/view/View;

    .line 192
    sget v1, Lcom/cobra/zufflin/R$id;->approveCellular:I

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mCellMessage:Landroid/view/View;

    .line 193
    sget v1, Lcom/cobra/zufflin/R$id;->pauseButton:I

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mPauseButton:Landroid/widget/Button;

    .line 194
    sget v1, Lcom/cobra/zufflin/R$id;->wifiSettingsButton:I

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mWiFiSettingsButton:Landroid/widget/Button;

    .line 196
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mPauseButton:Landroid/widget/Button;

    new-instance v2, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$1;

    invoke-direct {v2, p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$1;-><init>(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 215
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mWiFiSettingsButton:Landroid/widget/Button;

    new-instance v2, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$2;

    invoke-direct {v2, p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$2;-><init>(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 225
    sget v1, Lcom/cobra/zufflin/R$id;->resumeOverCellular:I

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 226
    .local v0, "resumeOnCell":Landroid/widget/Button;
    new-instance v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$3;

    invoke-direct {v1, p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$3;-><init>(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 237
    return-void
.end method

.method private setButtonPausedState(Z)V
    .locals 2
    .param p1, "paused"    # Z

    .prologue
    .line 85
    iput-boolean p1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mStatePaused:Z

    .line 86
    if-eqz p1, :cond_0

    sget v0, Lcom/cobra/zufflin/R$string;->text_button_resume:I

    .line 87
    .local v0, "stringResourceID":I
    :goto_0
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(I)V

    .line 88
    return-void

    .line 86
    .end local v0    # "stringResourceID":I
    :cond_0
    sget v0, Lcom/cobra/zufflin/R$string;->text_button_pause:I

    goto :goto_0
.end method

.method private setState(I)V
    .locals 2
    .param p1, "newState"    # I

    .prologue
    .line 76
    iget v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mState:I

    if-eq v0, p1, :cond_0

    .line 78
    iput p1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mState:I

    .line 79
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mStatusText:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloaderStringResourceIDFromState(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 81
    :cond_0
    return-void
.end method

.method private showError()V
    .locals 0

    .prologue
    .line 468
    return-void
.end method


# virtual methods
.method expansionFilesDelivered()Z
    .locals 7

    .prologue
    const/4 v2, 0x0

    .line 135
    iget-object v3, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->xAPKS:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 141
    const/4 v2, 0x1

    :goto_0
    return v2

    .line 135
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;

    .line 137
    .local v1, "xf":Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v4

    iget-boolean v5, v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;->mIsMain:Z

    iget v6, v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;->mFileVersion:I

    invoke-static {v4, v5, v6}, Lcom/google/android/vending/expansion/downloader/Helpers;->getExpansionAPKFileName(Landroid/content/Context;ZI)Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, "fileName":Ljava/lang/String;
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v4

    iget-wide v5, v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;->mFileSize:J

    invoke-static {v4, v0, v5, v6, v2}, Lcom/google/android/vending/expansion/downloader/Helpers;->doesFileExist(Landroid/content/Context;Ljava/lang/String;JZ)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 17
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 247
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 249
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/cobra/zufflin/ZufflinActivity;->getObbFiles()Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 255
    invoke-virtual/range {p0 .. p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->expansionFilesDelivered()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 257
    const/4 v1, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->doReturn(Z)V

    .line 318
    :goto_1
    return-void

    .line 249
    :cond_0
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/cobra/zufflin/OBBFileInfo;

    .line 251
    .local v10, "fi":Lcom/cobra/zufflin/OBBFileInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->xAPKS:Ljava/util/Vector;

    move-object/from16 v16, v0

    new-instance v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;

    const/4 v2, 0x1

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/cobra/zufflin/ZufflinActivity;->getVersionCode()I

    move-result v3

    invoke-virtual {v10}, Lcom/cobra/zufflin/OBBFileInfo;->getFileLength()J

    move-result-wide v4

    invoke-virtual {v10}, Lcom/cobra/zufflin/OBBFileInfo;->getCRC()J

    move-result-wide v6

    invoke-direct/range {v1 .. v7}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;-><init>(ZIJJ)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 264
    .end local v10    # "fi":Lcom/cobra/zufflin/OBBFileInfo;
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->initializeDownloadUI()V

    .line 271
    invoke-virtual/range {p0 .. p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->expansionFilesDelivered()Z

    move-result v1

    if-nez v1, :cond_5

    .line 276
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->getIntent()Landroid/content/Intent;

    move-result-object v12

    .line 277
    .local v12, "launchIntent":Landroid/content/Intent;
    new-instance v11, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v11, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 278
    .local v11, "intentToLaunchThisActivityFromNotification":Landroid/content/Intent;
    const/high16 v1, 0x14000000

    invoke-virtual {v11, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 279
    invoke-virtual {v12}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 281
    invoke-virtual {v12}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 283
    invoke-virtual {v12}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3

    .line 291
    :cond_2
    const/4 v1, 0x0

    const/high16 v2, 0x8000000

    move-object/from16 v0, p0

    invoke-static {v0, v1, v11, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v13

    .line 293
    .local v13, "pendingIntent":Landroid/app/PendingIntent;
    const-class v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderService;

    move-object/from16 v0, p0

    invoke-static {v0, v13, v1}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller;->startDownloadServiceIfRequired(Landroid/content/Context;Landroid/app/PendingIntent;Ljava/lang/Class;)I

    move-result v14

    .line 295
    .local v14, "startResult":I
    if-eqz v14, :cond_4

    .line 299
    invoke-direct/range {p0 .. p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->initializeDownloadUI()V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 306
    .end local v11    # "intentToLaunchThisActivityFromNotification":Landroid/content/Intent;
    .end local v12    # "launchIntent":Landroid/content/Intent;
    .end local v13    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v14    # "startResult":I
    :catch_0
    move-exception v9

    .line 308
    .local v9, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v1, "LVLDownloader"

    const-string v2, "Cannot find own package! MAYDAY!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    invoke-virtual {v9}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto/16 :goto_1

    .line 283
    .end local v9    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v11    # "intentToLaunchThisActivityFromNotification":Landroid/content/Intent;
    .restart local v12    # "launchIntent":Landroid/content/Intent;
    :cond_3
    :try_start_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 285
    .local v8, "category":Ljava/lang/String;
    invoke-virtual {v11, v8}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    .line 304
    .end local v8    # "category":Ljava/lang/String;
    .restart local v13    # "pendingIntent":Landroid/app/PendingIntent;
    .restart local v14    # "startResult":I
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->validateXAPKZipFiles()V
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 315
    .end local v11    # "intentToLaunchThisActivityFromNotification":Landroid/content/Intent;
    .end local v12    # "launchIntent":Landroid/content/Intent;
    .end local v13    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v14    # "startResult":I
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->validateXAPKZipFiles()V

    goto/16 :goto_1
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 463
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 464
    return-void
.end method

.method public onDownloadProgress(Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;)V
    .locals 7
    .param p1, "progress"    # Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;

    .prologue
    const/16 v6, 0x8

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 450
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mAverageSpeed:Landroid/widget/TextView;

    sget v1, Lcom/cobra/zufflin/R$string;->kilobytes_per_second:I

    new-array v2, v4, [Ljava/lang/Object;

    iget v3, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mCurrentSpeed:F

    invoke-static {v3}, Lcom/google/android/vending/expansion/downloader/Helpers;->getSpeedString(F)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {p0, v1, v2}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 451
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mTimeRemaining:Landroid/widget/TextView;

    sget v1, Lcom/cobra/zufflin/R$string;->time_remaining:I

    new-array v2, v4, [Ljava/lang/Object;

    iget-wide v3, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mTimeRemaining:J

    invoke-static {v3, v4}, Lcom/google/android/vending/expansion/downloader/Helpers;->getTimeRemaining(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {p0, v1, v2}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 453
    iget-wide v0, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    iput-wide v0, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    .line 454
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mPB:Landroid/widget/ProgressBar;

    iget-wide v1, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    shr-long/2addr v1, v6

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 455
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mPB:Landroid/widget/ProgressBar;

    iget-wide v1, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallProgress:J

    shr-long/2addr v1, v6

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 456
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mProgressPercent:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    iget-wide v2, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallProgress:J

    const-wide/16 v4, 0x64

    mul-long/2addr v2, v4

    iget-wide v4, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    div-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 457
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mProgressFraction:Landroid/widget/TextView;

    iget-wide v1, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallProgress:J

    iget-wide v3, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    invoke-static {v1, v2, v3, v4}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloadProgressString(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 458
    return-void
.end method

.method public onDownloadStateChanged(I)V
    .locals 9
    .param p1, "newState"    # I

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x0

    .line 367
    invoke-direct {p0, p1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->setState(I)V

    .line 368
    const/4 v5, 0x1

    .line 369
    .local v5, "showDashboard":Z
    const/4 v4, 0x0

    .line 372
    .local v4, "showCellMessage":Z
    packed-switch p1, :pswitch_data_0

    .line 424
    :pswitch_0
    const/4 v3, 0x1

    .line 425
    .local v3, "paused":Z
    const/4 v1, 0x1

    .line 426
    .local v1, "indeterminate":Z
    const/4 v5, 0x1

    .line 428
    :goto_0
    if-eqz v5, :cond_2

    move v2, v6

    .line 429
    .local v2, "newDashboardVisibility":I
    :goto_1
    iget-object v8, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mDashboard:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v8

    if-eq v8, v2, :cond_0

    .line 431
    iget-object v8, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mDashboard:Landroid/view/View;

    invoke-virtual {v8, v2}, Landroid/view/View;->setVisibility(I)V

    .line 433
    :cond_0
    if-eqz v4, :cond_3

    move v0, v6

    .line 434
    .local v0, "cellMessageVisibility":I
    :goto_2
    iget-object v6, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mCellMessage:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-eq v6, v0, :cond_1

    .line 436
    iget-object v6, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mCellMessage:Landroid/view/View;

    invoke-virtual {v6, v0}, Landroid/view/View;->setVisibility(I)V

    .line 439
    :cond_1
    iget-object v6, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mPB:Landroid/widget/ProgressBar;

    invoke-virtual {v6, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 440
    invoke-direct {p0, v3}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->setButtonPausedState(Z)V

    .line 441
    .end local v0    # "cellMessageVisibility":I
    .end local v2    # "newDashboardVisibility":I
    :goto_3
    return-void

    .line 377
    .end local v1    # "indeterminate":Z
    .end local v3    # "paused":Z
    :pswitch_1
    const/4 v3, 0x0

    .line 378
    .restart local v3    # "paused":Z
    const/4 v1, 0x1

    .line 379
    .restart local v1    # "indeterminate":Z
    goto :goto_0

    .line 382
    .end local v1    # "indeterminate":Z
    .end local v3    # "paused":Z
    :pswitch_2
    const/4 v5, 0x1

    .line 383
    const/4 v3, 0x0

    .line 384
    .restart local v3    # "paused":Z
    const/4 v1, 0x1

    .line 385
    .restart local v1    # "indeterminate":Z
    goto :goto_0

    .line 387
    .end local v1    # "indeterminate":Z
    .end local v3    # "paused":Z
    :pswitch_3
    const/4 v3, 0x0

    .line 388
    .restart local v3    # "paused":Z
    const/4 v5, 0x1

    .line 389
    const/4 v1, 0x0

    .line 390
    .restart local v1    # "indeterminate":Z
    goto :goto_0

    .line 396
    .end local v1    # "indeterminate":Z
    .end local v3    # "paused":Z
    :pswitch_4
    const/4 v3, 0x1

    .line 397
    .restart local v3    # "paused":Z
    const/4 v5, 0x0

    .line 398
    const/4 v1, 0x0

    .line 399
    .restart local v1    # "indeterminate":Z
    goto :goto_0

    .line 402
    .end local v1    # "indeterminate":Z
    .end local v3    # "paused":Z
    :pswitch_5
    const/4 v5, 0x0

    .line 403
    const/4 v3, 0x1

    .line 404
    .restart local v3    # "paused":Z
    const/4 v1, 0x0

    .line 405
    .restart local v1    # "indeterminate":Z
    const/4 v4, 0x1

    .line 406
    goto :goto_0

    .line 409
    .end local v1    # "indeterminate":Z
    .end local v3    # "paused":Z
    :pswitch_6
    const/4 v3, 0x1

    .line 410
    .restart local v3    # "paused":Z
    const/4 v1, 0x0

    .line 411
    .restart local v1    # "indeterminate":Z
    goto :goto_0

    .line 414
    .end local v1    # "indeterminate":Z
    .end local v3    # "paused":Z
    :pswitch_7
    const/4 v3, 0x1

    .line 415
    .restart local v3    # "paused":Z
    const/4 v1, 0x0

    .line 416
    .restart local v1    # "indeterminate":Z
    goto :goto_0

    .line 418
    .end local v1    # "indeterminate":Z
    .end local v3    # "paused":Z
    :pswitch_8
    const/4 v5, 0x0

    .line 419
    const/4 v3, 0x0

    .line 420
    .restart local v3    # "paused":Z
    const/4 v1, 0x0

    .line 421
    .restart local v1    # "indeterminate":Z
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->validateXAPKZipFiles()V

    goto :goto_3

    :cond_2
    move v2, v7

    .line 428
    goto :goto_1

    .restart local v2    # "newDashboardVisibility":I
    :cond_3
    move v0, v7

    .line 433
    goto :goto_2

    .line 372
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

.method public onServiceConnected(Landroid/os/Messenger;)V
    .locals 2
    .param p1, "m"    # Landroid/os/Messenger;

    .prologue
    .line 355
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller;->CreateProxy(Landroid/os/Messenger;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    .line 356
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mDownloaderClientStub:Lcom/google/android/vending/expansion/downloader/IStub;

    invoke-interface {v1}, Lcom/google/android/vending/expansion/downloader/IStub;->getMessenger()Landroid/os/Messenger;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/vending/expansion/downloader/IDownloaderService;->onClientUpdated(Landroid/os/Messenger;)V

    .line 357
    return-void
.end method

.method protected onStart()V
    .locals 1

    .prologue
    .line 326
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mDownloaderClientStub:Lcom/google/android/vending/expansion/downloader/IStub;

    if-eqz v0, :cond_0

    .line 328
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mDownloaderClientStub:Lcom/google/android/vending/expansion/downloader/IStub;

    invoke-interface {v0, p0}, Lcom/google/android/vending/expansion/downloader/IStub;->connect(Landroid/content/Context;)V

    .line 330
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 331
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 339
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mDownloaderClientStub:Lcom/google/android/vending/expansion/downloader/IStub;

    if-eqz v0, :cond_0

    .line 341
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->mDownloaderClientStub:Lcom/google/android/vending/expansion/downloader/IStub;

    invoke-interface {v0, p0}, Lcom/google/android/vending/expansion/downloader/IStub;->disconnect(Landroid/content/Context;)V

    .line 343
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 344
    return-void
.end method

.method validateXAPKZipFiles()V
    .locals 7

    .prologue
    .line 152
    iget-object v2, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->xAPKS:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 165
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->doReturn(Z)V

    .line 166
    :goto_1
    return-void

    .line 152
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;

    .line 154
    .local v1, "xf":Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v3

    iget-boolean v4, v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;->mIsMain:Z

    iget v5, v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;->mFileVersion:I

    invoke-static {v3, v4, v5}, Lcom/google/android/vending/expansion/downloader/Helpers;->getExpansionAPKFileName(Landroid/content/Context;ZI)Ljava/lang/String;

    move-result-object v0

    .line 155
    .local v0, "fileName":Ljava/lang/String;
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v3

    iget-wide v4, v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;->mFileSize:J

    const/4 v6, 0x0

    invoke-static {v3, v0, v4, v5, v6}, Lcom/google/android/vending/expansion/downloader/Helpers;->doesFileExist(Landroid/content/Context;Ljava/lang/String;JZ)Z

    move-result v3

    if-nez v3, :cond_1

    .line 157
    invoke-direct {p0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->showError()V

    goto :goto_1

    .line 160
    :cond_1
    iget-wide v3, v1, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;->mFileCRC:J

    goto :goto_0
.end method
