.class Lcom/playhaven/android/cache/BulkCacheDownloader;
.super Ljava/lang/Object;
.source "BulkCacheDownloader.java"

# interfaces
.implements Lcom/playhaven/android/cache/CacheResponseHandler;


# instance fields
.field private cache:Lcom/playhaven/android/cache/Cache;

.field private handler:Lcom/playhaven/android/cache/CacheResponseHandler;

.field private length:I

.field private responses:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList",
            "<",
            "Lcom/playhaven/android/cache/CachedInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/playhaven/android/cache/Cache;Lcom/playhaven/android/cache/CacheResponseHandler;Ljava/util/List;)V
    .locals 3
    .param p1, "cache"    # Lcom/playhaven/android/cache/Cache;
    .param p2, "handler"    # Lcom/playhaven/android/cache/CacheResponseHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/playhaven/android/cache/Cache;",
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
    .line 54
    .local p3, "urls":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->cache:Lcom/playhaven/android/cache/Cache;

    .line 57
    iput-object p2, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->handler:Lcom/playhaven/android/cache/CacheResponseHandler;

    .line 59
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v1, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->responses:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 60
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v1

    iput v1, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->length:I

    .line 61
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 63
    return-void

    .line 61
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 62
    .local v0, "url":Ljava/lang/String;
    invoke-virtual {p1, v0, p0}, Lcom/playhaven/android/cache/Cache;->request(Ljava/lang/String;Lcom/playhaven/android/cache/CacheResponseHandler;)V

    goto :goto_0
.end method

.method public varargs constructor <init>(Lcom/playhaven/android/cache/Cache;Lcom/playhaven/android/cache/CacheResponseHandler;[Ljava/lang/String;)V
    .locals 3
    .param p1, "cache"    # Lcom/playhaven/android/cache/Cache;
    .param p2, "handler"    # Lcom/playhaven/android/cache/CacheResponseHandler;
    .param p3, "urls"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->cache:Lcom/playhaven/android/cache/Cache;

    .line 77
    iput-object p2, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->handler:Lcom/playhaven/android/cache/CacheResponseHandler;

    .line 79
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v1, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->responses:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 80
    array-length v1, p3

    iput v1, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->length:I

    .line 81
    array-length v2, p3

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_0

    .line 83
    return-void

    .line 81
    :cond_0
    aget-object v0, p3, v1

    .line 82
    .local v0, "url":Ljava/lang/String;
    invoke-virtual {p1, v0, p0}, Lcom/playhaven/android/cache/Cache;->request(Ljava/lang/String;Lcom/playhaven/android/cache/CacheResponseHandler;)V

    .line 81
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public varargs constructor <init>(Lcom/playhaven/android/cache/Cache;Lcom/playhaven/android/cache/CacheResponseHandler;[Ljava/net/URL;)V
    .locals 3
    .param p1, "cache"    # Lcom/playhaven/android/cache/Cache;
    .param p2, "handler"    # Lcom/playhaven/android/cache/CacheResponseHandler;
    .param p3, "urls"    # [Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput-object p1, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->cache:Lcom/playhaven/android/cache/Cache;

    .line 96
    iput-object p2, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->handler:Lcom/playhaven/android/cache/CacheResponseHandler;

    .line 98
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v1, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->responses:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 99
    array-length v1, p3

    iput v1, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->length:I

    .line 100
    array-length v2, p3

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_0

    .line 102
    return-void

    .line 100
    :cond_0
    aget-object v0, p3, v1

    .line 101
    .local v0, "url":Ljava/net/URL;
    invoke-virtual {p1, v0, p0}, Lcom/playhaven/android/cache/Cache;->request(Ljava/net/URL;Lcom/playhaven/android/cache/CacheResponseHandler;)V

    .line 100
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public cacheFail(Ljava/net/URL;Lcom/playhaven/android/PlayHavenException;)V
    .locals 1
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "exception"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->handler:Lcom/playhaven/android/cache/CacheResponseHandler;

    invoke-interface {v0, p1, p2}, Lcom/playhaven/android/cache/CacheResponseHandler;->cacheFail(Ljava/net/URL;Lcom/playhaven/android/PlayHavenException;)V

    .line 131
    return-void
.end method

.method public varargs cacheSuccess([Lcom/playhaven/android/cache/CachedInfo;)V
    .locals 3
    .param p1, "cachedInfos"    # [Lcom/playhaven/android/cache/CachedInfo;

    .prologue
    .line 113
    iget-object v0, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->responses:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->addAll(Ljava/util/Collection;)Z

    .line 116
    iget-object v0, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->responses:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v0

    iget v1, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->length:I

    if-ge v0, v1, :cond_0

    .line 120
    :goto_0
    return-void

    .line 119
    :cond_0
    iget-object v1, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->handler:Lcom/playhaven/android/cache/CacheResponseHandler;

    iget-object v0, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->responses:Ljava/util/concurrent/CopyOnWriteArrayList;

    iget-object v2, p0, Lcom/playhaven/android/cache/BulkCacheDownloader;->responses:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v2

    new-array v2, v2, [Lcom/playhaven/android/cache/CachedInfo;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/playhaven/android/cache/CachedInfo;

    invoke-interface {v1, v0}, Lcom/playhaven/android/cache/CacheResponseHandler;->cacheSuccess([Lcom/playhaven/android/cache/CachedInfo;)V

    goto :goto_0
.end method
