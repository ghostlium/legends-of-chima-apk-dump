.class public final enum Lcom/playhaven/android/view/PlayHavenView$DismissType;
.super Ljava/lang/Enum;
.source "PlayHavenView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/view/PlayHavenView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DismissType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/view/PlayHavenView$DismissType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum BackButton:Lcom/playhaven/android/view/PlayHavenView$DismissType;

.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/view/PlayHavenView$DismissType;

.field public static final enum Emergency:Lcom/playhaven/android/view/PlayHavenView$DismissType;

.field public static final enum Launch:Lcom/playhaven/android/view/PlayHavenView$DismissType;

.field public static final enum NoThanks:Lcom/playhaven/android/view/PlayHavenView$DismissType;

.field public static final enum OptIn:Lcom/playhaven/android/view/PlayHavenView$DismissType;

.field public static final enum Purchase:Lcom/playhaven/android/view/PlayHavenView$DismissType;

.field public static final enum Reward:Lcom/playhaven/android/view/PlayHavenView$DismissType;

.field public static final enum SelfClose:Lcom/playhaven/android/view/PlayHavenView$DismissType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 108
    new-instance v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;

    const-string v1, "Emergency"

    invoke-direct {v0, v1, v3}, Lcom/playhaven/android/view/PlayHavenView$DismissType;-><init>(Ljava/lang/String;I)V

    .line 109
    sput-object v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;->Emergency:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .line 110
    new-instance v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;

    const-string v1, "NoThanks"

    invoke-direct {v0, v1, v4}, Lcom/playhaven/android/view/PlayHavenView$DismissType;-><init>(Ljava/lang/String;I)V

    .line 111
    sput-object v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;->NoThanks:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .line 112
    new-instance v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;

    const-string v1, "Launch"

    invoke-direct {v0, v1, v5}, Lcom/playhaven/android/view/PlayHavenView$DismissType;-><init>(Ljava/lang/String;I)V

    .line 113
    sput-object v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;->Launch:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .line 114
    new-instance v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;

    const-string v1, "SelfClose"

    invoke-direct {v0, v1, v6}, Lcom/playhaven/android/view/PlayHavenView$DismissType;-><init>(Ljava/lang/String;I)V

    .line 115
    sput-object v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;->SelfClose:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .line 116
    new-instance v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;

    const-string v1, "BackButton"

    invoke-direct {v0, v1, v7}, Lcom/playhaven/android/view/PlayHavenView$DismissType;-><init>(Ljava/lang/String;I)V

    .line 117
    sput-object v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;->BackButton:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .line 118
    new-instance v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;

    const-string v1, "Reward"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/view/PlayHavenView$DismissType;-><init>(Ljava/lang/String;I)V

    .line 119
    sput-object v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;->Reward:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .line 120
    new-instance v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;

    const-string v1, "Purchase"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/view/PlayHavenView$DismissType;-><init>(Ljava/lang/String;I)V

    .line 121
    sput-object v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;->Purchase:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .line 122
    new-instance v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;

    const-string v1, "OptIn"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/view/PlayHavenView$DismissType;-><init>(Ljava/lang/String;I)V

    .line 123
    sput-object v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;->OptIn:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .line 107
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/playhaven/android/view/PlayHavenView$DismissType;

    sget-object v1, Lcom/playhaven/android/view/PlayHavenView$DismissType;->Emergency:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/playhaven/android/view/PlayHavenView$DismissType;->NoThanks:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/playhaven/android/view/PlayHavenView$DismissType;->Launch:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/playhaven/android/view/PlayHavenView$DismissType;->SelfClose:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/playhaven/android/view/PlayHavenView$DismissType;->BackButton:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/playhaven/android/view/PlayHavenView$DismissType;->Reward:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/playhaven/android/view/PlayHavenView$DismissType;->Purchase:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/playhaven/android/view/PlayHavenView$DismissType;->OptIn:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;->ENUM$VALUES:[Lcom/playhaven/android/view/PlayHavenView$DismissType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 107
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/view/PlayHavenView$DismissType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/view/PlayHavenView$DismissType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/view/PlayHavenView$DismissType;->ENUM$VALUES:[Lcom/playhaven/android/view/PlayHavenView$DismissType;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/view/PlayHavenView$DismissType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
