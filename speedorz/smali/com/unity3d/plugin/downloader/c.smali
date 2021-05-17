.class final Lcom/unity3d/plugin/downloader/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;


# direct methods
.method constructor <init>(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/c;->a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c;->a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->b(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)Lcom/unity3d/plugin/downloader/a/o;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/unity3d/plugin/downloader/a/o;->a(I)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c;->a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->b(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)Lcom/unity3d/plugin/downloader/a/o;

    move-result-object v0

    invoke-interface {v0}, Lcom/unity3d/plugin/downloader/a/o;->c()V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c;->a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->c(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
