.class final Lcom/unity3d/plugin/downloader/a/k;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unity3d/plugin/downloader/a/p;


# instance fields
.field final a:Landroid/os/Messenger;

.field private b:Lcom/unity3d/plugin/downloader/a/o;


# direct methods
.method public constructor <init>(Lcom/unity3d/plugin/downloader/a/o;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/a/k;->b:Lcom/unity3d/plugin/downloader/a/o;

    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lcom/unity3d/plugin/downloader/a/l;

    invoke-direct {v1, p0}, Lcom/unity3d/plugin/downloader/a/l;-><init>(Lcom/unity3d/plugin/downloader/a/k;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/a/k;->a:Landroid/os/Messenger;

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/a/k;->b:Lcom/unity3d/plugin/downloader/a/o;

    return-void
.end method

.method static synthetic a(Lcom/unity3d/plugin/downloader/a/k;)Lcom/unity3d/plugin/downloader/a/o;
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a/k;->b:Lcom/unity3d/plugin/downloader/a/o;

    return-object v0
.end method


# virtual methods
.method public final a()Landroid/os/Messenger;
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a/k;->a:Landroid/os/Messenger;

    return-object v0
.end method

.method public final a(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public final b(Landroid/content/Context;)V
    .locals 0

    return-void
.end method
