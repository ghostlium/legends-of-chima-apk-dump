.class public final enum Lcom/playhaven/android/push/PushReceiver$UriTypes;
.super Ljava/lang/Enum;
.source "PushReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/push/PushReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "UriTypes"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/push/PushReceiver$UriTypes;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum ACTIVITY:Lcom/playhaven/android/push/PushReceiver$UriTypes;

.field public static final enum CUSTOM:Lcom/playhaven/android/push/PushReceiver$UriTypes;

.field public static final enum DEFAULT:Lcom/playhaven/android/push/PushReceiver$UriTypes;

.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/push/PushReceiver$UriTypes;

.field public static final enum INVALID:Lcom/playhaven/android/push/PushReceiver$UriTypes;

.field public static final enum PLACEMENT:Lcom/playhaven/android/push/PushReceiver$UriTypes;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 46
    new-instance v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;

    const-string v1, "DEFAULT"

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/push/PushReceiver$UriTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;->DEFAULT:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    .line 47
    new-instance v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;

    const-string v1, "CUSTOM"

    invoke-direct {v0, v1, v3}, Lcom/playhaven/android/push/PushReceiver$UriTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;->CUSTOM:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    .line 48
    new-instance v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;

    const-string v1, "INVALID"

    invoke-direct {v0, v1, v4}, Lcom/playhaven/android/push/PushReceiver$UriTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;->INVALID:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    .line 49
    new-instance v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;

    const-string v1, "PLACEMENT"

    invoke-direct {v0, v1, v5}, Lcom/playhaven/android/push/PushReceiver$UriTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;->PLACEMENT:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    .line 50
    new-instance v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;

    const-string v1, "ACTIVITY"

    invoke-direct {v0, v1, v6}, Lcom/playhaven/android/push/PushReceiver$UriTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ACTIVITY:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    .line 45
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/playhaven/android/push/PushReceiver$UriTypes;

    sget-object v1, Lcom/playhaven/android/push/PushReceiver$UriTypes;->DEFAULT:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    aput-object v1, v0, v2

    sget-object v1, Lcom/playhaven/android/push/PushReceiver$UriTypes;->CUSTOM:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    aput-object v1, v0, v3

    sget-object v1, Lcom/playhaven/android/push/PushReceiver$UriTypes;->INVALID:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    aput-object v1, v0, v4

    sget-object v1, Lcom/playhaven/android/push/PushReceiver$UriTypes;->PLACEMENT:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    aput-object v1, v0, v5

    sget-object v1, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ACTIVITY:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    aput-object v1, v0, v6

    sput-object v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ENUM$VALUES:[Lcom/playhaven/android/push/PushReceiver$UriTypes;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/push/PushReceiver$UriTypes;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/push/PushReceiver$UriTypes;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ENUM$VALUES:[Lcom/playhaven/android/push/PushReceiver$UriTypes;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/push/PushReceiver$UriTypes;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
