.class Lcom/playhaven/android/PlayHaven$1;
.super Ljava/lang/Object;
.source "PlayHaven.java"

# interfaces
.implements Lcom/playhaven/android/cache/CacheResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/PlayHaven;->configure(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/PlayHaven$1;->val$context:Landroid/content/Context;

    .line 342
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cacheFail(Ljava/net/URL;Lcom/playhaven/android/PlayHavenException;)V
    .locals 0
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "exception"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 359
    invoke-static {p2}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/Throwable;)V

    .line 360
    return-void
.end method

.method public varargs cacheSuccess([Lcom/playhaven/android/cache/CachedInfo;)V
    .locals 3
    .param p1, "cachedInfos"    # [Lcom/playhaven/android/cache/CachedInfo;

    .prologue
    .line 348
    :try_start_0
    iget-object v1, p0, Lcom/playhaven/android/PlayHaven$1;->val$context:Landroid/content/Context;

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {v2}, Lcom/playhaven/android/cache/CachedInfo;->getFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/playhaven/android/PlayHaven;->configure(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_0 .. :try_end_0} :catch_0

    .line 353
    :goto_0
    return-void

    .line 350
    :catch_0
    move-exception v0

    .line 351
    .local v0, "exception":Lcom/playhaven/android/PlayHavenException;
    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
