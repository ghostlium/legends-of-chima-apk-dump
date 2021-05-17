.class final Lcom/unity3d/plugin/downloader/a;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;


# direct methods
.method constructor <init>(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/a;->a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a;->a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->a(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a;->a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->b(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)Lcom/unity3d/plugin/downloader/a/o;

    move-result-object v0

    invoke-interface {v0}, Lcom/unity3d/plugin/downloader/a/o;->c()V

    :goto_0
    iget-object v1, p0, Lcom/unity3d/plugin/downloader/a;->a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a;->a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->a(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-static {v1, v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->a(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;Z)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a;->a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->b(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)Lcom/unity3d/plugin/downloader/a/o;

    move-result-object v0

    invoke-interface {v0}, Lcom/unity3d/plugin/downloader/a/o;->b()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method
