.class final Lcom/unity3d/plugin/downloader/a/f;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unity3d/plugin/downloader/a/p;


# instance fields
.field final a:Landroid/os/Messenger;

.field private b:Lcom/unity3d/plugin/downloader/a/n;

.field private c:Ljava/lang/Class;

.field private d:Z

.field private e:Landroid/os/Messenger;

.field private f:Landroid/content/Context;

.field private g:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>(Lcom/unity3d/plugin/downloader/a/n;Ljava/lang/Class;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/a/f;->b:Lcom/unity3d/plugin/downloader/a/n;

    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lcom/unity3d/plugin/downloader/a/g;

    invoke-direct {v1, p0}, Lcom/unity3d/plugin/downloader/a/g;-><init>(Lcom/unity3d/plugin/downloader/a/f;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/a/f;->a:Landroid/os/Messenger;

    new-instance v0, Lcom/unity3d/plugin/downloader/a/h;

    invoke-direct {v0, p0}, Lcom/unity3d/plugin/downloader/a/h;-><init>(Lcom/unity3d/plugin/downloader/a/f;)V

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/a/f;->g:Landroid/content/ServiceConnection;

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/a/f;->b:Lcom/unity3d/plugin/downloader/a/n;

    iput-object p2, p0, Lcom/unity3d/plugin/downloader/a/f;->c:Ljava/lang/Class;

    return-void
.end method

.method static synthetic a(Lcom/unity3d/plugin/downloader/a/f;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a/f;->f:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic a(Lcom/unity3d/plugin/downloader/a/f;Landroid/os/Messenger;)Landroid/os/Messenger;
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/a/f;->e:Landroid/os/Messenger;

    return-object p1
.end method

.method static synthetic b(Lcom/unity3d/plugin/downloader/a/f;)Lcom/unity3d/plugin/downloader/a/n;
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a/f;->b:Lcom/unity3d/plugin/downloader/a/n;

    return-object v0
.end method

.method static synthetic c(Lcom/unity3d/plugin/downloader/a/f;)Landroid/os/Messenger;
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a/f;->e:Landroid/os/Messenger;

    return-object v0
.end method


# virtual methods
.method public final a()Landroid/os/Messenger;
    .locals 1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a/f;->a:Landroid/os/Messenger;

    return-object v0
.end method

.method public final a(Landroid/content/Context;)V
    .locals 3

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/a/f;->f:Landroid/content/Context;

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/a/f;->c:Ljava/lang/Class;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "EMH"

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/a/f;->a:Landroid/os/Messenger;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/a/f;->g:Landroid/content/ServiceConnection;

    const/4 v2, 0x2

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/a/f;->d:Z

    :cond_0
    return-void
.end method

.method public final b(Landroid/content/Context;)V
    .locals 1

    iget-boolean v0, p0, Lcom/unity3d/plugin/downloader/a/f;->d:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a/f;->g:Landroid/content/ServiceConnection;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/a/f;->d:Z

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/a/f;->f:Landroid/content/Context;

    return-void
.end method
