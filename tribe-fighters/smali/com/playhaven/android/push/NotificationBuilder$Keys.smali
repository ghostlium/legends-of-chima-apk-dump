.class public final enum Lcom/playhaven/android/push/NotificationBuilder$Keys;
.super Ljava/lang/Enum;
.source "NotificationBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/push/NotificationBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Keys"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/push/NotificationBuilder$Keys;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/push/NotificationBuilder$Keys;

.field public static final enum TEXT:Lcom/playhaven/android/push/NotificationBuilder$Keys;

.field public static final enum TITLE:Lcom/playhaven/android/push/NotificationBuilder$Keys;

.field public static final enum URI:Lcom/playhaven/android/push/NotificationBuilder$Keys;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 30
    new-instance v0, Lcom/playhaven/android/push/NotificationBuilder$Keys;

    const-string v1, "TITLE"

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/push/NotificationBuilder$Keys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/push/NotificationBuilder$Keys;->TITLE:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    .line 31
    new-instance v0, Lcom/playhaven/android/push/NotificationBuilder$Keys;

    const-string v1, "TEXT"

    invoke-direct {v0, v1, v3}, Lcom/playhaven/android/push/NotificationBuilder$Keys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/push/NotificationBuilder$Keys;->TEXT:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    .line 32
    new-instance v0, Lcom/playhaven/android/push/NotificationBuilder$Keys;

    const-string v1, "URI"

    invoke-direct {v0, v1, v4}, Lcom/playhaven/android/push/NotificationBuilder$Keys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/push/NotificationBuilder$Keys;->URI:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    .line 29
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/playhaven/android/push/NotificationBuilder$Keys;

    sget-object v1, Lcom/playhaven/android/push/NotificationBuilder$Keys;->TITLE:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    aput-object v1, v0, v2

    sget-object v1, Lcom/playhaven/android/push/NotificationBuilder$Keys;->TEXT:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    aput-object v1, v0, v3

    sget-object v1, Lcom/playhaven/android/push/NotificationBuilder$Keys;->URI:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    aput-object v1, v0, v4

    sput-object v0, Lcom/playhaven/android/push/NotificationBuilder$Keys;->ENUM$VALUES:[Lcom/playhaven/android/push/NotificationBuilder$Keys;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/push/NotificationBuilder$Keys;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/push/NotificationBuilder$Keys;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/push/NotificationBuilder$Keys;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/push/NotificationBuilder$Keys;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/push/NotificationBuilder$Keys;->ENUM$VALUES:[Lcom/playhaven/android/push/NotificationBuilder$Keys;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/push/NotificationBuilder$Keys;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method