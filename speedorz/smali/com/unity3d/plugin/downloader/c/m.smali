.class final Lcom/unity3d/plugin/downloader/c/m;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lcom/unity3d/plugin/downloader/c/k;


# direct methods
.method constructor <init>(Lcom/unity3d/plugin/downloader/c/k;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/c/m;->d:Lcom/unity3d/plugin/downloader/c/k;

    iput p2, p0, Lcom/unity3d/plugin/downloader/c/m;->a:I

    iput-object p3, p0, Lcom/unity3d/plugin/downloader/c/m;->b:Ljava/lang/String;

    iput-object p4, p0, Lcom/unity3d/plugin/downloader/c/m;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    const-string v0, "LicenseChecker"

    const-string v1, "Received response."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c/m;->d:Lcom/unity3d/plugin/downloader/c/k;

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/c/k;->a:Lcom/unity3d/plugin/downloader/c/j;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/c/j;->a(Lcom/unity3d/plugin/downloader/c/j;)Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/c/m;->d:Lcom/unity3d/plugin/downloader/c/k;

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/c/k;->a(Lcom/unity3d/plugin/downloader/c/k;)Lcom/unity3d/plugin/downloader/c/o;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c/m;->d:Lcom/unity3d/plugin/downloader/c/k;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/c/k;->b(Lcom/unity3d/plugin/downloader/c/k;)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c/m;->d:Lcom/unity3d/plugin/downloader/c/k;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/c/k;->a(Lcom/unity3d/plugin/downloader/c/k;)Lcom/unity3d/plugin/downloader/c/o;

    move-result-object v0

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/c/m;->d:Lcom/unity3d/plugin/downloader/c/k;

    iget-object v1, v1, Lcom/unity3d/plugin/downloader/c/k;->a:Lcom/unity3d/plugin/downloader/c/j;

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/c/j;->b(Lcom/unity3d/plugin/downloader/c/j;)Ljava/security/PublicKey;

    move-result-object v1

    iget v2, p0, Lcom/unity3d/plugin/downloader/c/m;->a:I

    iget-object v3, p0, Lcom/unity3d/plugin/downloader/c/m;->b:Ljava/lang/String;

    iget-object v4, p0, Lcom/unity3d/plugin/downloader/c/m;->c:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/unity3d/plugin/downloader/c/o;->a(Ljava/security/PublicKey;ILjava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/c/m;->d:Lcom/unity3d/plugin/downloader/c/k;

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/c/k;->a:Lcom/unity3d/plugin/downloader/c/j;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/c/m;->d:Lcom/unity3d/plugin/downloader/c/k;

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/c/k;->a(Lcom/unity3d/plugin/downloader/c/k;)Lcom/unity3d/plugin/downloader/c/o;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unity3d/plugin/downloader/c/j;->b(Lcom/unity3d/plugin/downloader/c/j;Lcom/unity3d/plugin/downloader/c/o;)V

    :cond_0
    return-void
.end method
