.class public final enum Lcom/flurry/sdk/m$e;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/flurry/sdk/m$e;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/flurry/sdk/m$e;

.field public static final enum b:Lcom/flurry/sdk/m$e;

.field public static final enum c:Lcom/flurry/sdk/m$e;

.field private static final synthetic d:[Lcom/flurry/sdk/m$e;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 34
    new-instance v0, Lcom/flurry/sdk/m$e;

    const-string v1, "WEB_RESULT_UNKNOWN"

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/m$e;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/sdk/m$e;->a:Lcom/flurry/sdk/m$e;

    .line 35
    new-instance v0, Lcom/flurry/sdk/m$e;

    const-string v1, "WEB_RESULT_BACK"

    invoke-direct {v0, v1, v3}, Lcom/flurry/sdk/m$e;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/sdk/m$e;->b:Lcom/flurry/sdk/m$e;

    .line 36
    new-instance v0, Lcom/flurry/sdk/m$e;

    const-string v1, "WEB_RESULT_CLOSE"

    invoke-direct {v0, v1, v4}, Lcom/flurry/sdk/m$e;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/sdk/m$e;->c:Lcom/flurry/sdk/m$e;

    .line 33
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/flurry/sdk/m$e;

    sget-object v1, Lcom/flurry/sdk/m$e;->a:Lcom/flurry/sdk/m$e;

    aput-object v1, v0, v2

    sget-object v1, Lcom/flurry/sdk/m$e;->b:Lcom/flurry/sdk/m$e;

    aput-object v1, v0, v3

    sget-object v1, Lcom/flurry/sdk/m$e;->c:Lcom/flurry/sdk/m$e;

    aput-object v1, v0, v4

    sput-object v0, Lcom/flurry/sdk/m$e;->d:[Lcom/flurry/sdk/m$e;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flurry/sdk/m$e;
    .locals 1

    .prologue
    .line 33
    const-class v0, Lcom/flurry/sdk/m$e;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/m$e;

    return-object v0
.end method

.method public static values()[Lcom/flurry/sdk/m$e;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/flurry/sdk/m$e;->d:[Lcom/flurry/sdk/m$e;

    invoke-virtual {v0}, [Lcom/flurry/sdk/m$e;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flurry/sdk/m$e;

    return-object v0
.end method
