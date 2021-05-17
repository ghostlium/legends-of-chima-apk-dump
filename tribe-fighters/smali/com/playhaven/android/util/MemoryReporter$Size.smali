.class final enum Lcom/playhaven/android/util/MemoryReporter$Size;
.super Ljava/lang/Enum;
.source "MemoryReporter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/util/MemoryReporter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Size"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/util/MemoryReporter$Size;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum B:Lcom/playhaven/android/util/MemoryReporter$Size;

.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/util/MemoryReporter$Size;

.field public static final enum GB:Lcom/playhaven/android/util/MemoryReporter$Size;

.field public static final enum KB:Lcom/playhaven/android/util/MemoryReporter$Size;

.field public static final enum MB:Lcom/playhaven/android/util/MemoryReporter$Size;


# instance fields
.field protected bytes:D

.field protected format:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 28
    new-instance v0, Lcom/playhaven/android/util/MemoryReporter$Size;

    const-string v1, "B"

    .line 29
    const-string v2, "%f bytes"

    invoke-direct {v0, v1, v3, v2}, Lcom/playhaven/android/util/MemoryReporter$Size;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/playhaven/android/util/MemoryReporter$Size;->B:Lcom/playhaven/android/util/MemoryReporter$Size;

    .line 30
    new-instance v0, Lcom/playhaven/android/util/MemoryReporter$Size;

    const-string v1, "KB"

    .line 31
    const-string v2, "%1.2f KB"

    invoke-direct {v0, v1, v4, v2}, Lcom/playhaven/android/util/MemoryReporter$Size;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/playhaven/android/util/MemoryReporter$Size;->KB:Lcom/playhaven/android/util/MemoryReporter$Size;

    .line 32
    new-instance v0, Lcom/playhaven/android/util/MemoryReporter$Size;

    const-string v1, "MB"

    .line 33
    const-string v2, "%1.2f MB"

    invoke-direct {v0, v1, v5, v2}, Lcom/playhaven/android/util/MemoryReporter$Size;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/playhaven/android/util/MemoryReporter$Size;->MB:Lcom/playhaven/android/util/MemoryReporter$Size;

    .line 34
    new-instance v0, Lcom/playhaven/android/util/MemoryReporter$Size;

    const-string v1, "GB"

    .line 35
    const-string v2, "%1.2f GB"

    invoke-direct {v0, v1, v6, v2}, Lcom/playhaven/android/util/MemoryReporter$Size;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/playhaven/android/util/MemoryReporter$Size;->GB:Lcom/playhaven/android/util/MemoryReporter$Size;

    .line 26
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/playhaven/android/util/MemoryReporter$Size;

    sget-object v1, Lcom/playhaven/android/util/MemoryReporter$Size;->B:Lcom/playhaven/android/util/MemoryReporter$Size;

    aput-object v1, v0, v3

    sget-object v1, Lcom/playhaven/android/util/MemoryReporter$Size;->KB:Lcom/playhaven/android/util/MemoryReporter$Size;

    aput-object v1, v0, v4

    sget-object v1, Lcom/playhaven/android/util/MemoryReporter$Size;->MB:Lcom/playhaven/android/util/MemoryReporter$Size;

    aput-object v1, v0, v5

    sget-object v1, Lcom/playhaven/android/util/MemoryReporter$Size;->GB:Lcom/playhaven/android/util/MemoryReporter$Size;

    aput-object v1, v0, v6

    sput-object v0, Lcom/playhaven/android/util/MemoryReporter$Size;->ENUM$VALUES:[Lcom/playhaven/android/util/MemoryReporter$Size;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 4
    .param p3, "format"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 41
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iput-wide v0, p0, Lcom/playhaven/android/util/MemoryReporter$Size;->bytes:D

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/playhaven/android/util/MemoryReporter$Size;->format:Ljava/lang/String;

    .line 38
    const-wide/high16 v0, 0x4090000000000000L    # 1024.0

    invoke-virtual {p0}, Lcom/playhaven/android/util/MemoryReporter$Size;->ordinal()I

    move-result v2

    int-to-double v2, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/playhaven/android/util/MemoryReporter$Size;->bytes:D

    .line 39
    iput-object p3, p0, Lcom/playhaven/android/util/MemoryReporter$Size;->format:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/util/MemoryReporter$Size;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/util/MemoryReporter$Size;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/util/MemoryReporter$Size;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/util/MemoryReporter$Size;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/util/MemoryReporter$Size;->ENUM$VALUES:[Lcom/playhaven/android/util/MemoryReporter$Size;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/util/MemoryReporter$Size;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
