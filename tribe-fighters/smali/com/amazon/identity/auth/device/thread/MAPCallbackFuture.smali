.class public Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;
.super Ljava/lang/Object;
.source "MAPCallbackFuture.java"

# interfaces
.implements Ljava/util/concurrent/Future;
.implements Lcom/amazon/identity/auth/device/shared/APIListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Future",
        "<",
        "Landroid/os/Bundle;",
        ">;",
        "Lcom/amazon/identity/auth/device/shared/APIListener;"
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String;

.field private static final MAIN_THREAD_ERROR_MSG:Ljava/lang/String; = "Cannot call get on the main thread, unless you want ANRs"


# instance fields
.field protected mError:Lcom/amazon/identity/auth/device/AuthError;

.field protected final mLatch:Ljava/util/concurrent/CountDownLatch;

.field protected final mListener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

.field protected mSuccessResult:Landroid/os/Bundle;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;-><init>(Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    if-nez p1, :cond_0

    new-instance p1, Lcom/amazon/identity/auth/device/thread/DefaultAuthorizationListener;

    .end local p1    # "listener":Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;
    invoke-direct {p1}, Lcom/amazon/identity/auth/device/thread/DefaultAuthorizationListener;-><init>()V

    :cond_0
    iput-object p1, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mListener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    .line 38
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mLatch:Ljava/util/concurrent/CountDownLatch;

    .line 39
    return-void
.end method

.method private throwOnMainThread()V
    .locals 2

    .prologue
    .line 111
    invoke-static {}, Lcom/amazon/identity/auth/device/thread/ThreadUtils;->isRunningOnMainThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 113
    sget-object v0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Cannot call get on the main thread, unless you want ANRs"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call get on the main thread, unless you want ANRs"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 117
    :cond_0
    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 1
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 44
    const/4 v0, 0x0

    return v0
.end method

.method public get()Landroid/os/Bundle;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->throwOnMainThread()V

    .line 51
    sget-object v0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Running get on Future"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    iget-object v0, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 53
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->getResultHelper()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Landroid/os/Bundle;
    .locals 3
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->throwOnMainThread()V

    .line 61
    sget-object v0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Running get on Future with timeout="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "unit="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p3}, Ljava/util/concurrent/TimeUnit;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    iget-object v0, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    .line 63
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->getResultHelper()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 18
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->get()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # J
    .param p3, "x1"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 18
    invoke-virtual {p0, p1, p2, p3}, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->get(JLjava/util/concurrent/TimeUnit;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method protected getResultHelper()Landroid/os/Bundle;
    .locals 3

    .prologue
    .line 100
    iget-object v1, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mError:Lcom/amazon/identity/auth/device/AuthError;

    if-eqz v1, :cond_0

    .line 102
    iget-object v1, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mError:Lcom/amazon/identity/auth/device/AuthError;

    invoke-static {v1}, Lcom/amazon/identity/auth/device/AuthError;->getErrorBundle(Lcom/amazon/identity/auth/device/AuthError;)Landroid/os/Bundle;

    move-result-object v0

    .line 103
    .local v0, "authErrorBundle":Landroid/os/Bundle;
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->FUTURE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v1, v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;->ERROR:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 106
    .end local v0    # "authErrorBundle":Landroid/os/Bundle;
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mSuccessResult:Landroid/os/Bundle;

    goto :goto_0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x0

    return v0
.end method

.method public isDone()Z
    .locals 4

    .prologue
    .line 75
    iget-object v0, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onError(Lcom/amazon/identity/auth/device/AuthError;)V
    .locals 1
    .param p1, "e"    # Lcom/amazon/identity/auth/device/AuthError;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mError:Lcom/amazon/identity/auth/device/AuthError;

    .line 94
    iget-object v0, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 95
    iget-object v0, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mListener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    invoke-interface {v0, p1}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    .line 96
    return-void
.end method

.method public onSuccess(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "response"    # Landroid/os/Bundle;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mSuccessResult:Landroid/os/Bundle;

    .line 81
    iget-object v0, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mSuccessResult:Landroid/os/Bundle;

    if-nez v0, :cond_0

    .line 83
    sget-object v0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Null Response"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mSuccessResult:Landroid/os/Bundle;

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mSuccessResult:Landroid/os/Bundle;

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->FUTURE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v1, v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;->SUCCESS:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 87
    iget-object v0, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 88
    iget-object v0, p0, Lcom/amazon/identity/auth/device/thread/MAPCallbackFuture;->mListener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    invoke-interface {v0, p1}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onSuccess(Landroid/os/Bundle;)V

    .line 89
    return-void
.end method
