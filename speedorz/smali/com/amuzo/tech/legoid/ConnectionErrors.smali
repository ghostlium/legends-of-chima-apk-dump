.class public final enum Lcom/amuzo/tech/legoid/ConnectionErrors;
.super Ljava/lang/Enum;
.source "ConnectionErrors.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amuzo/tech/legoid/ConnectionErrors;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/amuzo/tech/legoid/ConnectionErrors;

.field public static final enum HttpConnectionTimeout:Lcom/amuzo/tech/legoid/ConnectionErrors;

.field public static final enum ResponseError:Lcom/amuzo/tech/legoid/ConnectionErrors;

.field public static final enum SocketTimeout:Lcom/amuzo/tech/legoid/ConnectionErrors;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 4
    new-instance v0, Lcom/amuzo/tech/legoid/ConnectionErrors;

    const-string v1, "HttpConnectionTimeout"

    invoke-direct {v0, v1, v2}, Lcom/amuzo/tech/legoid/ConnectionErrors;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amuzo/tech/legoid/ConnectionErrors;->HttpConnectionTimeout:Lcom/amuzo/tech/legoid/ConnectionErrors;

    new-instance v0, Lcom/amuzo/tech/legoid/ConnectionErrors;

    const-string v1, "SocketTimeout"

    invoke-direct {v0, v1, v3}, Lcom/amuzo/tech/legoid/ConnectionErrors;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amuzo/tech/legoid/ConnectionErrors;->SocketTimeout:Lcom/amuzo/tech/legoid/ConnectionErrors;

    new-instance v0, Lcom/amuzo/tech/legoid/ConnectionErrors;

    const-string v1, "ResponseError"

    invoke-direct {v0, v1, v4}, Lcom/amuzo/tech/legoid/ConnectionErrors;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amuzo/tech/legoid/ConnectionErrors;->ResponseError:Lcom/amuzo/tech/legoid/ConnectionErrors;

    .line 3
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/amuzo/tech/legoid/ConnectionErrors;

    sget-object v1, Lcom/amuzo/tech/legoid/ConnectionErrors;->HttpConnectionTimeout:Lcom/amuzo/tech/legoid/ConnectionErrors;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amuzo/tech/legoid/ConnectionErrors;->SocketTimeout:Lcom/amuzo/tech/legoid/ConnectionErrors;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amuzo/tech/legoid/ConnectionErrors;->ResponseError:Lcom/amuzo/tech/legoid/ConnectionErrors;

    aput-object v1, v0, v4

    sput-object v0, Lcom/amuzo/tech/legoid/ConnectionErrors;->ENUM$VALUES:[Lcom/amuzo/tech/legoid/ConnectionErrors;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amuzo/tech/legoid/ConnectionErrors;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/amuzo/tech/legoid/ConnectionErrors;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amuzo/tech/legoid/ConnectionErrors;

    return-object v0
.end method

.method public static values()[Lcom/amuzo/tech/legoid/ConnectionErrors;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/amuzo/tech/legoid/ConnectionErrors;->ENUM$VALUES:[Lcom/amuzo/tech/legoid/ConnectionErrors;

    array-length v1, v0

    new-array v2, v1, [Lcom/amuzo/tech/legoid/ConnectionErrors;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
