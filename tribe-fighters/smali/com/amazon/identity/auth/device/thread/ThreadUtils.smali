.class public final Lcom/amazon/identity/auth/device/thread/ThreadUtils;
.super Ljava/lang/Object;
.source "ThreadUtils.java"


# static fields
.field public static final THREAD_POOL:Ljava/util/concurrent/Executor;

.field private static sThreadNum:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const/4 v0, 0x0

    sput v0, Lcom/amazon/identity/auth/device/thread/ThreadUtils;->sThreadNum:I

    .line 18
    new-instance v0, Lcom/amazon/identity/auth/device/thread/ThreadUtils$1;

    invoke-direct {v0}, Lcom/amazon/identity/auth/device/thread/ThreadUtils$1;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/thread/ThreadUtils;->THREAD_POOL:Ljava/util/concurrent/Executor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method static synthetic access$004()I
    .locals 1

    .prologue
    .line 10
    sget v0, Lcom/amazon/identity/auth/device/thread/ThreadUtils;->sThreadNum:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/amazon/identity/auth/device/thread/ThreadUtils;->sThreadNum:I

    return v0
.end method

.method public static isRunningOnMainThread()Z
    .locals 2

    .prologue
    .line 30
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
