.class public final enum Lcom/playhaven/android/push/PushReceiver$PushParams;
.super Ljava/lang/Enum;
.source "PushReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/push/PushReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PushParams"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/push/PushReceiver$PushParams;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/push/PushReceiver$PushParams;

.field public static final enum content_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

.field public static final enum message_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

.field public static final enum push_token:Lcom/playhaven/android/push/PushReceiver$PushParams;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 55
    new-instance v0, Lcom/playhaven/android/push/PushReceiver$PushParams;

    const-string v1, "push_token"

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/push/PushReceiver$PushParams;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/push/PushReceiver$PushParams;->push_token:Lcom/playhaven/android/push/PushReceiver$PushParams;

    .line 56
    new-instance v0, Lcom/playhaven/android/push/PushReceiver$PushParams;

    const-string v1, "message_id"

    invoke-direct {v0, v1, v3}, Lcom/playhaven/android/push/PushReceiver$PushParams;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/push/PushReceiver$PushParams;->message_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

    .line 57
    new-instance v0, Lcom/playhaven/android/push/PushReceiver$PushParams;

    const-string v1, "content_id"

    invoke-direct {v0, v1, v4}, Lcom/playhaven/android/push/PushReceiver$PushParams;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/push/PushReceiver$PushParams;->content_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

    .line 54
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/playhaven/android/push/PushReceiver$PushParams;

    sget-object v1, Lcom/playhaven/android/push/PushReceiver$PushParams;->push_token:Lcom/playhaven/android/push/PushReceiver$PushParams;

    aput-object v1, v0, v2

    sget-object v1, Lcom/playhaven/android/push/PushReceiver$PushParams;->message_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

    aput-object v1, v0, v3

    sget-object v1, Lcom/playhaven/android/push/PushReceiver$PushParams;->content_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

    aput-object v1, v0, v4

    sput-object v0, Lcom/playhaven/android/push/PushReceiver$PushParams;->ENUM$VALUES:[Lcom/playhaven/android/push/PushReceiver$PushParams;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/push/PushReceiver$PushParams;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/push/PushReceiver$PushParams;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/push/PushReceiver$PushParams;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/push/PushReceiver$PushParams;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/push/PushReceiver$PushParams;->ENUM$VALUES:[Lcom/playhaven/android/push/PushReceiver$PushParams;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/push/PushReceiver$PushParams;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
