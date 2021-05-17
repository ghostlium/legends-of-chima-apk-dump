.class final Lcom/unity3d/plugin/downloader/c/l;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/unity3d/plugin/downloader/c/j;

.field final synthetic b:Lcom/unity3d/plugin/downloader/c/k;


# direct methods
.method constructor <init>(Lcom/unity3d/plugin/downloader/c/k;Lcom/unity3d/plugin/downloader/c/j;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/c/l;->b:Lcom/unity3d/plugin/downloader/c/k;

    iput-object p2, p0, Lcom/unity3d/plugin/downloader/c/l;->a:Lcom/unity3d/plugin/downloader/c/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    const-string v0, "LicenseChecker"

    const-string v1, "Check timed out."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c/l;->b:Lcom/unity3d/plugin/downloader/c/k;

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/c/k;->a:Lcom/unity3d/plugin/downloader/c/j;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/c/l;->b:Lcom/unity3d/plugin/downloader/c/k;

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/c/k;->a(Lcom/unity3d/plugin/downloader/c/k;)Lcom/unity3d/plugin/downloader/c/o;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unity3d/plugin/downloader/c/j;->a(Lcom/unity3d/plugin/downloader/c/j;Lcom/unity3d/plugin/downloader/c/o;)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c/l;->b:Lcom/unity3d/plugin/downloader/c/k;

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/c/k;->a:Lcom/unity3d/plugin/downloader/c/j;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/c/l;->b:Lcom/unity3d/plugin/downloader/c/k;

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/c/k;->a(Lcom/unity3d/plugin/downloader/c/k;)Lcom/unity3d/plugin/downloader/c/o;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unity3d/plugin/downloader/c/j;->b(Lcom/unity3d/plugin/downloader/c/j;Lcom/unity3d/plugin/downloader/c/o;)V

    return-void
.end method
