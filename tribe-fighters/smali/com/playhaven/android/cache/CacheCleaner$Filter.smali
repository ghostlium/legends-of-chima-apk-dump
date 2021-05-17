.class Lcom/playhaven/android/cache/CacheCleaner$Filter;
.super Ljava/lang/Object;
.source "CacheCleaner.java"

# interfaces
.implements Ljava/io/FileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/cache/CacheCleaner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Filter"
.end annotation


# instance fields
.field private now:J

.field final synthetic this$0:Lcom/playhaven/android/cache/CacheCleaner;


# direct methods
.method public constructor <init>(Lcom/playhaven/android/cache/CacheCleaner;)V
    .locals 2

    .prologue
    .line 53
    iput-object p1, p0, Lcom/playhaven/android/cache/CacheCleaner$Filter;->this$0:Lcom/playhaven/android/cache/CacheCleaner;

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/playhaven/android/cache/CacheCleaner$Filter;->now:J

    .line 54
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/playhaven/android/cache/CacheCleaner$Filter;->now:J

    .line 55
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .locals 7
    .param p1, "pathname"    # Ljava/io/File;

    .prologue
    const/4 v2, 0x0

    .line 66
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 69
    :cond_0
    :goto_0
    return v2

    .line 67
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    .line 68
    .local v0, "modified":J
    iget-wide v3, p0, Lcom/playhaven/android/cache/CacheCleaner$Filter;->now:J

    cmp-long v3, v0, v3

    if-gtz v3, :cond_0

    .line 69
    iget-wide v3, p0, Lcom/playhaven/android/cache/CacheCleaner$Filter;->now:J

    sub-long/2addr v3, v0

    const-wide/32 v5, 0xa4cb800

    cmp-long v3, v3, v5

    if-lez v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0
.end method
