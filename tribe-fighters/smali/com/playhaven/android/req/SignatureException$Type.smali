.class public final enum Lcom/playhaven/android/req/SignatureException$Type;
.super Ljava/lang/Enum;
.source "SignatureException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/req/SignatureException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/req/SignatureException$Type;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Digest:Lcom/playhaven/android/req/SignatureException$Type;

.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/req/SignatureException$Type;

.field public static final enum Purchase:Lcom/playhaven/android/req/SignatureException$Type;

.field public static final enum Reward:Lcom/playhaven/android/req/SignatureException$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 31
    new-instance v0, Lcom/playhaven/android/req/SignatureException$Type;

    const-string v1, "Digest"

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/req/SignatureException$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/req/SignatureException$Type;->Digest:Lcom/playhaven/android/req/SignatureException$Type;

    new-instance v0, Lcom/playhaven/android/req/SignatureException$Type;

    const-string v1, "Reward"

    invoke-direct {v0, v1, v3}, Lcom/playhaven/android/req/SignatureException$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/req/SignatureException$Type;->Reward:Lcom/playhaven/android/req/SignatureException$Type;

    new-instance v0, Lcom/playhaven/android/req/SignatureException$Type;

    const-string v1, "Purchase"

    invoke-direct {v0, v1, v4}, Lcom/playhaven/android/req/SignatureException$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/req/SignatureException$Type;->Purchase:Lcom/playhaven/android/req/SignatureException$Type;

    .line 29
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/playhaven/android/req/SignatureException$Type;

    sget-object v1, Lcom/playhaven/android/req/SignatureException$Type;->Digest:Lcom/playhaven/android/req/SignatureException$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/playhaven/android/req/SignatureException$Type;->Reward:Lcom/playhaven/android/req/SignatureException$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/playhaven/android/req/SignatureException$Type;->Purchase:Lcom/playhaven/android/req/SignatureException$Type;

    aput-object v1, v0, v4

    sput-object v0, Lcom/playhaven/android/req/SignatureException$Type;->ENUM$VALUES:[Lcom/playhaven/android/req/SignatureException$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/req/SignatureException$Type;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/req/SignatureException$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/req/SignatureException$Type;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/req/SignatureException$Type;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/req/SignatureException$Type;->ENUM$VALUES:[Lcom/playhaven/android/req/SignatureException$Type;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/req/SignatureException$Type;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
