.class public final enum Lcom/playhaven/android/PlayHaven$ConnectionType;
.super Ljava/lang/Enum;
.source "PlayHaven.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/PlayHaven;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ConnectionType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/PlayHaven$ConnectionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/PlayHaven$ConnectionType;

.field public static final enum MOBILE:Lcom/playhaven/android/PlayHaven$ConnectionType;

.field public static final enum NO_NETWORK:Lcom/playhaven/android/PlayHaven$ConnectionType;

.field public static final enum NO_PERMISSION:Lcom/playhaven/android/PlayHaven$ConnectionType;

.field public static final enum WIFI:Lcom/playhaven/android/PlayHaven$ConnectionType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 182
    new-instance v0, Lcom/playhaven/android/PlayHaven$ConnectionType;

    const-string v1, "NO_NETWORK"

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/PlayHaven$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 185
    sput-object v0, Lcom/playhaven/android/PlayHaven$ConnectionType;->NO_NETWORK:Lcom/playhaven/android/PlayHaven$ConnectionType;

    .line 187
    new-instance v0, Lcom/playhaven/android/PlayHaven$ConnectionType;

    const-string v1, "MOBILE"

    invoke-direct {v0, v1, v3}, Lcom/playhaven/android/PlayHaven$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 190
    sput-object v0, Lcom/playhaven/android/PlayHaven$ConnectionType;->MOBILE:Lcom/playhaven/android/PlayHaven$ConnectionType;

    .line 192
    new-instance v0, Lcom/playhaven/android/PlayHaven$ConnectionType;

    const-string v1, "WIFI"

    invoke-direct {v0, v1, v4}, Lcom/playhaven/android/PlayHaven$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 195
    sput-object v0, Lcom/playhaven/android/PlayHaven$ConnectionType;->WIFI:Lcom/playhaven/android/PlayHaven$ConnectionType;

    .line 197
    new-instance v0, Lcom/playhaven/android/PlayHaven$ConnectionType;

    const-string v1, "NO_PERMISSION"

    invoke-direct {v0, v1, v5}, Lcom/playhaven/android/PlayHaven$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 200
    sput-object v0, Lcom/playhaven/android/PlayHaven$ConnectionType;->NO_PERMISSION:Lcom/playhaven/android/PlayHaven$ConnectionType;

    .line 181
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/playhaven/android/PlayHaven$ConnectionType;

    sget-object v1, Lcom/playhaven/android/PlayHaven$ConnectionType;->NO_NETWORK:Lcom/playhaven/android/PlayHaven$ConnectionType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/playhaven/android/PlayHaven$ConnectionType;->MOBILE:Lcom/playhaven/android/PlayHaven$ConnectionType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/playhaven/android/PlayHaven$ConnectionType;->WIFI:Lcom/playhaven/android/PlayHaven$ConnectionType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/playhaven/android/PlayHaven$ConnectionType;->NO_PERMISSION:Lcom/playhaven/android/PlayHaven$ConnectionType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/playhaven/android/PlayHaven$ConnectionType;->ENUM$VALUES:[Lcom/playhaven/android/PlayHaven$ConnectionType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 181
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/PlayHaven$ConnectionType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/PlayHaven$ConnectionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/PlayHaven$ConnectionType;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/PlayHaven$ConnectionType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/PlayHaven$ConnectionType;->ENUM$VALUES:[Lcom/playhaven/android/PlayHaven$ConnectionType;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/PlayHaven$ConnectionType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
