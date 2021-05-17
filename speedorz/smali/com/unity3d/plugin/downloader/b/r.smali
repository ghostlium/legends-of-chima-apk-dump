.class final Lcom/unity3d/plugin/downloader/b/r;
.super Landroid/content/BroadcastReceiver;


# instance fields
.field final a:Landroid/app/Service;

.field final synthetic b:Lcom/unity3d/plugin/downloader/b/p;


# direct methods
.method constructor <init>(Lcom/unity3d/plugin/downloader/b/p;Landroid/app/Service;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/r;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    iput-object p2, p0, Lcom/unity3d/plugin/downloader/b/r;->a:Landroid/app/Service;

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/r;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-virtual {v0}, Lcom/unity3d/plugin/downloader/b/p;->g()V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/r;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/b/p;->c(Lcom/unity3d/plugin/downloader/b/p;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/unity3d/plugin/downloader/b/p;->m()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "LVLDL"

    const-string v1, "InnerBroadcastReceiver Called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/r;->a:Landroid/app/Service;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "EPI"

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/r;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-static {v2}, Lcom/unity3d/plugin/downloader/b/p;->b(Lcom/unity3d/plugin/downloader/b/p;)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_0
    return-void
.end method
