.class public Lcom/playhaven/android/cache/Cache;
.super Ljava/lang/Object;
.source "Cache.java"


# static fields
.field public static final CACHE_DIR:Ljava/lang/String; = "playhaven.cache"


# instance fields
.field private cacheDir:Ljava/io/File;

.field private pool:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 60
    .local v0, "appContext":Landroid/content/Context;
    const-string v1, "playhaven.cache"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lcom/playhaven/android/cache/Cache;->cacheDir:Ljava/io/File;

    .line 62
    iget-object v1, p0, Lcom/playhaven/android/cache/Cache;->cacheDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/playhaven/android/cache/Cache;->cacheDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_1

    .line 63
    new-instance v2, Lcom/playhaven/android/PlayHavenException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v1, "Unable to access cache"

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/playhaven/android/cache/Cache;->cacheDir:Ljava/io/File;

    if-nez v1, :cond_0

    const-string v1, ""

    :goto_0
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, ": "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/playhaven/android/cache/Cache;->cacheDir:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 65
    :cond_1
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    iput-object v1, p0, Lcom/playhaven/android/cache/Cache;->pool:Ljava/util/concurrent/ExecutorService;

    .line 66
    iget-object v1, p0, Lcom/playhaven/android/cache/Cache;->pool:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/playhaven/android/cache/CacheCleaner;

    iget-object v3, p0, Lcom/playhaven/android/cache/Cache;->cacheDir:Ljava/io/File;

    invoke-direct {v2, v3}, Lcom/playhaven/android/cache/CacheCleaner;-><init>(Ljava/io/File;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 67
    return-void
.end method

.method private existsInCache(Ljava/io/File;)Z
    .locals 5
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 91
    if-nez p1, :cond_0

    new-instance v0, Lcom/playhaven/android/PlayHavenException;

    const-string v1, "Invalid file: null"

    invoke-direct {v0, v1}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v0, Lcom/playhaven/android/PlayHavenException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "File is a directory: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_3

    .line 96
    :cond_2
    :goto_0
    return v0

    .line 94
    :cond_3
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2

    .line 96
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private getFileName(Ljava/net/URL;)Ljava/lang/String;
    .locals 3
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 107
    invoke-virtual {p1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, "path":Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 109
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 111
    :cond_0
    const-string v1, "/"

    const-string v2, "|"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private touch(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 225
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/io/File;->setLastModified(J)Z

    .line 226
    return-void
.end method


# virtual methods
.method public bulkRequest(Lcom/playhaven/android/cache/CacheResponseHandler;Ljava/util/List;)V
    .locals 1
    .param p1, "handler"    # Lcom/playhaven/android/cache/CacheResponseHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/playhaven/android/cache/CacheResponseHandler;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 186
    .local p2, "urls":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/playhaven/android/cache/BulkCacheDownloader;

    invoke-direct {v0, p0, p1, p2}, Lcom/playhaven/android/cache/BulkCacheDownloader;-><init>(Lcom/playhaven/android/cache/Cache;Lcom/playhaven/android/cache/CacheResponseHandler;Ljava/util/List;)V

    .line 187
    return-void
.end method

.method public varargs bulkRequest(Lcom/playhaven/android/cache/CacheResponseHandler;[Ljava/lang/String;)V
    .locals 1
    .param p1, "handler"    # Lcom/playhaven/android/cache/CacheResponseHandler;
    .param p2, "urls"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 201
    new-instance v0, Lcom/playhaven/android/cache/BulkCacheDownloader;

    invoke-direct {v0, p0, p1, p2}, Lcom/playhaven/android/cache/BulkCacheDownloader;-><init>(Lcom/playhaven/android/cache/Cache;Lcom/playhaven/android/cache/CacheResponseHandler;[Ljava/lang/String;)V

    .line 202
    return-void
.end method

.method public varargs bulkRequest(Lcom/playhaven/android/cache/CacheResponseHandler;[Ljava/net/URL;)V
    .locals 1
    .param p1, "handler"    # Lcom/playhaven/android/cache/CacheResponseHandler;
    .param p2, "urls"    # [Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 215
    new-instance v0, Lcom/playhaven/android/cache/BulkCacheDownloader;

    invoke-direct {v0, p0, p1, p2}, Lcom/playhaven/android/cache/BulkCacheDownloader;-><init>(Lcom/playhaven/android/cache/Cache;Lcom/playhaven/android/cache/CacheResponseHandler;[Ljava/net/URL;)V

    .line 216
    return-void
.end method

.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 74
    iget-object v0, p0, Lcom/playhaven/android/cache/Cache;->pool:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/playhaven/android/cache/Cache;->pool:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/playhaven/android/cache/Cache;->pool:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 77
    :cond_0
    iput-object v1, p0, Lcom/playhaven/android/cache/Cache;->pool:Ljava/util/concurrent/ExecutorService;

    .line 78
    iput-object v1, p0, Lcom/playhaven/android/cache/Cache;->cacheDir:Ljava/io/File;

    .line 79
    return-void
.end method

.method public getFile(Ljava/net/URL;)Ljava/io/File;
    .locals 3
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 134
    invoke-direct {p0, p1}, Lcom/playhaven/android/cache/Cache;->getFileName(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v0

    .line 135
    .local v0, "fileName":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/playhaven/android/cache/Cache;->cacheDir:Ljava/io/File;

    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method public request(Ljava/lang/String;Lcom/playhaven/android/cache/CacheResponseHandler;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "handler"    # Lcom/playhaven/android/cache/CacheResponseHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 125
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2}, Lcom/playhaven/android/cache/Cache;->request(Ljava/net/URL;Lcom/playhaven/android/cache/CacheResponseHandler;)V

    .line 126
    return-void
.end method

.method public request(Ljava/net/URL;Lcom/playhaven/android/cache/CacheResponseHandler;)V
    .locals 6
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "handler"    # Lcom/playhaven/android/cache/CacheResponseHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 153
    :try_start_0
    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v2

    .line 155
    .local v2, "normalized":Ljava/lang/String;
    const-string v3, " "

    const-string v4, "%20"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 156
    new-instance p1, Ljava/net/URL;

    .end local p1    # "url":Ljava/net/URL;
    invoke-direct {p1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .restart local p1    # "url":Ljava/net/URL;
    invoke-virtual {p0, p1}, Lcom/playhaven/android/cache/Cache;->getFile(Ljava/net/URL;)Ljava/io/File;

    move-result-object v1

    .line 163
    .local v1, "file":Ljava/io/File;
    invoke-direct {p0, v1}, Lcom/playhaven/android/cache/Cache;->existsInCache(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 165
    invoke-direct {p0, v1}, Lcom/playhaven/android/cache/Cache;->touch(Ljava/io/File;)V

    .line 166
    const/4 v3, 0x1

    new-array v3, v3, [Lcom/playhaven/android/cache/CachedInfo;

    new-instance v4, Lcom/playhaven/android/cache/CachedInfo;

    invoke-direct {v4, p1, v1, v5}, Lcom/playhaven/android/cache/CachedInfo;-><init>(Ljava/net/URL;Ljava/io/File;Z)V

    aput-object v4, v3, v5

    invoke-interface {p2, v3}, Lcom/playhaven/android/cache/CacheResponseHandler;->cacheSuccess([Lcom/playhaven/android/cache/CachedInfo;)V

    .line 172
    :goto_0
    return-void

    .line 157
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "normalized":Ljava/lang/String;
    .end local p1    # "url":Ljava/net/URL;
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v3, Lcom/playhaven/android/PlayHavenException;

    invoke-direct {v3, v0}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 170
    .end local v0    # "e":Ljava/net/MalformedURLException;
    .restart local v1    # "file":Ljava/io/File;
    .restart local v2    # "normalized":Ljava/lang/String;
    .restart local p1    # "url":Ljava/net/URL;
    :cond_0
    iget-object v3, p0, Lcom/playhaven/android/cache/Cache;->pool:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Lcom/playhaven/android/cache/CacheDownloader;

    invoke-direct {v4, p1, p2, v1}, Lcom/playhaven/android/cache/CacheDownloader;-><init>(Ljava/net/URL;Lcom/playhaven/android/cache/CacheResponseHandler;Ljava/io/File;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    goto :goto_0
.end method
