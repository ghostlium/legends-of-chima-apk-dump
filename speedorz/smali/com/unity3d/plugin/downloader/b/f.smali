.class public abstract Lcom/unity3d/plugin/downloader/b/f;
.super Landroid/app/Service;


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "CancellableIntentService"

.field private static final WHAT_MESSAGE:I = -0xa


# instance fields
.field private mName:Ljava/lang/String;

.field private mRedelivery:Z

.field private volatile mServiceHandler:Lcom/unity3d/plugin/downloader/b/g;

.field private volatile mServiceLooper:Landroid/os/Looper;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/f;->mName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected abstract a(Landroid/content/Intent;)V
.end method

.method protected abstract e()Z
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    new-instance v0, Landroid/os/HandlerThread;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "IntentService["

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/f;->mName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/f;->mServiceLooper:Landroid/os/Looper;

    new-instance v0, Lcom/unity3d/plugin/downloader/b/g;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/f;->mServiceLooper:Landroid/os/Looper;

    invoke-direct {v0, p0, v1}, Lcom/unity3d/plugin/downloader/b/g;-><init>(Lcom/unity3d/plugin/downloader/b/f;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/f;->mServiceHandler:Lcom/unity3d/plugin/downloader/b/g;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/f;->mServiceLooper:Landroid/os/Looper;

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :cond_0
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/f;->mServiceLooper:Landroid/os/Looper;

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    const-string v0, "CancellableIntentService"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 2

    const/16 v1, -0xa

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/f;->mServiceHandler:Lcom/unity3d/plugin/downloader/b/g;

    invoke-virtual {v0, v1}, Lcom/unity3d/plugin/downloader/b/g;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/f;->mServiceHandler:Lcom/unity3d/plugin/downloader/b/g;

    invoke-virtual {v0}, Lcom/unity3d/plugin/downloader/b/g;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    iput p2, v0, Landroid/os/Message;->arg1:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput v1, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/f;->mServiceHandler:Lcom/unity3d/plugin/downloader/b/g;

    invoke-virtual {v1, v0}, Lcom/unity3d/plugin/downloader/b/g;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1

    invoke-virtual {p0, p1, p3}, Lcom/unity3d/plugin/downloader/b/f;->onStart(Landroid/content/Intent;I)V

    iget-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/f;->mRedelivery:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x2

    goto :goto_0
.end method