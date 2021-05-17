.class Lcom/playhaven/android/req/OpenRequest$1;
.super Ljava/lang/Object;
.source "OpenRequest.java"

# interfaces
.implements Lcom/playhaven/android/cache/CacheResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/req/OpenRequest;->handleResponse(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/req/OpenRequest;


# direct methods
.method constructor <init>(Lcom/playhaven/android/req/OpenRequest;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/req/OpenRequest$1;->this$0:Lcom/playhaven/android/req/OpenRequest;

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cacheFail(Ljava/net/URL;Lcom/playhaven/android/PlayHavenException;)V
    .locals 0
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "exception"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 117
    return-void
.end method

.method public varargs cacheSuccess([Lcom/playhaven/android/cache/CachedInfo;)V
    .locals 0
    .param p1, "cachedInfos"    # [Lcom/playhaven/android/cache/CachedInfo;

    .prologue
    .line 112
    return-void
.end method
