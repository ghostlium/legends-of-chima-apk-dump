.class public interface abstract Lcom/amazon/ags/storage/OfflineDataCache;
.super Ljava/lang/Object;
.source "OfflineDataCache.java"


# virtual methods
.method public abstract batchRemoveCachedItems(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract clear()V
.end method

.method public abstract getAllCacheItems()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getCacheItem(Ljava/lang/String;)Lorg/json/JSONObject;
.end method

.method public abstract queryCacheItems(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end method

.method public abstract removeCachedItem(Ljava/lang/String;)V
.end method

.method public abstract removeCachedItems(Ljava/lang/String;)V
.end method

.method public abstract setCacheItem(Lcom/amazon/ags/storage/OfflineCacheRequest;)V
.end method

.method public abstract setCacheItem(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
.end method

.method public abstract setCacheItems(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/storage/OfflineCacheRequest;",
            ">;)V"
        }
    .end annotation
.end method
