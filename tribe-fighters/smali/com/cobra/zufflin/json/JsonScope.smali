.class final enum Lcom/cobra/zufflin/json/JsonScope;
.super Ljava/lang/Enum;
.source "JsonScope.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/cobra/zufflin/json/JsonScope;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CLOSED:Lcom/cobra/zufflin/json/JsonScope;

.field public static final enum DANGLING_NAME:Lcom/cobra/zufflin/json/JsonScope;

.field public static final enum EMPTY_ARRAY:Lcom/cobra/zufflin/json/JsonScope;

.field public static final enum EMPTY_DOCUMENT:Lcom/cobra/zufflin/json/JsonScope;

.field public static final enum EMPTY_OBJECT:Lcom/cobra/zufflin/json/JsonScope;

.field private static final synthetic ENUM$VALUES:[Lcom/cobra/zufflin/json/JsonScope;

.field public static final enum NONEMPTY_ARRAY:Lcom/cobra/zufflin/json/JsonScope;

.field public static final enum NONEMPTY_DOCUMENT:Lcom/cobra/zufflin/json/JsonScope;

.field public static final enum NONEMPTY_OBJECT:Lcom/cobra/zufflin/json/JsonScope;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 24
    new-instance v0, Lcom/cobra/zufflin/json/JsonScope;

    const-string v1, "EMPTY_ARRAY"

    invoke-direct {v0, v1, v3}, Lcom/cobra/zufflin/json/JsonScope;-><init>(Ljava/lang/String;I)V

    .line 28
    sput-object v0, Lcom/cobra/zufflin/json/JsonScope;->EMPTY_ARRAY:Lcom/cobra/zufflin/json/JsonScope;

    .line 30
    new-instance v0, Lcom/cobra/zufflin/json/JsonScope;

    const-string v1, "NONEMPTY_ARRAY"

    invoke-direct {v0, v1, v4}, Lcom/cobra/zufflin/json/JsonScope;-><init>(Ljava/lang/String;I)V

    .line 34
    sput-object v0, Lcom/cobra/zufflin/json/JsonScope;->NONEMPTY_ARRAY:Lcom/cobra/zufflin/json/JsonScope;

    .line 36
    new-instance v0, Lcom/cobra/zufflin/json/JsonScope;

    const-string v1, "EMPTY_OBJECT"

    invoke-direct {v0, v1, v5}, Lcom/cobra/zufflin/json/JsonScope;-><init>(Ljava/lang/String;I)V

    .line 40
    sput-object v0, Lcom/cobra/zufflin/json/JsonScope;->EMPTY_OBJECT:Lcom/cobra/zufflin/json/JsonScope;

    .line 42
    new-instance v0, Lcom/cobra/zufflin/json/JsonScope;

    const-string v1, "DANGLING_NAME"

    invoke-direct {v0, v1, v6}, Lcom/cobra/zufflin/json/JsonScope;-><init>(Ljava/lang/String;I)V

    .line 46
    sput-object v0, Lcom/cobra/zufflin/json/JsonScope;->DANGLING_NAME:Lcom/cobra/zufflin/json/JsonScope;

    .line 48
    new-instance v0, Lcom/cobra/zufflin/json/JsonScope;

    const-string v1, "NONEMPTY_OBJECT"

    invoke-direct {v0, v1, v7}, Lcom/cobra/zufflin/json/JsonScope;-><init>(Ljava/lang/String;I)V

    .line 52
    sput-object v0, Lcom/cobra/zufflin/json/JsonScope;->NONEMPTY_OBJECT:Lcom/cobra/zufflin/json/JsonScope;

    .line 54
    new-instance v0, Lcom/cobra/zufflin/json/JsonScope;

    const-string v1, "EMPTY_DOCUMENT"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/cobra/zufflin/json/JsonScope;-><init>(Ljava/lang/String;I)V

    .line 57
    sput-object v0, Lcom/cobra/zufflin/json/JsonScope;->EMPTY_DOCUMENT:Lcom/cobra/zufflin/json/JsonScope;

    .line 59
    new-instance v0, Lcom/cobra/zufflin/json/JsonScope;

    const-string v1, "NONEMPTY_DOCUMENT"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/cobra/zufflin/json/JsonScope;-><init>(Ljava/lang/String;I)V

    .line 62
    sput-object v0, Lcom/cobra/zufflin/json/JsonScope;->NONEMPTY_DOCUMENT:Lcom/cobra/zufflin/json/JsonScope;

    .line 64
    new-instance v0, Lcom/cobra/zufflin/json/JsonScope;

    const-string v1, "CLOSED"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/cobra/zufflin/json/JsonScope;-><init>(Ljava/lang/String;I)V

    .line 67
    sput-object v0, Lcom/cobra/zufflin/json/JsonScope;->CLOSED:Lcom/cobra/zufflin/json/JsonScope;

    .line 22
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/cobra/zufflin/json/JsonScope;

    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->EMPTY_ARRAY:Lcom/cobra/zufflin/json/JsonScope;

    aput-object v1, v0, v3

    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->NONEMPTY_ARRAY:Lcom/cobra/zufflin/json/JsonScope;

    aput-object v1, v0, v4

    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->EMPTY_OBJECT:Lcom/cobra/zufflin/json/JsonScope;

    aput-object v1, v0, v5

    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->DANGLING_NAME:Lcom/cobra/zufflin/json/JsonScope;

    aput-object v1, v0, v6

    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->NONEMPTY_OBJECT:Lcom/cobra/zufflin/json/JsonScope;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/cobra/zufflin/json/JsonScope;->EMPTY_DOCUMENT:Lcom/cobra/zufflin/json/JsonScope;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/cobra/zufflin/json/JsonScope;->NONEMPTY_DOCUMENT:Lcom/cobra/zufflin/json/JsonScope;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/cobra/zufflin/json/JsonScope;->CLOSED:Lcom/cobra/zufflin/json/JsonScope;

    aput-object v2, v0, v1

    sput-object v0, Lcom/cobra/zufflin/json/JsonScope;->ENUM$VALUES:[Lcom/cobra/zufflin/json/JsonScope;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/cobra/zufflin/json/JsonScope;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/cobra/zufflin/json/JsonScope;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/json/JsonScope;

    return-object v0
.end method

.method public static values()[Lcom/cobra/zufflin/json/JsonScope;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/cobra/zufflin/json/JsonScope;->ENUM$VALUES:[Lcom/cobra/zufflin/json/JsonScope;

    array-length v1, v0

    new-array v2, v1, [Lcom/cobra/zufflin/json/JsonScope;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
