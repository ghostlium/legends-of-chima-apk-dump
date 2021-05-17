.class final Lcom/unity3d/plugin/downloader/a/g;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/unity3d/plugin/downloader/a/f;


# direct methods
.method constructor <init>(Lcom/unity3d/plugin/downloader/a/f;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/a/g;->a:Lcom/unity3d/plugin/downloader/a/f;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/a/g;->a:Lcom/unity3d/plugin/downloader/a/f;

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/a/f;->a(Lcom/unity3d/plugin/downloader/a/f;)Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/a/g;->a:Lcom/unity3d/plugin/downloader/a/f;

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/a/f;->a(Lcom/unity3d/plugin/downloader/a/f;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "progress"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unity3d/plugin/downloader/a/b;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/a/g;->a:Lcom/unity3d/plugin/downloader/a/f;

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/a/f;->b(Lcom/unity3d/plugin/downloader/a/f;)Lcom/unity3d/plugin/downloader/a/n;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/unity3d/plugin/downloader/a/n;->a(Lcom/unity3d/plugin/downloader/a/b;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a/g;->a:Lcom/unity3d/plugin/downloader/a/f;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/a/f;->b(Lcom/unity3d/plugin/downloader/a/f;)Lcom/unity3d/plugin/downloader/a/n;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "newState"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Lcom/unity3d/plugin/downloader/a/n;->a(I)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/a/g;->a:Lcom/unity3d/plugin/downloader/a/f;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/a/f;->b(Lcom/unity3d/plugin/downloader/a/f;)Lcom/unity3d/plugin/downloader/a/n;

    move-result-object v1

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string v2, "EMH"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/Messenger;

    invoke-interface {v1, v0}, Lcom/unity3d/plugin/downloader/a/n;->a(Landroid/os/Messenger;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
