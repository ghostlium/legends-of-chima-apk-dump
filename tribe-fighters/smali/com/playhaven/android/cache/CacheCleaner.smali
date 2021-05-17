.class public Lcom/playhaven/android/cache/CacheCleaner;
.super Ljava/lang/Object;
.source "CacheCleaner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/playhaven/android/cache/CacheCleaner$Filter;
    }
.end annotation


# static fields
.field private static final EXPIRY:J = 0xa4cb800L


# instance fields
.field private cacheDir:Ljava/io/File;


# direct methods
.method protected constructor <init>(Ljava/io/File;)V
    .locals 0
    .param p1, "cacheDir"    # Ljava/io/File;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/playhaven/android/cache/CacheCleaner;->cacheDir:Ljava/io/File;

    .line 45
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 80
    iget-object v2, p0, Lcom/playhaven/android/cache/CacheCleaner;->cacheDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_0

    .line 93
    :goto_0
    return-void

    .line 84
    :cond_0
    const/4 v0, 0x0

    .line 85
    .local v0, "deleted":I
    iget-object v2, p0, Lcom/playhaven/android/cache/CacheCleaner;->cacheDir:Ljava/io/File;

    new-instance v4, Lcom/playhaven/android/cache/CacheCleaner$Filter;

    invoke-direct {v4, p0}, Lcom/playhaven/android/cache/CacheCleaner$Filter;-><init>(Lcom/playhaven/android/cache/CacheCleaner;)V

    invoke-virtual {v2, v4}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v4

    array-length v5, v4

    move v2, v3

    :goto_1
    if-lt v2, v5, :cond_1

    .line 92
    const-string v2, "%d files deleted from cache"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v3

    invoke-static {v2, v4}, Lcom/playhaven/android/PlayHaven;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 85
    :cond_1
    aget-object v1, v4, v2

    .line 87
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v6

    if-nez v6, :cond_2

    .line 88
    invoke-virtual {v1}, Ljava/io/File;->deleteOnExit()V

    .line 90
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 85
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method
