.class final enum Lcom/playhaven/android/PlayHaven$LogName;
.super Ljava/lang/Enum;
.source "PlayHaven.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/PlayHaven;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "LogName"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/PlayHaven$LogName;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum ASSERT:Lcom/playhaven/android/PlayHaven$LogName;

.field public static final enum DEBUG:Lcom/playhaven/android/PlayHaven$LogName;

.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/PlayHaven$LogName;

.field public static final enum ERROR:Lcom/playhaven/android/PlayHaven$LogName;

.field public static final enum INFO:Lcom/playhaven/android/PlayHaven$LogName;

.field public static final enum SUPPRESS:Lcom/playhaven/android/PlayHaven$LogName;

.field public static final enum VERBOSE:Lcom/playhaven/android/PlayHaven$LogName;

.field public static final enum WARN:Lcom/playhaven/android/PlayHaven$LogName;


# instance fields
.field private level:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x6

    const/4 v7, 0x5

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    .line 509
    new-instance v0, Lcom/playhaven/android/PlayHaven$LogName;

    const-string v1, "SUPPRESS"

    const/4 v2, 0x0

    .line 510
    const/4 v3, -0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/playhaven/android/PlayHaven$LogName;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/playhaven/android/PlayHaven$LogName;->SUPPRESS:Lcom/playhaven/android/PlayHaven$LogName;

    .line 511
    new-instance v0, Lcom/playhaven/android/PlayHaven$LogName;

    const-string v1, "VERBOSE"

    const/4 v2, 0x1

    .line 512
    invoke-direct {v0, v1, v2, v4}, Lcom/playhaven/android/PlayHaven$LogName;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/playhaven/android/PlayHaven$LogName;->VERBOSE:Lcom/playhaven/android/PlayHaven$LogName;

    .line 513
    new-instance v0, Lcom/playhaven/android/PlayHaven$LogName;

    const-string v1, "DEBUG"

    .line 514
    invoke-direct {v0, v1, v4, v5}, Lcom/playhaven/android/PlayHaven$LogName;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/playhaven/android/PlayHaven$LogName;->DEBUG:Lcom/playhaven/android/PlayHaven$LogName;

    .line 515
    new-instance v0, Lcom/playhaven/android/PlayHaven$LogName;

    const-string v1, "INFO"

    .line 516
    invoke-direct {v0, v1, v5, v6}, Lcom/playhaven/android/PlayHaven$LogName;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/playhaven/android/PlayHaven$LogName;->INFO:Lcom/playhaven/android/PlayHaven$LogName;

    .line 517
    new-instance v0, Lcom/playhaven/android/PlayHaven$LogName;

    const-string v1, "WARN"

    .line 518
    invoke-direct {v0, v1, v6, v7}, Lcom/playhaven/android/PlayHaven$LogName;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/playhaven/android/PlayHaven$LogName;->WARN:Lcom/playhaven/android/PlayHaven$LogName;

    .line 519
    new-instance v0, Lcom/playhaven/android/PlayHaven$LogName;

    const-string v1, "ERROR"

    .line 520
    invoke-direct {v0, v1, v7, v8}, Lcom/playhaven/android/PlayHaven$LogName;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/playhaven/android/PlayHaven$LogName;->ERROR:Lcom/playhaven/android/PlayHaven$LogName;

    .line 521
    new-instance v0, Lcom/playhaven/android/PlayHaven$LogName;

    const-string v1, "ASSERT"

    .line 522
    const/4 v2, 0x7

    invoke-direct {v0, v1, v8, v2}, Lcom/playhaven/android/PlayHaven$LogName;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/playhaven/android/PlayHaven$LogName;->ASSERT:Lcom/playhaven/android/PlayHaven$LogName;

    .line 507
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/playhaven/android/PlayHaven$LogName;

    const/4 v1, 0x0

    sget-object v2, Lcom/playhaven/android/PlayHaven$LogName;->SUPPRESS:Lcom/playhaven/android/PlayHaven$LogName;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/playhaven/android/PlayHaven$LogName;->VERBOSE:Lcom/playhaven/android/PlayHaven$LogName;

    aput-object v2, v0, v1

    sget-object v1, Lcom/playhaven/android/PlayHaven$LogName;->DEBUG:Lcom/playhaven/android/PlayHaven$LogName;

    aput-object v1, v0, v4

    sget-object v1, Lcom/playhaven/android/PlayHaven$LogName;->INFO:Lcom/playhaven/android/PlayHaven$LogName;

    aput-object v1, v0, v5

    sget-object v1, Lcom/playhaven/android/PlayHaven$LogName;->WARN:Lcom/playhaven/android/PlayHaven$LogName;

    aput-object v1, v0, v6

    sget-object v1, Lcom/playhaven/android/PlayHaven$LogName;->ERROR:Lcom/playhaven/android/PlayHaven$LogName;

    aput-object v1, v0, v7

    sget-object v1, Lcom/playhaven/android/PlayHaven$LogName;->ASSERT:Lcom/playhaven/android/PlayHaven$LogName;

    aput-object v1, v0, v8

    sput-object v0, Lcom/playhaven/android/PlayHaven$LogName;->ENUM$VALUES:[Lcom/playhaven/android/PlayHaven$LogName;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "level"    # I

    .prologue
    .line 523
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 525
    iput p3, p0, Lcom/playhaven/android/PlayHaven$LogName;->level:I

    .line 526
    return-void
.end method

.method static synthetic access$2(Lcom/playhaven/android/PlayHaven$LogName;)I
    .locals 1

    .prologue
    .line 527
    iget v0, p0, Lcom/playhaven/android/PlayHaven$LogName;->level:I

    return v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/PlayHaven$LogName;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/PlayHaven$LogName;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/PlayHaven$LogName;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/PlayHaven$LogName;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/PlayHaven$LogName;->ENUM$VALUES:[Lcom/playhaven/android/PlayHaven$LogName;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/PlayHaven$LogName;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
