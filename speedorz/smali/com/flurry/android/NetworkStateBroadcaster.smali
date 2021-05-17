.class public Lcom/flurry/android/NetworkStateBroadcaster;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# instance fields
.field private gI:Z

.field private gJ:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/flurry/android/NetworkStateListener;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/NetworkStateListener;)V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 39
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/flurry/android/NetworkStateBroadcaster;->gJ:Ljava/lang/ref/WeakReference;

    .line 40
    iput-object p1, p0, Lcom/flurry/android/NetworkStateBroadcaster;->mContext:Landroid/content/Context;

    .line 41
    invoke-static {p1}, Lcom/flurry/android/NetworkStateBroadcaster;->u(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/android/NetworkStateBroadcaster;->gI:Z

    .line 42
    return-void
.end method

.method private static u(Landroid/content/Context;)Z
    .locals 1

    .prologue
    .line 68
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 70
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 71
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public isNetworkEnabled()Z
    .locals 1

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/flurry/android/NetworkStateBroadcaster;->gI:Z

    return v0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .prologue
    .line 59
    invoke-static {p1}, Lcom/flurry/android/NetworkStateBroadcaster;->u(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/android/NetworkStateBroadcaster;->gI:Z

    .line 60
    iget-object v0, p0, Lcom/flurry/android/NetworkStateBroadcaster;->gJ:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/NetworkStateListener;

    .line 61
    if-nez v0, :cond_0

    .line 65
    :goto_0
    return-void

    .line 64
    :cond_0
    iget-boolean v1, p0, Lcom/flurry/android/NetworkStateBroadcaster;->gI:Z

    invoke-interface {v0, v1}, Lcom/flurry/android/NetworkStateListener;->onNetworkStateChanged(Z)V

    goto :goto_0
.end method

.method public register()V
    .locals 3

    .prologue
    .line 49
    iget-object v0, p0, Lcom/flurry/android/NetworkStateBroadcaster;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/flurry/android/NetworkStateBroadcaster;->u(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/android/NetworkStateBroadcaster;->gI:Z

    .line 50
    iget-object v0, p0, Lcom/flurry/android/NetworkStateBroadcaster;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 51
    return-void
.end method

.method public unregister()V
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/flurry/android/NetworkStateBroadcaster;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 55
    return-void
.end method
