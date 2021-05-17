.class public final enum Lcom/playhaven/android/data/Purchase$Result;
.super Ljava/lang/Enum;
.source "Purchase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/data/Purchase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Result"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/data/Purchase$Result;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Bought:Lcom/playhaven/android/data/Purchase$Result;

.field public static final enum Cancelled:Lcom/playhaven/android/data/Purchase$Result;

.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/data/Purchase$Result;

.field public static final enum Error:Lcom/playhaven/android/data/Purchase$Result;

.field public static final enum Invalid:Lcom/playhaven/android/data/Purchase$Result;

.field public static final enum Owned:Lcom/playhaven/android/data/Purchase$Result;

.field public static final enum Unset:Lcom/playhaven/android/data/Purchase$Result;


# instance fields
.field private urlValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 38
    new-instance v0, Lcom/playhaven/android/data/Purchase$Result;

    const-string v1, "Unset"

    .line 39
    const-string v2, "unset"

    invoke-direct {v0, v1, v4, v2}, Lcom/playhaven/android/data/Purchase$Result;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/playhaven/android/data/Purchase$Result;->Unset:Lcom/playhaven/android/data/Purchase$Result;

    .line 40
    new-instance v0, Lcom/playhaven/android/data/Purchase$Result;

    const-string v1, "Bought"

    .line 41
    const-string v2, "buy"

    invoke-direct {v0, v1, v5, v2}, Lcom/playhaven/android/data/Purchase$Result;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/playhaven/android/data/Purchase$Result;->Bought:Lcom/playhaven/android/data/Purchase$Result;

    .line 42
    new-instance v0, Lcom/playhaven/android/data/Purchase$Result;

    const-string v1, "Cancelled"

    .line 43
    const-string v2, "cancel"

    invoke-direct {v0, v1, v6, v2}, Lcom/playhaven/android/data/Purchase$Result;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/playhaven/android/data/Purchase$Result;->Cancelled:Lcom/playhaven/android/data/Purchase$Result;

    .line 44
    new-instance v0, Lcom/playhaven/android/data/Purchase$Result;

    const-string v1, "Invalid"

    .line 45
    const-string v2, "invalid"

    invoke-direct {v0, v1, v7, v2}, Lcom/playhaven/android/data/Purchase$Result;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/playhaven/android/data/Purchase$Result;->Invalid:Lcom/playhaven/android/data/Purchase$Result;

    .line 46
    new-instance v0, Lcom/playhaven/android/data/Purchase$Result;

    const-string v1, "Owned"

    .line 47
    const-string v2, "owned"

    invoke-direct {v0, v1, v8, v2}, Lcom/playhaven/android/data/Purchase$Result;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/playhaven/android/data/Purchase$Result;->Owned:Lcom/playhaven/android/data/Purchase$Result;

    .line 48
    new-instance v0, Lcom/playhaven/android/data/Purchase$Result;

    const-string v1, "Error"

    const/4 v2, 0x5

    .line 49
    const-string v3, "error"

    invoke-direct {v0, v1, v2, v3}, Lcom/playhaven/android/data/Purchase$Result;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/playhaven/android/data/Purchase$Result;->Error:Lcom/playhaven/android/data/Purchase$Result;

    .line 36
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/playhaven/android/data/Purchase$Result;

    sget-object v1, Lcom/playhaven/android/data/Purchase$Result;->Unset:Lcom/playhaven/android/data/Purchase$Result;

    aput-object v1, v0, v4

    sget-object v1, Lcom/playhaven/android/data/Purchase$Result;->Bought:Lcom/playhaven/android/data/Purchase$Result;

    aput-object v1, v0, v5

    sget-object v1, Lcom/playhaven/android/data/Purchase$Result;->Cancelled:Lcom/playhaven/android/data/Purchase$Result;

    aput-object v1, v0, v6

    sget-object v1, Lcom/playhaven/android/data/Purchase$Result;->Invalid:Lcom/playhaven/android/data/Purchase$Result;

    aput-object v1, v0, v7

    sget-object v1, Lcom/playhaven/android/data/Purchase$Result;->Owned:Lcom/playhaven/android/data/Purchase$Result;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/playhaven/android/data/Purchase$Result;->Error:Lcom/playhaven/android/data/Purchase$Result;

    aput-object v2, v0, v1

    sput-object v0, Lcom/playhaven/android/data/Purchase$Result;->ENUM$VALUES:[Lcom/playhaven/android/data/Purchase$Result;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "urlValue"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 52
    iput-object p3, p0, Lcom/playhaven/android/data/Purchase$Result;->urlValue:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/data/Purchase$Result;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/data/Purchase$Result;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/data/Purchase$Result;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/data/Purchase$Result;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/data/Purchase$Result;->ENUM$VALUES:[Lcom/playhaven/android/data/Purchase$Result;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/data/Purchase$Result;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public getUrlValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase$Result;->urlValue:Ljava/lang/String;

    return-object v0
.end method
