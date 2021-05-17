.class public Lcom/playhaven/android/cache/CachedInfo;
.super Ljava/lang/Object;
.source "CachedInfo.java"


# instance fields
.field private file:Ljava/io/File;

.field private newlyDownloaded:Z

.field private url:Ljava/net/URL;


# direct methods
.method public constructor <init>(Ljava/net/URL;Ljava/io/File;Z)V
    .locals 0
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "newlyDownloaded"    # Z

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/playhaven/android/cache/CachedInfo;->url:Ljava/net/URL;

    .line 45
    iput-object p2, p0, Lcom/playhaven/android/cache/CachedInfo;->file:Ljava/io/File;

    .line 46
    iput-boolean p3, p0, Lcom/playhaven/android/cache/CachedInfo;->newlyDownloaded:Z

    .line 47
    return-void
.end method


# virtual methods
.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/playhaven/android/cache/CachedInfo;->file:Ljava/io/File;

    return-object v0
.end method

.method public getURL()Ljava/net/URL;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/playhaven/android/cache/CachedInfo;->url:Ljava/net/URL;

    return-object v0
.end method

.method public isNewlyDownloaded()Z
    .locals 1

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/playhaven/android/cache/CachedInfo;->newlyDownloaded:Z

    return v0
.end method
