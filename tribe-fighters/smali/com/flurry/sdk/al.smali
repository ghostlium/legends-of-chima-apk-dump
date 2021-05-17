.class public Lcom/flurry/sdk/al;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Ljava/lang/String;

.field private static b:Lcom/flurry/sdk/al;


# instance fields
.field private c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-class v0, Lcom/flurry/sdk/al;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/al;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/sdk/al;->c:Z

    .line 80
    return-void
.end method

.method public static declared-synchronized a()Lcom/flurry/sdk/al;
    .locals 4

    .prologue
    .line 108
    const-class v1, Lcom/flurry/sdk/al;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/sdk/al;->b:Lcom/flurry/sdk/al;

    if-nez v0, :cond_0

    .line 110
    const/4 v0, 0x3

    sget-object v2, Lcom/flurry/sdk/al;->a:Ljava/lang/String;

    const-string v3, "Precaching: Got new AssetCacheManager instance."

    invoke-static {v0, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 111
    new-instance v0, Lcom/flurry/sdk/al;

    invoke-direct {v0}, Lcom/flurry/sdk/al;-><init>()V

    sput-object v0, Lcom/flurry/sdk/al;->b:Lcom/flurry/sdk/al;

    .line 113
    :cond_0
    sget-object v0, Lcom/flurry/sdk/al;->b:Lcom/flurry/sdk/al;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 108
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
