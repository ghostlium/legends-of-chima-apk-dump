.class public final enum Lcom/flurry/sdk/kg$b;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/kg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/flurry/sdk/kg$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/flurry/sdk/kg$b;

.field public static final enum b:Lcom/flurry/sdk/kg$b;

.field private static final synthetic c:[Lcom/flurry/sdk/kg$b;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 207
    new-instance v0, Lcom/flurry/sdk/kg$b;

    const-string v1, "DYNAMIC"

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/kg$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/sdk/kg$b;->a:Lcom/flurry/sdk/kg$b;

    .line 213
    new-instance v0, Lcom/flurry/sdk/kg$b;

    const-string v1, "STATIC"

    invoke-direct {v0, v1, v3}, Lcom/flurry/sdk/kg$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/sdk/kg$b;->b:Lcom/flurry/sdk/kg$b;

    .line 201
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/flurry/sdk/kg$b;

    sget-object v1, Lcom/flurry/sdk/kg$b;->a:Lcom/flurry/sdk/kg$b;

    aput-object v1, v0, v2

    sget-object v1, Lcom/flurry/sdk/kg$b;->b:Lcom/flurry/sdk/kg$b;

    aput-object v1, v0, v3

    sput-object v0, Lcom/flurry/sdk/kg$b;->c:[Lcom/flurry/sdk/kg$b;

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
    .line 201
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flurry/sdk/kg$b;
    .locals 1

    .prologue
    .line 201
    const-class v0, Lcom/flurry/sdk/kg$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kg$b;

    return-object v0
.end method

.method public static values()[Lcom/flurry/sdk/kg$b;
    .locals 1

    .prologue
    .line 201
    sget-object v0, Lcom/flurry/sdk/kg$b;->c:[Lcom/flurry/sdk/kg$b;

    invoke-virtual {v0}, [Lcom/flurry/sdk/kg$b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flurry/sdk/kg$b;

    return-object v0
.end method
