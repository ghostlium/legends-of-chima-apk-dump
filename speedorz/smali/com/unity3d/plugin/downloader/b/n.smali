.class final Lcom/unity3d/plugin/downloader/b/n;
.super Ljava/lang/Object;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/io/FileOutputStream;

.field public c:Z

.field public d:I

.field public e:I

.field public f:Ljava/lang/String;

.field public g:Z

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/unity3d/plugin/downloader/b/h;Lcom/unity3d/plugin/downloader/b/p;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/n;->c:Z

    iput v0, p0, Lcom/unity3d/plugin/downloader/b/n;->d:I

    iput v0, p0, Lcom/unity3d/plugin/downloader/b/n;->e:I

    iput-boolean v0, p0, Lcom/unity3d/plugin/downloader/b/n;->g:Z

    iget v0, p1, Lcom/unity3d/plugin/downloader/b/h;->l:I

    iput v0, p0, Lcom/unity3d/plugin/downloader/b/n;->e:I

    iget-object v0, p1, Lcom/unity3d/plugin/downloader/b/h;->a:Ljava/lang/String;

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/n;->h:Ljava/lang/String;

    iget-object v0, p1, Lcom/unity3d/plugin/downloader/b/h;->c:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/unity3d/plugin/downloader/b/p;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    return-void
.end method
