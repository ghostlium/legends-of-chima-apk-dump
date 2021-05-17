.class public Lcom/playhaven/android/util/MemoryReporter;
.super Ljava/lang/Object;
.source "MemoryReporter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/playhaven/android/util/MemoryReporter$Size;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static normalize(D)Ljava/lang/String;
    .locals 8
    .param p0, "bytesToReport"    # D

    .prologue
    .line 47
    invoke-static {}, Lcom/playhaven/android/util/MemoryReporter$Size;->values()[Lcom/playhaven/android/util/MemoryReporter$Size;

    move-result-object v3

    array-length v1, v3

    .line 48
    .local v1, "length":I
    move v0, v1

    .local v0, "i":I
    :goto_0
    if-gtz v0, :cond_0

    .line 56
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0, p1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_1
    return-object v3

    .line 50
    :cond_0
    invoke-static {}, Lcom/playhaven/android/util/MemoryReporter$Size;->values()[Lcom/playhaven/android/util/MemoryReporter$Size;

    move-result-object v3

    add-int/lit8 v4, v0, -0x1

    aget-object v2, v3, v4

    .line 52
    .local v2, "size":Lcom/playhaven/android/util/MemoryReporter$Size;
    iget-wide v3, v2, Lcom/playhaven/android/util/MemoryReporter$Size;->bytes:D

    cmpl-double v3, p0, v3

    if-ltz v3, :cond_1

    .line 53
    iget-object v3, v2, Lcom/playhaven/android/util/MemoryReporter$Size;->format:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-wide v6, v2, Lcom/playhaven/android/util/MemoryReporter$Size;->bytes:D

    div-double v6, p0, v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 48
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public static report()V
    .locals 11

    .prologue
    .line 66
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v2

    .line 67
    .local v2, "totalMemory":J
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v0

    .line 68
    .local v0, "freeMemory":J
    sub-long v4, v2, v0

    .line 69
    .local v4, "usedMemory":J
    const-string v6, "Memory [Total: %s] [Free: %s] [Used: %s]"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    long-to-double v9, v2

    invoke-static {v9, v10}, Lcom/playhaven/android/util/MemoryReporter;->normalize(D)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    long-to-double v9, v0

    invoke-static {v9, v10}, Lcom/playhaven/android/util/MemoryReporter;->normalize(D)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    long-to-double v9, v4

    invoke-static {v9, v10}, Lcom/playhaven/android/util/MemoryReporter;->normalize(D)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 70
    return-void
.end method

.method public static report(Ljava/lang/String;)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;

    .prologue
    .line 79
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/playhaven/android/util/MemoryReporter;->report(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    return-void
.end method

.method public static report(Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "optional"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v3

    .line 91
    .local v3, "totalMemory":J
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v1

    .line 92
    .local v1, "freeMemory":J
    sub-long v5, v3, v1

    .line 93
    .local v5, "usedMemory":J
    if-nez p1, :cond_0

    const-string v0, ""

    .line 94
    .local v0, "addendum":Ljava/lang/String;
    :goto_0
    const-string v7, "Memory [Total: %s] [Free: %s] [Used: %s] %s"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    long-to-double v10, v3

    invoke-static {v10, v11}, Lcom/playhaven/android/util/MemoryReporter;->normalize(D)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    long-to-double v10, v1

    invoke-static {v10, v11}, Lcom/playhaven/android/util/MemoryReporter;->normalize(D)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    long-to-double v10, v5

    invoke-static {v10, v11}, Lcom/playhaven/android/util/MemoryReporter;->normalize(D)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x3

    aput-object v0, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {p0, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    return-void

    .end local v0    # "addendum":Ljava/lang/String;
    :cond_0
    move-object v0, p1

    .line 93
    goto :goto_0
.end method
