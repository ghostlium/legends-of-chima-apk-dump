.class public final Lcom/unity3d/plugin/downloader/b/k;
.super Ljava/lang/Object;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Lcom/unity3d/plugin/downloader/b/h;

.field private c:Lcom/unity3d/plugin/downloader/b/p;

.field private final d:Lcom/unity3d/plugin/downloader/b/u;

.field private final e:Lcom/unity3d/plugin/downloader/b/i;

.field private f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/unity3d/plugin/downloader/b/h;Lcom/unity3d/plugin/downloader/b/p;Lcom/unity3d/plugin/downloader/b/i;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/unity3d/plugin/downloader/b/k;->a:Landroid/content/Context;

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iput-object p2, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    iput-object p3, p0, Lcom/unity3d/plugin/downloader/b/k;->e:Lcom/unity3d/plugin/downloader/b/i;

    invoke-static {p2}, Lcom/unity3d/plugin/downloader/b/u;->a(Landroid/content/Context;)Lcom/unity3d/plugin/downloader/b/u;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->d:Lcom/unity3d/plugin/downloader/b/u;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "APKXDL (Linux; U; Android "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lcom/unity3d/plugin/downloader/b/p;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->f:Ljava/lang/String;

    return-void
.end method

.method private a(Lcom/unity3d/plugin/downloader/b/n;Lorg/apache/http/HttpResponse;)Ljava/io/InputStream;
    .locals 5

    :try_start_0
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    invoke-direct {p0}, Lcom/unity3d/plugin/downloader/b/k;->d()V

    new-instance v1, Lcom/unity3d/plugin/downloader/b/o;

    invoke-direct {p0, p1}, Lcom/unity3d/plugin/downloader/b/k;->b(Lcom/unity3d/plugin/downloader/b/n;)I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "while getting entity: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private a(Lcom/unity3d/plugin/downloader/b/n;Lcom/unity3d/plugin/downloader/b/a;Lorg/apache/http/client/methods/HttpGet;)Lorg/apache/http/HttpResponse;
    .locals 5

    :try_start_0
    invoke-virtual {p2, p3}, Lcom/unity3d/plugin/downloader/b/a;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v2, 0x1ef

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "while trying to execute request: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    invoke-direct {p0}, Lcom/unity3d/plugin/downloader/b/k;->d()V

    new-instance v1, Lcom/unity3d/plugin/downloader/b/o;

    invoke-direct {p0, p1}, Lcom/unity3d/plugin/downloader/b/k;->b(Lcom/unity3d/plugin/downloader/b/n;)I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "while trying to execute request: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private a(IZIIZ)V
    .locals 3

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iput p1, v0, Lcom/unity3d/plugin/downloader/b/h;->h:I

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iput p3, v0, Lcom/unity3d/plugin/downloader/b/h;->k:I

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iput p4, v0, Lcom/unity3d/plugin/downloader/b/h;->l:I

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/unity3d/plugin/downloader/b/h;->g:J

    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    const/4 v1, 0x0

    iput v1, v0, Lcom/unity3d/plugin/downloader/b/h;->j:I

    :goto_0
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->d:Lcom/unity3d/plugin/downloader/b/u;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    invoke-virtual {v0, v1}, Lcom/unity3d/plugin/downloader/b/u;->b(Lcom/unity3d/plugin/downloader/b/h;)Z

    invoke-static {p1}, Lcom/unity3d/plugin/downloader/b/p;->c(I)Z

    return-void

    :cond_0
    if-eqz p5, :cond_1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    const/4 v1, 0x1

    iput v1, v0, Lcom/unity3d/plugin/downloader/b/h;->j:I

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget v1, v0, Lcom/unity3d/plugin/downloader/b/h;->j:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/unity3d/plugin/downloader/b/h;->j:I

    goto :goto_0
.end method

.method private static a(Lcom/unity3d/plugin/downloader/b/n;)V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/n;->b:Ljava/io/FileOutputStream;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/n;->b:Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/n;->b:Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static a(Lcom/unity3d/plugin/downloader/b/n;I)V
    .locals 2

    invoke-static {p0}, Lcom/unity3d/plugin/downloader/b/k;->a(Lcom/unity3d/plugin/downloader/b/n;)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/unity3d/plugin/downloader/b/p;->b(I)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private a(Lcom/unity3d/plugin/downloader/b/n;Lcom/unity3d/plugin/downloader/b/l;[BLjava/io/InputStream;)V
    .locals 8

    const/4 v1, 0x0

    const/4 v0, 0x1

    :goto_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/unity3d/plugin/downloader/b/k;->b(Lcom/unity3d/plugin/downloader/b/n;Lcom/unity3d/plugin/downloader/b/l;[BLjava/io/InputStream;)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget v3, p2, Lcom/unity3d/plugin/downloader/b/l;->a:I

    int-to-long v3, v3

    iput-wide v3, v2, Lcom/unity3d/plugin/downloader/b/h;->f:J

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/k;->d:Lcom/unity3d/plugin/downloader/b/u;

    iget-object v3, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    invoke-virtual {v2, v3}, Lcom/unity3d/plugin/downloader/b/u;->b(Lcom/unity3d/plugin/downloader/b/h;)Z

    iget-object v2, p2, Lcom/unity3d/plugin/downloader/b/l;->e:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget v2, p2, Lcom/unity3d/plugin/downloader/b/l;->a:I

    iget-object v3, p2, Lcom/unity3d/plugin/downloader/b/l;->e:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    if-eq v2, v3, :cond_0

    :goto_1
    if-eqz v0, :cond_7

    invoke-static {p2}, Lcom/unity3d/plugin/downloader/b/k;->a(Lcom/unity3d/plugin/downloader/b/l;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v1, 0x1e9

    const-string v2, "mismatched content length"

    invoke-direct {v0, p0, v1, v2}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0

    :cond_0
    move v0, v1

    goto :goto_1

    :cond_1
    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    invoke-direct {p0, p1}, Lcom/unity3d/plugin/downloader/b/k;->b(Lcom/unity3d/plugin/downloader/b/n;)I

    move-result v1

    const-string v2, "closed socket before end of file"

    invoke-direct {v0, p0, v1, v2}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0

    :cond_2
    iput-boolean v0, p1, Lcom/unity3d/plugin/downloader/b/n;->g:Z

    :try_start_0
    iget-object v3, p1, Lcom/unity3d/plugin/downloader/b/n;->b:Ljava/io/FileOutputStream;

    if-nez v3, :cond_3

    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v4, p1, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    iput-object v3, p1, Lcom/unity3d/plugin/downloader/b/n;->b:Ljava/io/FileOutputStream;

    :cond_3
    iget-object v3, p1, Lcom/unity3d/plugin/downloader/b/n;->b:Ljava/io/FileOutputStream;

    const/4 v4, 0x0

    invoke-virtual {v3, p3, v4, v2}, Ljava/io/FileOutputStream;->write([BII)V

    invoke-static {p1}, Lcom/unity3d/plugin/downloader/b/k;->a(Lcom/unity3d/plugin/downloader/b/n;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    iget v3, p2, Lcom/unity3d/plugin/downloader/b/l;->a:I

    add-int/2addr v3, v2

    iput v3, p2, Lcom/unity3d/plugin/downloader/b/l;->a:I

    iget v3, p2, Lcom/unity3d/plugin/downloader/b/l;->b:I

    add-int/2addr v2, v3

    iput v2, p2, Lcom/unity3d/plugin/downloader/b/l;->b:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget v4, p2, Lcom/unity3d/plugin/downloader/b/l;->a:I

    iget v5, p2, Lcom/unity3d/plugin/downloader/b/l;->h:I

    sub-int/2addr v4, v5

    const/16 v5, 0x1000

    if-le v4, v5, :cond_4

    iget-wide v4, p2, Lcom/unity3d/plugin/downloader/b/l;->i:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0x3e8

    cmp-long v4, v4, v6

    if-lez v4, :cond_4

    iget-object v4, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget v5, p2, Lcom/unity3d/plugin/downloader/b/l;->a:I

    int-to-long v5, v5

    iput-wide v5, v4, Lcom/unity3d/plugin/downloader/b/h;->f:J

    iget-object v4, p0, Lcom/unity3d/plugin/downloader/b/k;->d:Lcom/unity3d/plugin/downloader/b/u;

    iget-object v5, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    invoke-virtual {v4, v5}, Lcom/unity3d/plugin/downloader/b/u;->a(Lcom/unity3d/plugin/downloader/b/h;)V

    iget v4, p2, Lcom/unity3d/plugin/downloader/b/l;->a:I

    iput v4, p2, Lcom/unity3d/plugin/downloader/b/l;->h:I

    iput-wide v2, p2, Lcom/unity3d/plugin/downloader/b/l;->i:J

    iget v2, p2, Lcom/unity3d/plugin/downloader/b/l;->b:I

    int-to-long v2, v2

    iget-object v4, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    iget-wide v4, v4, Lcom/unity3d/plugin/downloader/b/p;->mBytesSoFar:J

    add-long/2addr v2, v4

    iget-object v4, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    invoke-virtual {v4, v2, v3}, Lcom/unity3d/plugin/downloader/b/p;->a(J)V

    :cond_4
    invoke-direct {p0}, Lcom/unity3d/plugin/downloader/b/k;->c()V

    goto/16 :goto_0

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/unity3d/plugin/downloader/a/m;->a()Z

    move-result v1

    if-nez v1, :cond_5

    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v1, 0x1f3

    const-string v2, "external media not mounted while writing destination file"

    invoke-direct {v0, p0, v1, v2}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0

    :cond_5
    iget-object v1, p1, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/a/m;->a(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/a/m;->a(Ljava/io/File;)J

    move-result-wide v3

    int-to-long v1, v2

    cmp-long v1, v3, v1

    if-gez v1, :cond_6

    new-instance v1, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v2, 0x1f2

    const-string v3, "insufficient space while writing destination file"

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_6
    new-instance v1, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v2, 0x1ec

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "while writing destination file: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_7
    return-void
.end method

.method private static a(Lcom/unity3d/plugin/downloader/b/l;)Z
    .locals 1

    iget v0, p0, Lcom/unity3d/plugin/downloader/b/l;->a:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/l;->c:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static final a(Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    :try_start_0
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "localhost"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "127.0.0.1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "[::1]"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-eqz v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private b(Lcom/unity3d/plugin/downloader/b/n;)I
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/k;->d:Lcom/unity3d/plugin/downloader/b/u;

    invoke-virtual {v0, v1}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/u;)I

    move-result v0

    if-eq v0, v2, :cond_0

    const/16 v0, 0xc3

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget v0, v0, Lcom/unity3d/plugin/downloader/b/h;->j:I

    const/4 v1, 0x5

    if-ge v0, v1, :cond_1

    iput-boolean v2, p1, Lcom/unity3d/plugin/downloader/b/n;->c:Z

    const/16 v0, 0xc2

    goto :goto_0

    :cond_1
    const-string v0, "LVLDL"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "reached max retries for "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget v2, v2, Lcom/unity3d/plugin/downloader/b/h;->j:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x1ef

    goto :goto_0
.end method

.method private b(Lcom/unity3d/plugin/downloader/b/n;Lcom/unity3d/plugin/downloader/b/l;[BLjava/io/InputStream;)I
    .locals 5

    :try_start_0
    invoke-virtual {p4, p3}, Ljava/io/InputStream;->read([B)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    return v0

    :catch_0
    move-exception v0

    invoke-direct {p0}, Lcom/unity3d/plugin/downloader/b/k;->d()V

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget v2, p2, Lcom/unity3d/plugin/downloader/b/l;->a:I

    int-to-long v2, v2

    iput-wide v2, v1, Lcom/unity3d/plugin/downloader/b/h;->f:J

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/k;->d:Lcom/unity3d/plugin/downloader/b/u;

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    invoke-virtual {v1, v2}, Lcom/unity3d/plugin/downloader/b/u;->b(Lcom/unity3d/plugin/downloader/b/h;)Z

    invoke-static {p2}, Lcom/unity3d/plugin/downloader/b/k;->a(Lcom/unity3d/plugin/downloader/b/l;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "while reading response: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", can\'t resume interrupted download with no ETag"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v3, 0x1e9

    invoke-direct {v2, p0, v3, v1, v0}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :cond_0
    new-instance v1, Lcom/unity3d/plugin/downloader/b/o;

    invoke-direct {p0, p1}, Lcom/unity3d/plugin/downloader/b/k;->b(Lcom/unity3d/plugin/downloader/b/n;)I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "while reading response: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private b()V
    .locals 3

    const/16 v2, 0xc3

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/k;->d:Lcom/unity3d/plugin/downloader/b/u;

    invoke-virtual {v0, v1}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/u;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    return-void

    :pswitch_1
    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const-string v1, "waiting for network to return"

    invoke-direct {v0, p0, v2, v1}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0

    :pswitch_2
    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v1, 0xc4

    const-string v2, "waiting for wifi or for download over cellular to be authorized"

    invoke-direct {v0, p0, v1, v2}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0

    :pswitch_3
    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const-string v1, "roaming is not allowed"

    invoke-direct {v0, p0, v2, v1}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0

    :pswitch_4
    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v1, 0xc5

    const-string v2, "waiting for wifi"

    invoke-direct {v0, p0, v1, v2}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private c()V
    .locals 3

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    invoke-virtual {v0}, Lcom/unity3d/plugin/downloader/b/p;->k()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    invoke-virtual {v0}, Lcom/unity3d/plugin/downloader/b/p;->l()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    return-void

    :pswitch_0
    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    invoke-virtual {v1}, Lcom/unity3d/plugin/downloader/b/p;->l()I

    move-result v1

    const-string v2, "download paused"

    invoke-direct {v0, p0, v1, v2}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0xc1
        :pswitch_0
    .end packed-switch
.end method

.method private d()V
    .locals 4

    const-string v1, "LVLDL"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v0, "Net "

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    iget-object v3, p0, Lcom/unity3d/plugin/downloader/b/k;->d:Lcom/unity3d/plugin/downloader/b/u;

    invoke-virtual {v0, v3}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/u;)I

    move-result v0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_0

    const-string v0, "Up"

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const-string v0, "Down"

    goto :goto_0
.end method


# virtual methods
.method public final a()V
    .locals 15

    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    new-instance v7, Lcom/unity3d/plugin/downloader/b/n;

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    invoke-direct {v7, v0, v1}, Lcom/unity3d/plugin/downloader/b/n;-><init>(Lcom/unity3d/plugin/downloader/b/h;Lcom/unity3d/plugin/downloader/b/p;)V

    const/4 v2, 0x0

    const/4 v1, 0x0

    :try_start_0
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->a:Landroid/content/Context;

    const-string v3, "power"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const/4 v3, 0x1

    const-string v4, "LVLDL"

    invoke-virtual {v0, v3, v4}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;
    :try_end_0
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_0 .. :try_end_0} :catch_1b
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_19
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    move-result-object v3

    :try_start_1
    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->acquire()V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->f:Ljava/lang/String;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/k;->a:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/unity3d/plugin/downloader/b/a;->a(Ljava/lang/String;Landroid/content/Context;)Lcom/unity3d/plugin/downloader/b/a;
    :try_end_1
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_1 .. :try_end_1} :catch_1c
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1a
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    move-result-object v4

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-nez v1, :cond_27

    :try_start_2
    invoke-virtual {v4}, Lcom/unity3d/plugin/downloader/b/a;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    iget-object v5, p0, Lcom/unity3d/plugin/downloader/b/k;->a:Landroid/content/Context;

    iget-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->h:Ljava/lang/String;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/b/k;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    invoke-virtual {v0}, Lcom/unity3d/plugin/downloader/b/p;->f()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {v5}, Landroid/net/Proxy;->getHost(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2

    new-instance v0, Lorg/apache/http/HttpHost;

    invoke-static {v5}, Landroid/net/Proxy;->getPort(Landroid/content/Context;)I

    move-result v5

    const-string v8, "http"

    invoke-direct {v0, v6, v5, v8}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    :goto_1
    invoke-static {v2, v0}, Lorg/apache/http/conn/params/ConnRouteParams;->setDefaultProxy(Lorg/apache/http/params/HttpParams;Lorg/apache/http/HttpHost;)V

    new-instance v5, Lorg/apache/http/client/methods/HttpGet;

    iget-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->h:Ljava/lang/String;

    invoke-direct {v5, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    new-instance v6, Lcom/unity3d/plugin/downloader/b/l;

    const/4 v0, 0x0

    invoke-direct {v6, v0}, Lcom/unity3d/plugin/downloader/b/l;-><init>(B)V

    const/16 v0, 0x1000

    new-array v8, v0, [B

    invoke-direct {p0}, Lcom/unity3d/plugin/downloader/b/k;->c()V

    iget-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/a/m;->b(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v2, 0x1ec

    const-string v6, "found invalid internal destination filename"

    invoke-direct {v0, p0, v2, v6}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0
    :try_end_3
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catch_0
    move-exception v0

    :try_start_4
    invoke-virtual {v5}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_4
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_0

    :catch_1
    move-exception v0

    move-object v2, v3

    move-object v3, v4

    :goto_2
    :try_start_5
    const-string v1, "LVLDL"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Aborting request for download "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-object v5, v5, Lcom/unity3d/plugin/downloader/b/h;->c:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/unity3d/plugin/downloader/b/o;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Lcom/unity3d/plugin/downloader/b/o;->printStackTrace()V

    iget v1, v0, Lcom/unity3d/plugin/downloader/b/o;->a:I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_0
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/unity3d/plugin/downloader/b/a;->a()V

    :cond_1
    invoke-static {v7, v1}, Lcom/unity3d/plugin/downloader/b/k;->a(Lcom/unity3d/plugin/downloader/b/n;I)V

    iget-boolean v2, v7, Lcom/unity3d/plugin/downloader/b/n;->c:Z

    iget v3, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    iget v4, v7, Lcom/unity3d/plugin/downloader/b/n;->e:I

    iget-boolean v5, v7, Lcom/unity3d/plugin/downloader/b/n;->g:Z

    iget-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/unity3d/plugin/downloader/b/k;->a(IZIIZ)V

    :goto_3
    return-void

    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    :cond_3
    :try_start_6
    new-instance v0, Ljava/io/File;

    iget-object v2, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v9

    const-wide/16 v11, 0x0

    cmp-long v2, v9, v11

    if-nez v2, :cond_b

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    const/4 v0, 0x0

    iput-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    :cond_4
    :goto_4
    iget-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->b:Ljava/io/FileOutputStream;

    if-eqz v0, :cond_5

    invoke-static {v7}, Lcom/unity3d/plugin/downloader/b/k;->a(Lcom/unity3d/plugin/downloader/b/n;)V

    :cond_5
    iget-boolean v0, v6, Lcom/unity3d/plugin/downloader/b/l;->d:Z

    if-eqz v0, :cond_7

    iget-object v0, v6, Lcom/unity3d/plugin/downloader/b/l;->c:Ljava/lang/String;

    if-eqz v0, :cond_6

    const-string v0, "If-Match"

    iget-object v2, v6, Lcom/unity3d/plugin/downloader/b/l;->c:Ljava/lang/String;

    invoke-virtual {v5, v0, v2}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    const-string v0, "Range"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v9, "bytes="

    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v9, v6, Lcom/unity3d/plugin/downloader/b/l;->a:I

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v9, "-"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v0, v2}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    invoke-direct {p0}, Lcom/unity3d/plugin/downloader/b/k;->b()V

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->e:Lcom/unity3d/plugin/downloader/b/i;

    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Lcom/unity3d/plugin/downloader/b/i;->a(I)V

    invoke-direct {p0, v7, v4, v5}, Lcom/unity3d/plugin/downloader/b/k;->a(Lcom/unity3d/plugin/downloader/b/n;Lcom/unity3d/plugin/downloader/b/a;Lorg/apache/http/client/methods/HttpGet;)Lorg/apache/http/HttpResponse;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    const/16 v0, 0x1f7

    if-ne v2, v0, :cond_11

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget v0, v0, Lcom/unity3d/plugin/downloader/b/h;->j:I

    const/4 v10, 0x5

    if-ge v0, v10, :cond_11

    const/4 v0, 0x1

    iput-boolean v0, v7, Lcom/unity3d/plugin/downloader/b/n;->c:Z

    const-string v0, "Retry-After"

    invoke-interface {v9, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;
    :try_end_6
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v0

    if-eqz v0, :cond_8

    :try_start_7
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    iget v0, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    if-gez v0, :cond_e

    const/4 v0, 0x0

    iput v0, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :cond_8
    :goto_5
    :try_start_8
    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v2, 0xc2

    const-string v6, "got 503 Service Unavailable, will retry later"

    invoke-direct {v0, p0, v2, v6}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0
    :try_end_8
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :catchall_0
    move-exception v0

    :try_start_9
    invoke-virtual {v5}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    throw v0
    :try_end_9
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :catch_2
    move-exception v0

    :goto_6
    :try_start_a
    const-string v1, "LVLDL"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, "Exception for "

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-object v5, v5, Lcom/unity3d/plugin/downloader/b/h;->c:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, ": "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    if-eqz v3, :cond_9

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_9
    if-eqz v4, :cond_a

    invoke-virtual {v4}, Lcom/unity3d/plugin/downloader/b/a;->a()V

    :cond_a
    const/16 v0, 0x1eb

    invoke-static {v7, v0}, Lcom/unity3d/plugin/downloader/b/k;->a(Lcom/unity3d/plugin/downloader/b/n;I)V

    const/16 v1, 0x1eb

    iget-boolean v2, v7, Lcom/unity3d/plugin/downloader/b/n;->c:Z

    iget v3, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    iget v4, v7, Lcom/unity3d/plugin/downloader/b/n;->e:I

    iget-boolean v5, v7, Lcom/unity3d/plugin/downloader/b/n;->g:Z

    iget-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/unity3d/plugin/downloader/b/k;->a(IZIIZ)V

    goto/16 :goto_3

    :cond_b
    :try_start_b
    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-object v2, v2, Lcom/unity3d/plugin/downloader/b/h;->d:Ljava/lang/String;

    if-nez v2, :cond_c

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v2, 0x1e9

    const-string v6, "Trying to resume a download that can\'t be resumed"

    invoke-direct {v0, p0, v2, v6}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0
    :try_end_b
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    :cond_c
    :try_start_c
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v2, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    const/4 v11, 0x1

    invoke-direct {v0, v2, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    iput-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->b:Ljava/io/FileOutputStream;
    :try_end_c
    .catch Ljava/io/FileNotFoundException; {:try_start_c .. :try_end_c} :catch_3
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    long-to-int v0, v9

    :try_start_d
    iput v0, v6, Lcom/unity3d/plugin/downloader/b/l;->a:I

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-wide v9, v0, Lcom/unity3d/plugin/downloader/b/h;->e:J

    const-wide/16 v11, -0x1

    cmp-long v0, v9, v11

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-wide v9, v0, Lcom/unity3d/plugin/downloader/b/h;->e:J

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/unity3d/plugin/downloader/b/l;->e:Ljava/lang/String;

    :cond_d
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/b/h;->d:Ljava/lang/String;

    iput-object v0, v6, Lcom/unity3d/plugin/downloader/b/l;->c:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, v6, Lcom/unity3d/plugin/downloader/b/l;->d:Z

    goto/16 :goto_4

    :catch_3
    move-exception v0

    new-instance v2, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v6, 0x1ec

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "while opening destination for resuming: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, p0, v6, v8, v0}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_d
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    :cond_e
    :try_start_e
    iget v0, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    const/16 v2, 0x1e

    if-ge v0, v2, :cond_10

    const/16 v0, 0x1e

    iput v0, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    :cond_f
    :goto_7
    iget v0, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    sget-object v2, Lcom/unity3d/plugin/downloader/a/m;->a:Ljava/util/Random;

    const/16 v6, 0x1f

    invoke-virtual {v2, v6}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    add-int/2addr v0, v2

    iput v0, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    iget v0, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    mul-int/lit16 v0, v0, 0x3e8

    iput v0, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    goto/16 :goto_5

    :catch_4
    move-exception v0

    goto/16 :goto_5

    :cond_10
    iget v0, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    const v2, 0x15180

    if-le v0, v2, :cond_f

    const v0, 0x15180

    iput v0, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I
    :try_end_e
    .catch Ljava/lang/NumberFormatException; {:try_start_e .. :try_end_e} :catch_4
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_e .. :try_end_e} :catch_0
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_7

    :cond_11
    const/16 v0, 0x12d

    if-eq v2, v0, :cond_12

    const/16 v0, 0x12e

    if-eq v2, v0, :cond_12

    const/16 v0, 0x12f

    if-eq v2, v0, :cond_12

    const/16 v0, 0x133

    if-ne v2, v0, :cond_16

    :cond_12
    :try_start_f
    iget v0, v7, Lcom/unity3d/plugin/downloader/b/n;->e:I

    const/4 v10, 0x5

    if-lt v0, v10, :cond_13

    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v2, 0x1f1

    const-string v6, "too many redirects"

    invoke-direct {v0, p0, v2, v6}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0

    :cond_13
    const-string v0, "Location"

    invoke-interface {v9, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;
    :try_end_f
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_f .. :try_end_f} :catch_0
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    move-result-object v0

    if-eqz v0, :cond_16

    :try_start_10
    new-instance v6, Ljava/net/URI;

    iget-object v8, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-object v8, v8, Lcom/unity3d/plugin/downloader/b/h;->a:Ljava/lang/String;

    invoke-direct {v6, v8}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    new-instance v8, Ljava/net/URI;

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v8}, Ljava/net/URI;->resolve(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;
    :try_end_10
    .catch Ljava/net/URISyntaxException; {:try_start_10 .. :try_end_10} :catch_5
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_10 .. :try_end_10} :catch_0
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    move-result-object v0

    :try_start_11
    iget v6, v7, Lcom/unity3d/plugin/downloader/b/n;->e:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v7, Lcom/unity3d/plugin/downloader/b/n;->e:I

    iput-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->h:Ljava/lang/String;

    const/16 v6, 0x12d

    if-eq v2, v6, :cond_14

    const/16 v6, 0x12f

    if-ne v2, v6, :cond_15

    :cond_14
    iput-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->f:Ljava/lang/String;

    :cond_15
    new-instance v0, Lcom/unity3d/plugin/downloader/b/m;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/unity3d/plugin/downloader/b/m;-><init>(Lcom/unity3d/plugin/downloader/b/k;B)V

    throw v0

    :catch_5
    move-exception v0

    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v2, 0x1ef

    const-string v6, "Couldn\'t resolve redirect URI"

    invoke-direct {v0, p0, v2, v6}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0

    :cond_16
    iget-boolean v0, v6, Lcom/unity3d/plugin/downloader/b/l;->d:Z

    if-eqz v0, :cond_17

    const/16 v0, 0xce

    :goto_8
    if-eq v2, v0, :cond_1b

    invoke-static {v2}, Lcom/unity3d/plugin/downloader/b/p;->b(I)Z

    move-result v0

    if-eqz v0, :cond_18

    move v0, v2

    :goto_9
    new-instance v6, Lcom/unity3d/plugin/downloader/b/o;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "http error "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v6, p0, v0, v2}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v6

    :cond_17
    const/16 v0, 0xc8

    goto :goto_8

    :cond_18
    const/16 v0, 0x12c

    if-lt v2, v0, :cond_19

    const/16 v0, 0x190

    if-ge v2, v0, :cond_19

    const/16 v0, 0x1ed

    goto :goto_9

    :cond_19
    iget-boolean v0, v6, Lcom/unity3d/plugin/downloader/b/l;->d:Z

    if-eqz v0, :cond_1a

    const/16 v0, 0xc8

    if-ne v2, v0, :cond_1a

    const/16 v0, 0x1e9

    goto :goto_9

    :cond_1a
    const/16 v0, 0x1ee

    goto :goto_9

    :cond_1b
    const/4 v0, 0x0

    iput v0, v7, Lcom/unity3d/plugin/downloader/b/n;->e:I

    iget-boolean v0, v6, Lcom/unity3d/plugin/downloader/b/l;->d:Z

    if-nez v0, :cond_26

    const-string v0, "Content-Disposition"

    invoke-interface {v9, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-eqz v0, :cond_1c

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/unity3d/plugin/downloader/b/l;->f:Ljava/lang/String;

    :cond_1c
    const-string v0, "Content-Location"

    invoke-interface {v9, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-eqz v0, :cond_1d

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/unity3d/plugin/downloader/b/l;->g:Ljava/lang/String;

    :cond_1d
    const-string v0, "ETag"

    invoke-interface {v9, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-eqz v0, :cond_1e

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/unity3d/plugin/downloader/b/l;->c:Ljava/lang/String;

    :cond_1e
    const/4 v0, 0x0

    const-string v2, "Transfer-Encoding"

    invoke-interface {v9, v2}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    if-eqz v2, :cond_1f

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    :cond_1f
    const-string v2, "Content-Type"

    invoke-interface {v9, v2}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    if-eqz v2, :cond_20

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    const-string v10, "application/vnd.android.obb"

    invoke-virtual {v2, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_20

    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v2, 0x1e7

    const-string v6, "file delivered with incorrect Mime type"

    invoke-direct {v0, p0, v2, v6}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0

    :cond_20
    if-nez v0, :cond_21

    const-string v2, "Content-Length"

    invoke-interface {v9, v2}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    if-eqz v2, :cond_21

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lcom/unity3d/plugin/downloader/b/l;->e:Ljava/lang/String;

    iget-object v2, v6, Lcom/unity3d/plugin/downloader/b/l;->e:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    const-wide/16 v12, -0x1

    cmp-long v2, v10, v12

    if-eqz v2, :cond_21

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-wide v12, v2, Lcom/unity3d/plugin/downloader/b/h;->e:J

    cmp-long v2, v10, v12

    if-eqz v2, :cond_21

    const-string v2, "LVLDL"

    const-string v10, "Incorrect file size delivered."

    invoke-static {v2, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_21
    iget-object v2, v6, Lcom/unity3d/plugin/downloader/b/l;->e:Ljava/lang/String;

    if-nez v2, :cond_23

    if-eqz v0, :cond_22

    const-string v2, "chunked"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_23

    :cond_22
    const/4 v0, 0x1

    :goto_a
    if-eqz v0, :cond_24

    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v2, 0x1ef

    const-string v6, "can\'t know size of download, giving up"

    invoke-direct {v0, p0, v2, v6}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0
    :try_end_11
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_11 .. :try_end_11} :catch_0
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    :cond_23
    const/4 v0, 0x0

    goto :goto_a

    :cond_24
    :try_start_12
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-object v2, v2, Lcom/unity3d/plugin/downloader/b/h;->c:Ljava/lang/String;

    iget-object v10, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-wide v10, v10, Lcom/unity3d/plugin/downloader/b/h;->e:J

    invoke-virtual {v0, v2, v10, v11}, Lcom/unity3d/plugin/downloader/b/p;->a(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;
    :try_end_12
    .catch Lcom/unity3d/plugin/downloader/b/q; {:try_start_12 .. :try_end_12} :catch_6
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_12 .. :try_end_12} :catch_0
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    :try_start_13
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v2, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    iput-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->b:Ljava/io/FileOutputStream;
    :try_end_13
    .catch Ljava/io/FileNotFoundException; {:try_start_13 .. :try_end_13} :catch_7
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_13 .. :try_end_13} :catch_0
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    :cond_25
    :goto_b
    :try_start_14
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-object v2, v6, Lcom/unity3d/plugin/downloader/b/l;->c:Ljava/lang/String;

    iput-object v2, v0, Lcom/unity3d/plugin/downloader/b/h;->d:Ljava/lang/String;

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/k;->d:Lcom/unity3d/plugin/downloader/b/u;

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    invoke-virtual {v0, v2}, Lcom/unity3d/plugin/downloader/b/u;->b(Lcom/unity3d/plugin/downloader/b/h;)Z

    invoke-direct {p0}, Lcom/unity3d/plugin/downloader/b/k;->b()V

    :cond_26
    invoke-direct {p0, v7, v9}, Lcom/unity3d/plugin/downloader/b/k;->a(Lcom/unity3d/plugin/downloader/b/n;Lorg/apache/http/HttpResponse;)Ljava/io/InputStream;

    move-result-object v0

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/k;->e:Lcom/unity3d/plugin/downloader/b/i;

    const/4 v9, 0x4

    invoke-virtual {v2, v9}, Lcom/unity3d/plugin/downloader/b/i;->a(I)V

    invoke-direct {p0, v7, v6, v8, v0}, Lcom/unity3d/plugin/downloader/b/k;->a(Lcom/unity3d/plugin/downloader/b/n;Lcom/unity3d/plugin/downloader/b/l;[BLjava/io/InputStream;)V
    :try_end_14
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_14 .. :try_end_14} :catch_0
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    const/4 v0, 0x1

    :try_start_15
    invoke-virtual {v5}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_15
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_15 .. :try_end_15} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_15} :catch_2
    .catchall {:try_start_15 .. :try_end_15} :catchall_1

    move v1, v0

    goto/16 :goto_0

    :catch_6
    move-exception v0

    :try_start_16
    new-instance v2, Lcom/unity3d/plugin/downloader/b/o;

    iget v6, v0, Lcom/unity3d/plugin/downloader/b/q;->a:I

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/b/q;->b:Ljava/lang/String;

    invoke-direct {v2, p0, v6, v0}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v2

    :catch_7
    move-exception v0

    new-instance v2, Ljava/io/File;

    iget-object v10, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    invoke-static {v10}, Lcom/unity3d/plugin/downloader/a/m;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v2, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_16
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_16 .. :try_end_16} :catch_0
    .catchall {:try_start_16 .. :try_end_16} :catchall_0

    :try_start_17
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-eqz v2, :cond_25

    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v10, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    invoke-direct {v2, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    iput-object v2, v7, Lcom/unity3d/plugin/downloader/b/n;->b:Ljava/io/FileOutputStream;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_8
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_17 .. :try_end_17} :catch_0
    .catchall {:try_start_17 .. :try_end_17} :catchall_0

    goto :goto_b

    :catch_8
    move-exception v2

    :try_start_18
    new-instance v2, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v6, 0x1ec

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "while opening destination file: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, p0, v6, v8, v0}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_18
    .catch Lcom/unity3d/plugin/downloader/b/m; {:try_start_18 .. :try_end_18} :catch_0
    .catchall {:try_start_18 .. :try_end_18} :catchall_0

    :cond_27
    const/4 v2, 0x0

    :try_start_19
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    const/4 v5, 0x1

    invoke-direct {v1, v0, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V
    :try_end_19
    .catch Ljava/io/FileNotFoundException; {:try_start_19 .. :try_end_19} :catch_b
    .catch Ljava/io/SyncFailedException; {:try_start_19 .. :try_end_19} :catch_e
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_19} :catch_11
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_19} :catch_14
    .catchall {:try_start_19 .. :try_end_19} :catchall_2

    :try_start_1a
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_1a
    .catch Ljava/io/FileNotFoundException; {:try_start_1a .. :try_end_1a} :catch_20
    .catch Ljava/io/SyncFailedException; {:try_start_1a .. :try_end_1a} :catch_1f
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1a} :catch_1e
    .catch Ljava/lang/RuntimeException; {:try_start_1a .. :try_end_1a} :catch_1d
    .catchall {:try_start_1a .. :try_end_1a} :catchall_6

    :try_start_1b
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_1b} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_1b .. :try_end_1b} :catch_a
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_1b .. :try_end_1b} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_1b} :catch_2
    .catchall {:try_start_1b .. :try_end_1b} :catchall_1

    :cond_28
    :goto_c
    :try_start_1c
    iget-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/k;->c:Lcom/unity3d/plugin/downloader/b/p;

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-object v2, v2, Lcom/unity3d/plugin/downloader/b/h;->c:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/unity3d/plugin/downloader/a/m;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2d

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-wide v5, v1, Lcom/unity3d/plugin/downloader/b/h;->e:J

    const-wide/16 v8, -0x1

    cmp-long v1, v5, v8

    if-eqz v1, :cond_2c

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-wide v5, v1, Lcom/unity3d/plugin/downloader/b/h;->f:J

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/k;->b:Lcom/unity3d/plugin/downloader/b/h;

    iget-wide v8, v1, Lcom/unity3d/plugin/downloader/b/h;->e:J

    cmp-long v1, v5, v8

    if-nez v1, :cond_2c

    invoke-virtual {v2, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_2d

    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v1, 0x1ec

    const-string v2, "unable to finalize destination file"

    invoke-direct {v0, p0, v1, v2}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0
    :try_end_1c
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_1c .. :try_end_1c} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_1c} :catch_2
    .catchall {:try_start_1c .. :try_end_1c} :catchall_1

    :catchall_1
    move-exception v0

    move-object v6, v0

    :goto_d
    if-eqz v3, :cond_29

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_29
    if-eqz v4, :cond_2a

    invoke-virtual {v4}, Lcom/unity3d/plugin/downloader/b/a;->a()V

    :cond_2a
    const/16 v0, 0x1eb

    invoke-static {v7, v0}, Lcom/unity3d/plugin/downloader/b/k;->a(Lcom/unity3d/plugin/downloader/b/n;I)V

    const/16 v1, 0x1eb

    iget-boolean v2, v7, Lcom/unity3d/plugin/downloader/b/n;->c:Z

    iget v3, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    iget v4, v7, Lcom/unity3d/plugin/downloader/b/n;->e:I

    iget-boolean v5, v7, Lcom/unity3d/plugin/downloader/b/n;->g:Z

    iget-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/unity3d/plugin/downloader/b/k;->a(IZIIZ)V

    throw v6

    :catch_9
    move-exception v0

    :try_start_1d
    const-string v1, "LVLDL"

    const-string v2, "IOException while closing synced file: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_c

    :catch_a
    move-exception v0

    const-string v1, "LVLDL"

    const-string v2, "exception while closing file: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1d
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_1d .. :try_end_1d} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_1d} :catch_2
    .catchall {:try_start_1d .. :try_end_1d} :catchall_1

    goto :goto_c

    :catch_b
    move-exception v0

    move-object v1, v2

    :goto_e
    :try_start_1e
    const-string v2, "LVLDL"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "file "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " not found: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_6

    if-eqz v1, :cond_28

    :try_start_1f
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_1f} :catch_c
    .catch Ljava/lang/RuntimeException; {:try_start_1f .. :try_end_1f} :catch_d
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_1f .. :try_end_1f} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1f .. :try_end_1f} :catch_2
    .catchall {:try_start_1f .. :try_end_1f} :catchall_1

    goto/16 :goto_c

    :catch_c
    move-exception v0

    :try_start_20
    const-string v1, "LVLDL"

    const-string v2, "IOException while closing synced file: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_c

    :catch_d
    move-exception v0

    const-string v1, "LVLDL"

    const-string v2, "exception while closing file: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_20
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_20 .. :try_end_20} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_20} :catch_2
    .catchall {:try_start_20 .. :try_end_20} :catchall_1

    goto/16 :goto_c

    :catch_e
    move-exception v0

    :goto_f
    :try_start_21
    const-string v1, "LVLDL"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "file "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " sync failed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_2

    if-eqz v2, :cond_28

    :try_start_22
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_22} :catch_f
    .catch Ljava/lang/RuntimeException; {:try_start_22 .. :try_end_22} :catch_10
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_22 .. :try_end_22} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_22 .. :try_end_22} :catch_2
    .catchall {:try_start_22 .. :try_end_22} :catchall_1

    goto/16 :goto_c

    :catch_f
    move-exception v0

    :try_start_23
    const-string v1, "LVLDL"

    const-string v2, "IOException while closing synced file: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_c

    :catch_10
    move-exception v0

    const-string v1, "LVLDL"

    const-string v2, "exception while closing file: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_23
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_23 .. :try_end_23} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_23 .. :try_end_23} :catch_2
    .catchall {:try_start_23 .. :try_end_23} :catchall_1

    goto/16 :goto_c

    :catch_11
    move-exception v0

    :goto_10
    :try_start_24
    const-string v1, "LVLDL"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "IOException trying to sync "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_2

    if-eqz v2, :cond_28

    :try_start_25
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_25} :catch_12
    .catch Ljava/lang/RuntimeException; {:try_start_25 .. :try_end_25} :catch_13
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_25 .. :try_end_25} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_25} :catch_2
    .catchall {:try_start_25 .. :try_end_25} :catchall_1

    goto/16 :goto_c

    :catch_12
    move-exception v0

    :try_start_26
    const-string v1, "LVLDL"

    const-string v2, "IOException while closing synced file: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_c

    :catch_13
    move-exception v0

    const-string v1, "LVLDL"

    const-string v2, "exception while closing file: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_26
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_26 .. :try_end_26} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_26 .. :try_end_26} :catch_2
    .catchall {:try_start_26 .. :try_end_26} :catchall_1

    goto/16 :goto_c

    :catch_14
    move-exception v0

    :goto_11
    :try_start_27
    const-string v1, "LVLDL"

    const-string v5, "exception while syncing file: "

    invoke-static {v1, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_2

    if-eqz v2, :cond_28

    :try_start_28
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_28} :catch_15
    .catch Ljava/lang/RuntimeException; {:try_start_28 .. :try_end_28} :catch_16
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_28 .. :try_end_28} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_28 .. :try_end_28} :catch_2
    .catchall {:try_start_28 .. :try_end_28} :catchall_1

    goto/16 :goto_c

    :catch_15
    move-exception v0

    :try_start_29
    const-string v1, "LVLDL"

    const-string v2, "IOException while closing synced file: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_c

    :catch_16
    move-exception v0

    const-string v1, "LVLDL"

    const-string v2, "exception while closing file: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_29
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_29 .. :try_end_29} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_29 .. :try_end_29} :catch_2
    .catchall {:try_start_29 .. :try_end_29} :catchall_1

    goto/16 :goto_c

    :catchall_2
    move-exception v0

    :goto_12
    if-eqz v2, :cond_2b

    :try_start_2a
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_2a} :catch_17
    .catch Ljava/lang/RuntimeException; {:try_start_2a .. :try_end_2a} :catch_18
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_2a .. :try_end_2a} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_2a} :catch_2
    .catchall {:try_start_2a .. :try_end_2a} :catchall_1

    :cond_2b
    :goto_13
    :try_start_2b
    throw v0

    :catch_17
    move-exception v1

    const-string v2, "LVLDL"

    const-string v5, "IOException while closing synced file: "

    invoke-static {v2, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_13

    :catch_18
    move-exception v1

    const-string v2, "LVLDL"

    const-string v5, "exception while closing file: "

    invoke-static {v2, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_13

    :cond_2c
    new-instance v0, Lcom/unity3d/plugin/downloader/b/o;

    const/16 v1, 0x1e7

    const-string v2, "file delivered with incorrect size. probably due to network not browser configured"

    invoke-direct {v0, p0, v1, v2}, Lcom/unity3d/plugin/downloader/b/o;-><init>(Lcom/unity3d/plugin/downloader/b/k;ILjava/lang/String;)V

    throw v0
    :try_end_2b
    .catch Lcom/unity3d/plugin/downloader/b/o; {:try_start_2b .. :try_end_2b} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_2b} :catch_2
    .catchall {:try_start_2b .. :try_end_2b} :catchall_1

    :cond_2d
    if-eqz v3, :cond_2e

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_2e
    if-eqz v4, :cond_2f

    invoke-virtual {v4}, Lcom/unity3d/plugin/downloader/b/a;->a()V

    :cond_2f
    const/16 v0, 0xc8

    invoke-static {v7, v0}, Lcom/unity3d/plugin/downloader/b/k;->a(Lcom/unity3d/plugin/downloader/b/n;I)V

    const/16 v1, 0xc8

    iget-boolean v2, v7, Lcom/unity3d/plugin/downloader/b/n;->c:Z

    iget v3, v7, Lcom/unity3d/plugin/downloader/b/n;->d:I

    iget v4, v7, Lcom/unity3d/plugin/downloader/b/n;->e:I

    iget-boolean v5, v7, Lcom/unity3d/plugin/downloader/b/n;->g:Z

    iget-object v0, v7, Lcom/unity3d/plugin/downloader/b/n;->a:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/unity3d/plugin/downloader/b/k;->a(IZIIZ)V

    goto/16 :goto_3

    :catchall_3
    move-exception v0

    move-object v6, v0

    move-object v3, v1

    move-object v4, v2

    goto/16 :goto_d

    :catchall_4
    move-exception v0

    move-object v6, v0

    move-object v4, v2

    goto/16 :goto_d

    :catchall_5
    move-exception v0

    move-object v6, v0

    move-object v4, v3

    move-object v3, v2

    goto/16 :goto_d

    :catch_19
    move-exception v0

    move-object v3, v1

    move-object v4, v2

    goto/16 :goto_6

    :catch_1a
    move-exception v0

    move-object v4, v2

    goto/16 :goto_6

    :catch_1b
    move-exception v0

    move-object v3, v2

    move-object v2, v1

    goto/16 :goto_2

    :catch_1c
    move-exception v0

    move-object v14, v3

    move-object v3, v2

    move-object v2, v14

    goto/16 :goto_2

    :catchall_6
    move-exception v0

    move-object v2, v1

    goto :goto_12

    :catch_1d
    move-exception v0

    move-object v2, v1

    goto/16 :goto_11

    :catch_1e
    move-exception v0

    move-object v2, v1

    goto/16 :goto_10

    :catch_1f
    move-exception v0

    move-object v2, v1

    goto/16 :goto_f

    :catch_20
    move-exception v0

    goto/16 :goto_e
.end method
