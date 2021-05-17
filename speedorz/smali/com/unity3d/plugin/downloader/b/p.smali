.class public abstract Lcom/unity3d/plugin/downloader/b/p;
.super Lcom/unity3d/plugin/downloader/b/f;

# interfaces
.implements Lcom/unity3d/plugin/downloader/a/o;


# static fields
.field public static final ACTION_DOWNLOADS_CHANGED:Ljava/lang/String; = "downloadsChanged"

.field public static final ACTION_DOWNLOAD_COMPLETE:Ljava/lang/String; = "lvldownloader.intent.action.DOWNLOAD_COMPLETE"

.field public static final ACTION_DOWNLOAD_STATUS:Ljava/lang/String; = "lvldownloader.intent.action.DOWNLOAD_STATUS"

.field public static final CONTROL_PAUSED:I = 0x1

.field public static final CONTROL_RUN:I = 0x0

.field public static final DOWNLOAD_REQUIRED:I = 0x2

.field public static final EXTRA_FILE_NAME:Ljava/lang/String; = "downloadId"

.field public static final EXTRA_IS_WIFI_REQUIRED:Ljava/lang/String; = "isWifiRequired"

.field public static final EXTRA_MESSAGE_HANDLER:Ljava/lang/String; = "EMH"

.field public static final EXTRA_PACKAGE_NAME:Ljava/lang/String; = "EPN"

.field public static final EXTRA_PENDING_INTENT:Ljava/lang/String; = "EPI"

.field public static final EXTRA_STATUS_CURRENT_FILE_SIZE:Ljava/lang/String; = "CFS"

.field public static final EXTRA_STATUS_CURRENT_PROGRESS:Ljava/lang/String; = "CFP"

.field public static final EXTRA_STATUS_STATE:Ljava/lang/String; = "ESS"

.field public static final EXTRA_STATUS_TOTAL_PROGRESS:Ljava/lang/String; = "TFP"

.field public static final EXTRA_STATUS_TOTAL_SIZE:Ljava/lang/String; = "ETS"

.field private static final LOG_TAG:Ljava/lang/String; = "LVLDL"

.field public static final LVL_CHECK_REQUIRED:I = 0x1

.field public static final NETWORK_CANNOT_USE_ROAMING:I = 0x5

.field public static final NETWORK_MOBILE:I = 0x1

.field public static final NETWORK_NO_CONNECTION:I = 0x2

.field public static final NETWORK_OK:I = 0x1

.field public static final NETWORK_RECOMMENDED_UNUSABLE_DUE_TO_SIZE:I = 0x4

.field public static final NETWORK_TYPE_DISALLOWED_BY_REQUESTOR:I = 0x6

.field public static final NETWORK_UNUSABLE_DUE_TO_SIZE:I = 0x3

.field public static final NETWORK_WIFI:I = 0x2

.field public static final NO_DOWNLOAD_REQUIRED:I = 0x0

.field private static final SMOOTHING_FACTOR:F = 0.005f

.field public static final STATUS_CANCELED:I = 0x1ea

.field public static final STATUS_CANNOT_RESUME:I = 0x1e9

.field public static final STATUS_DEVICE_NOT_FOUND_ERROR:I = 0x1f3

.field public static final STATUS_FILE_ALREADY_EXISTS_ERROR:I = 0x1e8

.field public static final STATUS_FILE_DELIVERED_INCORRECTLY:I = 0x1e7

.field public static final STATUS_FILE_ERROR:I = 0x1ec

.field public static final STATUS_FORBIDDEN:I = 0x193

.field public static final STATUS_HTTP_DATA_ERROR:I = 0x1ef

.field public static final STATUS_HTTP_EXCEPTION:I = 0x1f0

.field public static final STATUS_INSUFFICIENT_SPACE_ERROR:I = 0x1f2

.field public static final STATUS_PAUSED_BY_APP:I = 0xc1

.field public static final STATUS_PENDING:I = 0xbe

.field public static final STATUS_QUEUED_FOR_WIFI:I = 0xc5

.field public static final STATUS_QUEUED_FOR_WIFI_OR_CELLULAR_PERMISSION:I = 0xc4

.field public static final STATUS_RUNNING:I = 0xc0

.field public static final STATUS_SUCCESS:I = 0xc8

.field public static final STATUS_TOO_MANY_REDIRECTS:I = 0x1f1

.field public static final STATUS_UNHANDLED_HTTP_CODE:I = 0x1ee

.field public static final STATUS_UNHANDLED_REDIRECT:I = 0x1ed

.field public static final STATUS_UNKNOWN_ERROR:I = 0x1eb

.field public static final STATUS_WAITING_FOR_NETWORK:I = 0xc3

.field public static final STATUS_WAITING_TO_RETRY:I = 0xc2

.field private static final TEMP_EXT:Ljava/lang/String; = ".tmp"

.field public static final VISIBILITY_HIDDEN:I = 0x2

.field public static final VISIBILITY_VISIBLE:I = 0x0

.field public static final VISIBILITY_VISIBLE_NOTIFY_COMPLETED:I = 0x1

.field private static sIsRunning:Z


# instance fields
.field private mAlarmIntent:Landroid/app/PendingIntent;

.field mAverageDownloadSpeed:F

.field mBytesAtSample:J

.field mBytesSoFar:J

.field private mClientMessenger:Landroid/os/Messenger;

.field private mConnReceiver:Landroid/content/BroadcastReceiver;

.field private mConnectivityManager:Landroid/net/ConnectivityManager;

.field private mControl:I

.field mFileCount:I

.field private mIsAtLeast3G:Z

.field private mIsAtLeast4G:Z

.field private mIsCellularConnection:Z

.field private mIsConnected:Z

.field private mIsFailover:Z

.field private mIsRoaming:Z

.field mMillisecondsAtSample:J

.field private mNotification:Lcom/unity3d/plugin/downloader/b/i;

.field private mPackageInfo:Landroid/content/pm/PackageInfo;

.field private mPendingIntent:Landroid/app/PendingIntent;

.field private final mServiceMessenger:Landroid/os/Messenger;

.field private final mServiceStub:Lcom/unity3d/plugin/downloader/a/p;

.field private mStateChanged:Z

.field private mStatus:I

.field mTotalLength:J

.field private mWifiManager:Landroid/net/wifi/WifiManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string v0, "LVLDownloadService"

    invoke-direct {p0, v0}, Lcom/unity3d/plugin/downloader/b/f;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/unity3d/plugin/downloader/a/i;->a(Lcom/unity3d/plugin/downloader/a/o;)Lcom/unity3d/plugin/downloader/a/p;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mServiceStub:Lcom/unity3d/plugin/downloader/a/p;

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mServiceStub:Lcom/unity3d/plugin/downloader/a/p;

    invoke-interface {v0}, Lcom/unity3d/plugin/downloader/a/p;->a()Landroid/os/Messenger;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mServiceMessenger:Landroid/os/Messenger;

    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/app/PendingIntent;Ljava/lang/Class;)I
    .locals 12

    const/4 v2, 0x2

    const/4 v1, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    invoke-static {p0}, Lcom/unity3d/plugin/downloader/b/u;->a(Landroid/content/Context;)Lcom/unity3d/plugin/downloader/b/u;

    move-result-object v5

    invoke-static {v5, v0}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/u;Landroid/content/pm/PackageInfo;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    :goto_0
    iget v6, v5, Lcom/unity3d/plugin/downloader/b/u;->g:I

    if-nez v6, :cond_2

    invoke-virtual {v5}, Lcom/unity3d/plugin/downloader/b/u;->b()[Lcom/unity3d/plugin/downloader/b/h;

    move-result-object v6

    if-eqz v6, :cond_0

    array-length v7, v6

    :goto_1
    if-ge v1, v7, :cond_0

    aget-object v8, v6, v1

    iget-object v9, v8, Lcom/unity3d/plugin/downloader/b/h;->c:Ljava/lang/String;

    iget-wide v10, v8, Lcom/unity3d/plugin/downloader/b/h;->e:J

    invoke-static {p0, v9, v10, v11}, Lcom/unity3d/plugin/downloader/a/m;->a(Landroid/content/Context;Ljava/lang/String;J)Z

    move-result v8

    if-nez v8, :cond_1

    invoke-virtual {v5}, Lcom/unity3d/plugin/downloader/b/u;->a()Z

    move v0, v2

    :cond_0
    :goto_2
    packed-switch v0, :pswitch_data_0

    :goto_3
    return v0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    move v0, v2

    goto :goto_2

    :pswitch_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "EPI"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_3

    :cond_3
    move v0, v1

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static a(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/Class;)I
    .locals 1

    const-string v0, "EPI"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    invoke-static {p0, v0, p2}, Lcom/unity3d/plugin/downloader/b/p;->a(Landroid/content/Context;Landroid/app/PendingIntent;Ljava/lang/Class;)I

    move-result v0

    return v0
.end method

.method static synthetic a(Lcom/unity3d/plugin/downloader/b/p;Landroid/app/PendingIntent;)Landroid/app/PendingIntent;
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/p;->mPendingIntent:Landroid/app/PendingIntent;

    return-object p1
.end method

.method static synthetic a(Lcom/unity3d/plugin/downloader/b/p;)Lcom/unity3d/plugin/downloader/b/i;
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mNotification:Lcom/unity3d/plugin/downloader/b/i;

    return-object v0
.end method

.method private a(II)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsCellularConnection:Z

    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast3G:Z

    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast4G:Z

    goto :goto_0

    :pswitch_2
    iput-boolean v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsCellularConnection:Z

    iput-boolean v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast3G:Z

    iput-boolean v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast4G:Z

    goto :goto_0

    :pswitch_3
    iput-boolean v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsCellularConnection:Z

    packed-switch p2, :pswitch_data_1

    :pswitch_4
    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsCellularConnection:Z

    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast3G:Z

    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast4G:Z

    goto :goto_0

    :pswitch_5
    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast3G:Z

    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast4G:Z

    goto :goto_0

    :pswitch_6
    iput-boolean v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast3G:Z

    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast4G:Z

    goto :goto_0

    :pswitch_7
    iput-boolean v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast3G:Z

    iput-boolean v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast4G:Z

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_5
        :pswitch_5
        :pswitch_6
        :pswitch_5
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_7
        :pswitch_7
        :pswitch_7
    .end packed-switch
.end method

.method private a(Landroid/content/Context;)V
    .locals 4

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/unity3d/plugin/downloader/b/s;

    iget-object v3, p0, Lcom/unity3d/plugin/downloader/b/p;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-direct {v2, p0, v0, v3}, Lcom/unity3d/plugin/downloader/b/s;-><init>(Lcom/unity3d/plugin/downloader/b/p;Landroid/content/Context;Landroid/app/PendingIntent;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic a(Z)V
    .locals 0

    invoke-static {p0}, Lcom/unity3d/plugin/downloader/b/p;->b(Z)V

    return-void
.end method

.method private static a(Lcom/unity3d/plugin/downloader/b/u;Landroid/content/pm/PackageInfo;)Z
    .locals 2

    iget v0, p0, Lcom/unity3d/plugin/downloader/b/u;->f:I

    iget v1, p1, Landroid/content/pm/PackageInfo;->versionCode:I

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic b(Lcom/unity3d/plugin/downloader/b/p;)Landroid/app/PendingIntent;
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mPendingIntent:Landroid/app/PendingIntent;

    return-object v0
.end method

.method private b(J)V
    .locals 6

    const/4 v5, 0x0

    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/b/p;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    if-nez v0, :cond_0

    const-string v0, "LVLDL"

    const-string v1, "couldn\'t get alarm manager"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/unity3d/plugin/downloader/b/p;->j()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.DOWNLOAD_WAKEUP"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v3, "EPI"

    iget-object v4, p0, Lcom/unity3d/plugin/downloader/b/p;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/unity3d/plugin/downloader/b/p;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {p0, v5, v2, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    iput-object v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mAlarmIntent:Landroid/app/PendingIntent;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    add-long/2addr v1, p1

    iget-object v3, p0, Lcom/unity3d/plugin/downloader/b/p;->mAlarmIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v5, v1, v2, v3}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto :goto_0
.end method

.method private static declared-synchronized b(Z)V
    .locals 2

    const-class v0, Lcom/unity3d/plugin/downloader/b/p;

    monitor-enter v0

    :try_start_0
    sput-boolean p0, Lcom/unity3d/plugin/downloader/b/p;->sIsRunning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static b(I)Z
    .locals 1

    const/16 v0, 0x190

    if-lt p0, v0, :cond_0

    const/16 v0, 0x258

    if-ge p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static c(I)Z
    .locals 1

    const/16 v0, 0xc8

    if-lt p0, v0, :cond_0

    const/16 v0, 0x12c

    if-lt p0, v0, :cond_1

    :cond_0
    const/16 v0, 0x190

    if-lt p0, v0, :cond_2

    const/16 v0, 0x258

    if-ge p0, v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic c(Lcom/unity3d/plugin/downloader/b/p;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mStateChanged:Z

    return v0
.end method

.method static synthetic m()Z
    .locals 1

    invoke-static {}, Lcom/unity3d/plugin/downloader/b/p;->n()Z

    move-result v0

    return v0
.end method

.method private static declared-synchronized n()Z
    .locals 2

    const-class v0, Lcom/unity3d/plugin/downloader/b/p;

    monitor-enter v0

    :try_start_0
    sget-boolean v1, Lcom/unity3d/plugin/downloader/b/p;->sIsRunning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private o()V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mAlarmIntent:Landroid/app/PendingIntent;

    if-eqz v0, :cond_0

    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/b/p;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    if-nez v0, :cond_1

    const-string v0, "LVLDL"

    const-string v1, "couldn\'t get alarm manager"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mAlarmIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mAlarmIntent:Landroid/app/PendingIntent;

    goto :goto_0
.end method


# virtual methods
.method public final a(Lcom/unity3d/plugin/downloader/b/u;)I
    .locals 3

    const/4 v0, 0x1

    iget-boolean v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsConnected:Z

    if-eqz v1, :cond_3

    iget-boolean v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsCellularConnection:Z

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget v1, p1, Lcom/unity3d/plugin/downloader/b/u;->h:I

    iget-boolean v2, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsRoaming:Z

    if-eqz v2, :cond_2

    const/4 v0, 0x5

    goto :goto_0

    :cond_2
    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_0

    const/4 v0, 0x6

    goto :goto_0

    :cond_3
    const/4 v0, 0x2

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/unity3d/plugin/downloader/a/m;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".tmp"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final a(Ljava/lang/String;J)Ljava/lang/String;
    .locals 4

    invoke-virtual {p0, p1}, Lcom/unity3d/plugin/downloader/b/p;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/unity3d/plugin/downloader/a/m;->a()Z

    move-result v2

    if-nez v2, :cond_0

    const-string v1, "LVLDL"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "External media not mounted: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/unity3d/plugin/downloader/b/q;

    const/16 v1, 0x1f3

    const-string v2, "external media is not yet mounted"

    invoke-direct {v0, v1, v2}, Lcom/unity3d/plugin/downloader/b/q;-><init>(ILjava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "LVLDL"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "File already exists: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/unity3d/plugin/downloader/b/q;

    const/16 v1, 0x1e8

    const-string v2, "requested destination file already exists"

    invoke-direct {v0, v1, v2}, Lcom/unity3d/plugin/downloader/b/q;-><init>(ILjava/lang/String;)V

    throw v0

    :cond_1
    invoke-static {v0}, Lcom/unity3d/plugin/downloader/a/m;->a(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/a/m;->a(Ljava/io/File;)J

    move-result-wide v1

    cmp-long v1, v1, p2

    if-gez v1, :cond_2

    new-instance v0, Lcom/unity3d/plugin/downloader/b/q;

    const/16 v1, 0x1f2

    const-string v2, "insufficient space on external storage"

    invoke-direct {v0, v1, v2}, Lcom/unity3d/plugin/downloader/b/q;-><init>(ILjava/lang/String;)V

    throw v0

    :cond_2
    return-object v0
.end method

.method public final a()V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mControl:I

    const/16 v0, 0x1ea

    iput v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mStatus:I

    return-void
.end method

.method public final a(I)V
    .locals 1

    invoke-static {p0}, Lcom/unity3d/plugin/downloader/b/u;->a(Landroid/content/Context;)Lcom/unity3d/plugin/downloader/b/u;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/unity3d/plugin/downloader/b/u;->a(I)Z

    return-void
.end method

.method public final a(J)V
    .locals 9

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    iget-wide v4, p0, Lcom/unity3d/plugin/downloader/b/p;->mMillisecondsAtSample:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    iget-wide v2, p0, Lcom/unity3d/plugin/downloader/b/p;->mMillisecondsAtSample:J

    sub-long v2, v0, v2

    iget-wide v4, p0, Lcom/unity3d/plugin/downloader/b/p;->mBytesAtSample:J

    sub-long v4, p1, v4

    long-to-float v4, v4

    long-to-float v2, v2

    div-float v2, v4, v2

    const/4 v3, 0x0

    iget v4, p0, Lcom/unity3d/plugin/downloader/b/p;->mAverageDownloadSpeed:F

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_0

    const v3, 0x3ba3d70a    # 0.005f

    mul-float/2addr v2, v3

    const v3, 0x3f7eb852    # 0.995f

    iget v4, p0, Lcom/unity3d/plugin/downloader/b/p;->mAverageDownloadSpeed:F

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    iput v2, p0, Lcom/unity3d/plugin/downloader/b/p;->mAverageDownloadSpeed:F

    :goto_0
    iget-wide v2, p0, Lcom/unity3d/plugin/downloader/b/p;->mTotalLength:J

    sub-long/2addr v2, p1

    long-to-float v2, v2

    iget v3, p0, Lcom/unity3d/plugin/downloader/b/p;->mAverageDownloadSpeed:F

    div-float/2addr v2, v3

    float-to-long v5, v2

    :goto_1
    iput-wide v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mMillisecondsAtSample:J

    iput-wide p1, p0, Lcom/unity3d/plugin/downloader/b/p;->mBytesAtSample:J

    iget-object v8, p0, Lcom/unity3d/plugin/downloader/b/p;->mNotification:Lcom/unity3d/plugin/downloader/b/i;

    new-instance v0, Lcom/unity3d/plugin/downloader/a/b;

    iget-wide v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mTotalLength:J

    iget v7, p0, Lcom/unity3d/plugin/downloader/b/p;->mAverageDownloadSpeed:F

    move-wide v3, p1

    invoke-direct/range {v0 .. v7}, Lcom/unity3d/plugin/downloader/a/b;-><init>(JJJF)V

    invoke-virtual {v8, v0}, Lcom/unity3d/plugin/downloader/b/i;->a(Lcom/unity3d/plugin/downloader/a/b;)V

    return-void

    :cond_0
    iput v2, p0, Lcom/unity3d/plugin/downloader/b/p;->mAverageDownloadSpeed:F

    goto :goto_0

    :cond_1
    const-wide/16 v5, -0x1

    goto :goto_1
.end method

.method protected final a(Landroid/content/Intent;)V
    .locals 14

    const/16 v13, 0xc8

    const/4 v2, 0x1

    const/4 v1, 0x0

    invoke-static {v2}, Lcom/unity3d/plugin/downloader/b/p;->b(Z)V

    :try_start_0
    invoke-static {p0}, Lcom/unity3d/plugin/downloader/b/u;->a(Landroid/content/Context;)Lcom/unity3d/plugin/downloader/b/u;

    move-result-object v3

    const-string v0, "EPI"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    if-eqz v0, :cond_0

    iget-object v4, p0, Lcom/unity3d/plugin/downloader/b/p;->mNotification:Lcom/unity3d/plugin/downloader/b/i;

    invoke-virtual {v4, v0}, Lcom/unity3d/plugin/downloader/b/i;->a(Landroid/app/PendingIntent;)V

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mPendingIntent:Landroid/app/PendingIntent;

    :goto_0
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mPackageInfo:Landroid/content/pm/PackageInfo;

    invoke-static {v3, v0}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/u;Landroid/content/pm/PackageInfo;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0, p0}, Lcom/unity3d/plugin/downloader/b/p;->a(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/b/p;->b(Z)V

    :goto_1
    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mPendingIntent:Landroid/app/PendingIntent;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mNotification:Lcom/unity3d/plugin/downloader/b/i;

    iget-object v4, p0, Lcom/unity3d/plugin/downloader/b/p;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v4}, Lcom/unity3d/plugin/downloader/b/i;->a(Landroid/app/PendingIntent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/b/p;->b(Z)V

    throw v0

    :cond_1
    :try_start_2
    const-string v0, "LVLDL"

    const-string v2, "Downloader started in bad state without notification intent."

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/b/p;->b(Z)V

    goto :goto_1

    :cond_2
    :try_start_3
    invoke-virtual {v3}, Lcom/unity3d/plugin/downloader/b/u;->b()[Lcom/unity3d/plugin/downloader/b/h;

    move-result-object v4

    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lcom/unity3d/plugin/downloader/b/p;->mBytesSoFar:J

    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lcom/unity3d/plugin/downloader/b/p;->mTotalLength:J

    array-length v0, v4

    iput v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mFileCount:I

    array-length v5, v4

    move v0, v1

    :goto_2
    if-ge v0, v5, :cond_4

    aget-object v6, v4, v0

    iget v7, v6, Lcom/unity3d/plugin/downloader/b/h;->h:I

    if-ne v7, v13, :cond_3

    iget-object v7, v6, Lcom/unity3d/plugin/downloader/b/h;->c:Ljava/lang/String;

    iget-wide v8, v6, Lcom/unity3d/plugin/downloader/b/h;->e:J

    invoke-static {p0, v7, v8, v9}, Lcom/unity3d/plugin/downloader/a/m;->a(Landroid/content/Context;Ljava/lang/String;J)Z

    move-result v7

    if-nez v7, :cond_3

    const/4 v7, 0x0

    iput v7, v6, Lcom/unity3d/plugin/downloader/b/h;->h:I

    const-wide/16 v7, 0x0

    iput-wide v7, v6, Lcom/unity3d/plugin/downloader/b/h;->f:J

    :cond_3
    iget-wide v7, p0, Lcom/unity3d/plugin/downloader/b/p;->mTotalLength:J

    iget-wide v9, v6, Lcom/unity3d/plugin/downloader/b/h;->e:J

    add-long/2addr v7, v9

    iput-wide v7, p0, Lcom/unity3d/plugin/downloader/b/p;->mTotalLength:J

    iget-wide v7, p0, Lcom/unity3d/plugin/downloader/b/p;->mBytesSoFar:J

    iget-wide v9, v6, Lcom/unity3d/plugin/downloader/b/h;->f:J

    add-long v6, v7, v9

    iput-wide v6, p0, Lcom/unity3d/plugin/downloader/b/p;->mBytesSoFar:J

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_4
    invoke-virtual {p0}, Lcom/unity3d/plugin/downloader/b/p;->g()V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mConnReceiver:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_5

    new-instance v0, Lcom/unity3d/plugin/downloader/b/r;

    invoke-direct {v0, p0, p0}, Lcom/unity3d/plugin/downloader/b/r;-><init>(Lcom/unity3d/plugin/downloader/b/p;Landroid/app/Service;)V

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mConnReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v5, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v5, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/unity3d/plugin/downloader/b/p;->mConnReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v5, v0}, Lcom/unity3d/plugin/downloader/b/p;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_5
    array-length v5, v4

    move v0, v1

    :goto_3
    if-ge v0, v5, :cond_9

    aget-object v6, v4, v0

    iget-wide v7, v6, Lcom/unity3d/plugin/downloader/b/h;->f:J

    iget v9, v6, Lcom/unity3d/plugin/downloader/b/h;->h:I

    if-eq v9, v13, :cond_6

    new-instance v9, Lcom/unity3d/plugin/downloader/b/k;

    iget-object v10, p0, Lcom/unity3d/plugin/downloader/b/p;->mNotification:Lcom/unity3d/plugin/downloader/b/i;

    invoke-direct {v9, v6, p0, v10}, Lcom/unity3d/plugin/downloader/b/k;-><init>(Lcom/unity3d/plugin/downloader/b/h;Lcom/unity3d/plugin/downloader/b/p;Lcom/unity3d/plugin/downloader/b/i;)V

    invoke-direct {p0}, Lcom/unity3d/plugin/downloader/b/p;->o()V

    const-wide/16 v10, 0x1388

    invoke-direct {p0, v10, v11}, Lcom/unity3d/plugin/downloader/b/p;->b(J)V

    invoke-virtual {v9}, Lcom/unity3d/plugin/downloader/b/k;->a()V

    invoke-direct {p0}, Lcom/unity3d/plugin/downloader/b/p;->o()V

    :cond_6
    invoke-virtual {v3, v6}, Lcom/unity3d/plugin/downloader/b/u;->c(Lcom/unity3d/plugin/downloader/b/h;)Z

    iget v9, v6, Lcom/unity3d/plugin/downloader/b/h;->h:I

    sparse-switch v9, :sswitch_data_0

    const/16 v0, 0x13

    move v2, v1

    :goto_4
    if-eqz v2, :cond_8

    const-wide/32 v2, 0xea60

    invoke-direct {p0, v2, v3}, Lcom/unity3d/plugin/downloader/b/p;->b(J)V

    :goto_5
    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/p;->mNotification:Lcom/unity3d/plugin/downloader/b/i;

    invoke-virtual {v2, v0}, Lcom/unity3d/plugin/downloader/b/i;->a(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/b/p;->b(Z)V

    goto/16 :goto_1

    :sswitch_0
    :try_start_4
    invoke-direct {p0, p0}, Lcom/unity3d/plugin/downloader/b/p;->a(Landroid/content/Context;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/b/p;->b(Z)V

    goto/16 :goto_1

    :sswitch_1
    :try_start_5
    iget-wide v9, p0, Lcom/unity3d/plugin/downloader/b/p;->mBytesSoFar:J

    iget-wide v11, v6, Lcom/unity3d/plugin/downloader/b/h;->f:J

    sub-long v6, v11, v7

    add-long/2addr v6, v9

    iput-wide v6, p0, Lcom/unity3d/plugin/downloader/b/p;->mBytesSoFar:J

    iget-object v6, p0, Lcom/unity3d/plugin/downloader/b/p;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget v6, v6, Landroid/content/pm/PackageInfo;->versionCode:I

    const/4 v7, 0x0

    invoke-virtual {v3, v6, v7}, Lcom/unity3d/plugin/downloader/b/u;->a(II)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :sswitch_2
    const/16 v0, 0xd

    const-wide/16 v4, 0x0

    iput-wide v4, v6, Lcom/unity3d/plugin/downloader/b/h;->f:J

    invoke-virtual {v3, v6}, Lcom/unity3d/plugin/downloader/b/u;->b(Lcom/unity3d/plugin/downloader/b/h;)Z

    goto :goto_4

    :sswitch_3
    const/4 v0, 0x7

    move v2, v1

    goto :goto_4

    :sswitch_4
    const/4 v0, 0x6

    goto :goto_4

    :sswitch_5
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mWifiManager:Landroid/net/wifi/WifiManager;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-nez v0, :cond_7

    const/16 v0, 0x8

    goto :goto_4

    :cond_7
    const/16 v0, 0x9

    goto :goto_4

    :sswitch_6
    const/16 v0, 0x12

    goto :goto_4

    :sswitch_7
    const/16 v0, 0x11

    goto :goto_4

    :sswitch_8
    const/16 v0, 0xe

    goto :goto_4

    :cond_8
    invoke-direct {p0}, Lcom/unity3d/plugin/downloader/b/p;->o()V

    goto :goto_5

    :cond_9
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mNotification:Lcom/unity3d/plugin/downloader/b/i;

    const/4 v2, 0x5

    invoke-virtual {v0, v2}, Lcom/unity3d/plugin/downloader/b/i;->a(I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/b/p;->b(Z)V

    goto/16 :goto_1

    nop

    :sswitch_data_0
    .sparse-switch
        0xc1 -> :sswitch_3
        0xc2 -> :sswitch_4
        0xc3 -> :sswitch_4
        0xc4 -> :sswitch_5
        0xc5 -> :sswitch_5
        0xc8 -> :sswitch_1
        0x193 -> :sswitch_0
        0x1e7 -> :sswitch_2
        0x1ea -> :sswitch_6
        0x1f2 -> :sswitch_7
        0x1f3 -> :sswitch_8
    .end sparse-switch
.end method

.method public final a(Landroid/os/Messenger;)V
    .locals 2

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/p;->mClientMessenger:Landroid/os/Messenger;

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mNotification:Lcom/unity3d/plugin/downloader/b/i;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mClientMessenger:Landroid/os/Messenger;

    invoke-virtual {v0, v1}, Lcom/unity3d/plugin/downloader/b/i;->b(Landroid/os/Messenger;)V

    return-void
.end method

.method public final a(Lcom/unity3d/plugin/downloader/b/u;Ljava/lang/String;J)Z
    .locals 3

    const/4 v0, 0x0

    invoke-virtual {p1, p2}, Lcom/unity3d/plugin/downloader/b/u;->a(Ljava/lang/String;)Lcom/unity3d/plugin/downloader/b/h;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, v1, Lcom/unity3d/plugin/downloader/b/h;->c:Ljava/lang/String;

    if-eqz v1, :cond_2

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-static {p0, v1}, Lcom/unity3d/plugin/downloader/a/m;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    :cond_2
    invoke-static {p0, p2, p3, p4}, Lcom/unity3d/plugin/downloader/a/m;->a(Landroid/content/Context;Ljava/lang/String;J)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public final b()V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mControl:I

    const/16 v0, 0xc1

    iput v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mStatus:I

    return-void
.end method

.method public final c()V
    .locals 3

    iget v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mControl:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mControl:I

    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "EPI"

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/p;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/b/p;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public final d()V
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mNotification:Lcom/unity3d/plugin/downloader/b/i;

    invoke-virtual {v0}, Lcom/unity3d/plugin/downloader/b/i;->a()V

    return-void
.end method

.method protected final e()Z
    .locals 1

    invoke-static {p0}, Lcom/unity3d/plugin/downloader/b/u;->a(Landroid/content/Context;)Lcom/unity3d/plugin/downloader/b/u;

    move-result-object v0

    iget v0, v0, Lcom/unity3d/plugin/downloader/b/u;->g:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final f()Z
    .locals 1

    iget-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsConnected:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsCellularConnection:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final g()V
    .locals 8

    const/4 v7, -0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mConnectivityManager:Landroid/net/ConnectivityManager;

    if-nez v0, :cond_0

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/b/p;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mConnectivityManager:Landroid/net/ConnectivityManager;

    :cond_0
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mWifiManager:Landroid/net/wifi/WifiManager;

    if-nez v0, :cond_1

    const-string v0, "wifi"

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/b/p;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mWifiManager:Landroid/net/wifi/WifiManager;

    :cond_1
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mConnectivityManager:Landroid/net/ConnectivityManager;

    if-nez v0, :cond_2

    const-string v0, "LVLDL"

    const-string v1, "couldn\'t get connectivity manager to poll network state"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    iget-boolean v2, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsConnected:Z

    iget-boolean v3, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsFailover:Z

    iget-boolean v4, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsCellularConnection:Z

    iget-boolean v5, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsRoaming:Z

    iget-boolean v6, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast3G:Z

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isRoaming()Z

    move-result v7

    iput-boolean v7, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsRoaming:Z

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isFailover()Z

    move-result v7

    iput-boolean v7, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsFailover:Z

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v7

    iput-boolean v7, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsConnected:Z

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v7

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v0

    invoke-direct {p0, v7, v0}, Lcom/unity3d/plugin/downloader/b/p;->a(II)V

    :goto_1
    iget-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mStateChanged:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsConnected:Z

    if-ne v2, v0, :cond_3

    iget-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsFailover:Z

    if-ne v3, v0, :cond_3

    iget-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsCellularConnection:Z

    if-ne v4, v0, :cond_3

    iget-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsRoaming:Z

    if-ne v5, v0, :cond_3

    iget-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsAtLeast3G:Z

    if-eq v6, v0, :cond_5

    :cond_3
    const/4 v0, 0x1

    :goto_2
    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mStateChanged:Z

    goto :goto_0

    :cond_4
    iput-boolean v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsRoaming:Z

    iput-boolean v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsFailover:Z

    iput-boolean v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mIsConnected:Z

    invoke-direct {p0, v7, v7}, Lcom/unity3d/plugin/downloader/b/p;->a(II)V

    goto :goto_1

    :cond_5
    move v0, v1

    goto :goto_2
.end method

.method public abstract h()Ljava/lang/String;
.end method

.method public abstract i()[B
.end method

.method public abstract j()Ljava/lang/String;
.end method

.method public final k()I
    .locals 1

    iget v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mControl:I

    return v0
.end method

.method public final l()I
    .locals 1

    iget v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mStatus:I

    return v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2

    const-string v0, "LVLDL"

    const-string v1, "Service Bound"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mServiceMessenger:Landroid/os/Messenger;

    invoke-virtual {v0}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    invoke-super {p0}, Lcom/unity3d/plugin/downloader/b/f;->onCreate()V

    :try_start_0
    invoke-virtual {p0}, Lcom/unity3d/plugin/downloader/b/p;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/unity3d/plugin/downloader/b/p;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mPackageInfo:Landroid/content/pm/PackageInfo;

    invoke-virtual {p0}, Lcom/unity3d/plugin/downloader/b/p;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    invoke-virtual {p0}, Lcom/unity3d/plugin/downloader/b/p;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v0

    new-instance v1, Lcom/unity3d/plugin/downloader/b/i;

    invoke-direct {v1, p0, v0}, Lcom/unity3d/plugin/downloader/b/i;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;)V

    iput-object v1, p0, Lcom/unity3d/plugin/downloader/b/p;->mNotification:Lcom/unity3d/plugin/downloader/b/i;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mConnReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mConnReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/unity3d/plugin/downloader/b/p;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mConnReceiver:Landroid/content/BroadcastReceiver;

    :cond_0
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/p;->mServiceStub:Lcom/unity3d/plugin/downloader/a/p;

    invoke-interface {v0, p0}, Lcom/unity3d/plugin/downloader/a/p;->b(Landroid/content/Context;)V

    invoke-super {p0}, Lcom/unity3d/plugin/downloader/b/f;->onDestroy()V

    return-void
.end method
