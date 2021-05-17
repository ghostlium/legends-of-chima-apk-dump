.class final Lcom/unity3d/plugin/downloader/c/k;
.super Lcom/unity3d/plugin/downloader/c/e;


# instance fields
.field final synthetic a:Lcom/unity3d/plugin/downloader/c/j;

.field private final b:Lcom/unity3d/plugin/downloader/c/o;

.field private c:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/unity3d/plugin/downloader/c/j;Lcom/unity3d/plugin/downloader/c/o;)V
    .locals 4

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/c/k;->a:Lcom/unity3d/plugin/downloader/c/j;

    invoke-direct {p0}, Lcom/unity3d/plugin/downloader/c/e;-><init>()V

    iput-object p2, p0, Lcom/unity3d/plugin/downloader/c/k;->b:Lcom/unity3d/plugin/downloader/c/o;

    new-instance v0, Lcom/unity3d/plugin/downloader/c/l;

    invoke-direct {v0, p0, p1}, Lcom/unity3d/plugin/downloader/c/l;-><init>(Lcom/unity3d/plugin/downloader/c/k;Lcom/unity3d/plugin/downloader/c/j;)V

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/c/k;->c:Ljava/lang/Runnable;

    const-string v0, "LicenseChecker"

    const-string v1, "Start monitoring timeout."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c/k;->a:Lcom/unity3d/plugin/downloader/c/j;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/c/j;->c(Lcom/unity3d/plugin/downloader/c/j;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/c/k;->c:Ljava/lang/Runnable;

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method static synthetic a(Lcom/unity3d/plugin/downloader/c/k;)Lcom/unity3d/plugin/downloader/c/o;
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c/k;->b:Lcom/unity3d/plugin/downloader/c/o;

    return-object v0
.end method

.method static synthetic b(Lcom/unity3d/plugin/downloader/c/k;)V
    .locals 2

    const-string v0, "LicenseChecker"

    const-string v1, "Clearing timeout."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c/k;->a:Lcom/unity3d/plugin/downloader/c/j;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/c/j;->c(Lcom/unity3d/plugin/downloader/c/j;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/c/k;->c:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final a(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c/k;->a:Lcom/unity3d/plugin/downloader/c/j;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/c/j;->c(Lcom/unity3d/plugin/downloader/c/j;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/unity3d/plugin/downloader/c/m;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/unity3d/plugin/downloader/c/m;-><init>(Lcom/unity3d/plugin/downloader/c/k;ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
