.class final Lcom/unity3d/plugin/downloader/a/h;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field final synthetic a:Lcom/unity3d/plugin/downloader/a/f;


# direct methods
.method constructor <init>(Lcom/unity3d/plugin/downloader/a/f;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/a/h;->a:Lcom/unity3d/plugin/downloader/a/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a/h;->a:Lcom/unity3d/plugin/downloader/a/f;

    new-instance v1, Landroid/os/Messenger;

    invoke-direct {v1, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    invoke-static {v0, v1}, Lcom/unity3d/plugin/downloader/a/f;->a(Lcom/unity3d/plugin/downloader/a/f;Landroid/os/Messenger;)Landroid/os/Messenger;

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a/h;->a:Lcom/unity3d/plugin/downloader/a/f;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/a/f;->b(Lcom/unity3d/plugin/downloader/a/f;)Lcom/unity3d/plugin/downloader/a/n;

    move-result-object v0

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/a/h;->a:Lcom/unity3d/plugin/downloader/a/f;

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/a/f;->c(Lcom/unity3d/plugin/downloader/a/f;)Landroid/os/Messenger;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/unity3d/plugin/downloader/a/n;->a(Landroid/os/Messenger;)V

    return-void
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a/h;->a:Lcom/unity3d/plugin/downloader/a/f;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/unity3d/plugin/downloader/a/f;->a(Lcom/unity3d/plugin/downloader/a/f;Landroid/os/Messenger;)Landroid/os/Messenger;

    return-void
.end method
