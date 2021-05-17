.class final Lcom/unity3d/plugin/downloader/b/s;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final a:Landroid/content/Context;

.field final synthetic b:Lcom/unity3d/plugin/downloader/b/p;


# direct methods
.method constructor <init>(Lcom/unity3d/plugin/downloader/b/p;Landroid/content/Context;Landroid/app/PendingIntent;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/s;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/unity3d/plugin/downloader/b/s;->a:Landroid/content/Context;

    invoke-static {p1, p3}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/p;Landroid/app/PendingIntent;)Landroid/app/PendingIntent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/b/p;->a(Z)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/s;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/p;)Lcom/unity3d/plugin/downloader/b/i;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/unity3d/plugin/downloader/b/i;->a(I)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/s;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/unity3d/plugin/downloader/c/b;

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/s;->a:Landroid/content/Context;

    new-instance v3, Lcom/unity3d/plugin/downloader/c/a;

    iget-object v4, p0, Lcom/unity3d/plugin/downloader/b/s;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-virtual {v4}, Lcom/unity3d/plugin/downloader/b/p;->i()[B

    move-result-object v4

    iget-object v5, p0, Lcom/unity3d/plugin/downloader/b/s;->a:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v0}, Lcom/unity3d/plugin/downloader/c/a;-><init>([BLjava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, v2, v3}, Lcom/unity3d/plugin/downloader/c/b;-><init>(Landroid/content/Context;Lcom/unity3d/plugin/downloader/c/q;)V

    invoke-virtual {v1}, Lcom/unity3d/plugin/downloader/c/b;->a()V

    new-instance v0, Lcom/unity3d/plugin/downloader/c/j;

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/s;->a:Landroid/content/Context;

    iget-object v3, p0, Lcom/unity3d/plugin/downloader/b/s;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-virtual {v3}, Lcom/unity3d/plugin/downloader/b/p;->h()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v1, v3}, Lcom/unity3d/plugin/downloader/c/j;-><init>(Landroid/content/Context;Lcom/unity3d/plugin/downloader/c/r;Ljava/lang/String;)V

    new-instance v2, Lcom/unity3d/plugin/downloader/b/t;

    invoke-direct {v2, p0, v1}, Lcom/unity3d/plugin/downloader/b/t;-><init>(Lcom/unity3d/plugin/downloader/b/s;Lcom/unity3d/plugin/downloader/c/b;)V

    invoke-virtual {v0, v2}, Lcom/unity3d/plugin/downloader/c/j;->a(Lcom/unity3d/plugin/downloader/c/n;)V

    return-void
.end method
