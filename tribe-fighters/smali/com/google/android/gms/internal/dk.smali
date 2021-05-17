.class public abstract Lcom/google/android/gms/internal/dk;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/GooglePlayServicesClient;
.implements Lcom/google/android/gms/common/api/Api$a;
.implements Lcom/google/android/gms/internal/dl$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/dk$d;,
        Lcom/google/android/gms/internal/dk$f;,
        Lcom/google/android/gms/internal/dk$c;,
        Lcom/google/android/gms/internal/dk$b;,
        Lcom/google/android/gms/internal/dk$a;,
        Lcom/google/android/gms/internal/dk$e;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Landroid/os/IInterface;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/GooglePlayServicesClient;",
        "Lcom/google/android/gms/common/api/Api$a;",
        "Lcom/google/android/gms/internal/dl$b;"
    }
.end annotation


# static fields
.field public static final mG:[Ljava/lang/String;


# instance fields
.field private final jC:[Ljava/lang/String;

.field private final kB:Lcom/google/android/gms/internal/dl;

.field private mA:Landroid/os/IInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final mB:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/internal/dk",
            "<TT;>.b<*>;>;"
        }
    .end annotation
.end field

.field private mC:Lcom/google/android/gms/internal/dk$e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/dk",
            "<TT;>.e;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field mD:Z

.field mE:Z

.field private final mF:Ljava/lang/Object;

.field final mHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "service_esmobile"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "service_googleme"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gms/internal/dk;->mG:[Ljava/lang/String;

    return-void
.end method

.method protected varargs constructor <init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;[Ljava/lang/String;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/dk;->mB:Ljava/util/ArrayList;

    iput-boolean v1, p0, Lcom/google/android/gms/internal/dk;->mD:Z

    iput-boolean v1, p0, Lcom/google/android/gms/internal/dk;->mE:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/dk;->mF:Ljava/lang/Object;

    invoke-static {p1}, Lcom/google/android/gms/internal/du;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    iput-object v0, p0, Lcom/google/android/gms/internal/dk;->mContext:Landroid/content/Context;

    new-instance v0, Lcom/google/android/gms/internal/dl;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p0, v1}, Lcom/google/android/gms/internal/dl;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/dl$b;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/dk;->kB:Lcom/google/android/gms/internal/dl;

    new-instance v0, Lcom/google/android/gms/internal/dk$a;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/dk$a;-><init>(Lcom/google/android/gms/internal/dk;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/dk;->mHandler:Landroid/os/Handler;

    invoke-virtual {p0, p4}, Lcom/google/android/gms/internal/dk;->a([Ljava/lang/String;)V

    iput-object p4, p0, Lcom/google/android/gms/internal/dk;->jC:[Ljava/lang/String;

    invoke-static {p2}, Lcom/google/android/gms/internal/du;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dk;->registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    invoke-static {p3}, Lcom/google/android/gms/internal/du;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dk;->registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/dk;Landroid/os/IInterface;)Landroid/os/IInterface;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dk;->mA:Landroid/os/IInterface;

    return-object p1
.end method

.method static synthetic a(Lcom/google/android/gms/internal/dk;Lcom/google/android/gms/internal/dk$e;)Lcom/google/android/gms/internal/dk$e;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dk;->mC:Lcom/google/android/gms/internal/dk$e;

    return-object p1
.end method

.method static synthetic a(Lcom/google/android/gms/internal/dk;)Lcom/google/android/gms/internal/dl;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->kB:Lcom/google/android/gms/internal/dl;

    return-object v0
.end method

.method static synthetic b(Lcom/google/android/gms/internal/dk;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mF:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic c(Lcom/google/android/gms/internal/dk;)Ljava/util/ArrayList;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mB:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic d(Lcom/google/android/gms/internal/dk;)Landroid/os/IInterface;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mA:Landroid/os/IInterface;

    return-object v0
.end method

.method static synthetic e(Lcom/google/android/gms/internal/dk;)Lcom/google/android/gms/internal/dk$e;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mC:Lcom/google/android/gms/internal/dk$e;

    return-object v0
.end method

.method static synthetic f(Lcom/google/android/gms/internal/dk;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method protected a(ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x1

    new-instance v3, Lcom/google/android/gms/internal/dk$f;

    invoke-direct {v3, p0, p1, p2, p3}, Lcom/google/android/gms/internal/dk$f;-><init>(Lcom/google/android/gms/internal/dk;ILandroid/os/IBinder;Landroid/os/Bundle;)V

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public final a(Lcom/google/android/gms/internal/dk$b;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/dk",
            "<TT;>.b<*>;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->mB:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mB:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected abstract a(Lcom/google/android/gms/internal/dq;Lcom/google/android/gms/internal/dk$d;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method protected varargs a([Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method protected abstract am()Ljava/lang/String;
.end method

.method protected abstract an()Ljava/lang/String;
.end method

.method public final bA()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->jC:[Ljava/lang/String;

    return-object v0
.end method

.method protected final bB()V
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected. Call connect() and wait for onConnected() to be called."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method protected final bC()Landroid/os/IInterface;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->bB()V

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mA:Landroid/os/IInterface;

    return-object v0
.end method

.method public bb()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/dk;->mD:Z

    return v0
.end method

.method public bc()Landroid/os/Bundle;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public connect()V
    .locals 4

    const/4 v3, 0x3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dk;->mD:Z

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->mF:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/google/android/gms/internal/dk;->mE:Z

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->mHandler:Landroid/os/Handler;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    :goto_0
    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mC:Lcom/google/android/gms/internal/dk$e;

    if-eqz v0, :cond_2

    const-string v0, "GmsClient"

    const-string v1, "Calling connect() while still connected, missing disconnect()."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/dk;->mA:Landroid/os/IInterface;

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/dm;->s(Landroid/content/Context;)Lcom/google/android/gms/internal/dm;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->am()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->mC:Lcom/google/android/gms/internal/dk$e;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/dm;->b(Ljava/lang/String;Lcom/google/android/gms/internal/dk$e;)V

    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/dk$e;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/dk$e;-><init>(Lcom/google/android/gms/internal/dk;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/dk;->mC:Lcom/google/android/gms/internal/dk$e;

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/dm;->s(Landroid/content/Context;)Lcom/google/android/gms/internal/dm;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->am()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->mC:Lcom/google/android/gms/internal/dk$e;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/dm;->a(Ljava/lang/String;Lcom/google/android/gms/internal/dk$e;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "GmsClient"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unable to connect to service: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->am()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method public disconnect()V
    .locals 5

    const/4 v4, 0x0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dk;->mD:Z

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->mF:Ljava/lang/Object;

    monitor-enter v1

    const/4 v2, 0x0

    :try_start_0
    iput-boolean v2, p0, Lcom/google/android/gms/internal/dk;->mE:Z

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->mB:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->mB:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v1, v0

    :goto_0
    if-ge v1, v3, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mB:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/dk$b;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dk$b;->bE()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_0
    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mB:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    iput-object v4, p0, Lcom/google/android/gms/internal/dk;->mA:Landroid/os/IInterface;

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mC:Lcom/google/android/gms/internal/dk$e;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/dm;->s(Landroid/content/Context;)Lcom/google/android/gms/internal/dm;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->am()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->mC:Lcom/google/android/gms/internal/dk$e;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/dm;->b(Ljava/lang/String;Lcom/google/android/gms/internal/dk$e;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/dk;->mC:Lcom/google/android/gms/internal/dk$e;

    :cond_1
    return-void

    :catchall_1
    move-exception v0

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0
.end method

.method public final getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public isConnected()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->mA:Landroid/os/IInterface;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isConnecting()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->mF:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/dk;->mE:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/dk;, "Lcom/google/android/gms/internal/dk<TT;>;"
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z

    move-result v0

    return v0
.end method

.method public isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)Z
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/dk;, "Lcom/google/android/gms/internal/dk<TT;>;"
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)Z

    move-result v0

    return v0
.end method

.method protected abstract p(Landroid/os/IBinder;)Landroid/os/IInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/IBinder;",
            ")TT;"
        }
    .end annotation
.end method

.method public registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/dk;, "Lcom/google/android/gms/internal/dk<TT;>;"
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    return-void
.end method

.method public registerConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/dk;, "Lcom/google/android/gms/internal/dk<TT;>;"
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    return-void
.end method

.method public registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/dk;, "Lcom/google/android/gms/internal/dk<TT;>;"
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    return-void
.end method

.method public registerConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/dk;, "Lcom/google/android/gms/internal/dk<TT;>;"
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    return-void
.end method

.method protected final u(Landroid/os/IBinder;)V
    .locals 2

    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/internal/dq$a;->w(Landroid/os/IBinder;)Lcom/google/android/gms/internal/dq;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/dk$d;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/dk$d;-><init>(Lcom/google/android/gms/internal/dk;)V

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/dk;->a(Lcom/google/android/gms/internal/dq;Lcom/google/android/gms/internal/dk$d;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GmsClient"

    const-string v1, "service died"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/dk;, "Lcom/google/android/gms/internal/dk<TT;>;"
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    return-void
.end method

.method public unregisterConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/dk;, "Lcom/google/android/gms/internal/dk<TT;>;"
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->unregisterConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    return-void
.end method
