.class final enum Lcom/flurry/sdk/u$a$a;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/u$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/flurry/sdk/u$a$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/flurry/sdk/u$a$a;

.field public static final enum b:Lcom/flurry/sdk/u$a$a;

.field public static final enum c:Lcom/flurry/sdk/u$a$a;

.field public static final enum d:Lcom/flurry/sdk/u$a$a;

.field public static final enum e:Lcom/flurry/sdk/u$a$a;

.field private static final synthetic f:[Lcom/flurry/sdk/u$a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 82
    new-instance v0, Lcom/flurry/sdk/u$a$a;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/u$a$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/sdk/u$a$a;->a:Lcom/flurry/sdk/u$a$a;

    .line 83
    new-instance v0, Lcom/flurry/sdk/u$a$a;

    const-string v1, "REQUEST"

    invoke-direct {v0, v1, v3}, Lcom/flurry/sdk/u$a$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/sdk/u$a$a;->b:Lcom/flurry/sdk/u$a$a;

    .line 84
    new-instance v0, Lcom/flurry/sdk/u$a$a;

    const-string v1, "PREPARE"

    invoke-direct {v0, v1, v4}, Lcom/flurry/sdk/u$a$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/sdk/u$a$a;->c:Lcom/flurry/sdk/u$a$a;

    .line 85
    new-instance v0, Lcom/flurry/sdk/u$a$a;

    const-string v1, "PRERENDER"

    invoke-direct {v0, v1, v5}, Lcom/flurry/sdk/u$a$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/sdk/u$a$a;->d:Lcom/flurry/sdk/u$a$a;

    .line 86
    new-instance v0, Lcom/flurry/sdk/u$a$a;

    const-string v1, "READY"

    invoke-direct {v0, v1, v6}, Lcom/flurry/sdk/u$a$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/sdk/u$a$a;->e:Lcom/flurry/sdk/u$a$a;

    .line 81
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/flurry/sdk/u$a$a;

    sget-object v1, Lcom/flurry/sdk/u$a$a;->a:Lcom/flurry/sdk/u$a$a;

    aput-object v1, v0, v2

    sget-object v1, Lcom/flurry/sdk/u$a$a;->b:Lcom/flurry/sdk/u$a$a;

    aput-object v1, v0, v3

    sget-object v1, Lcom/flurry/sdk/u$a$a;->c:Lcom/flurry/sdk/u$a$a;

    aput-object v1, v0, v4

    sget-object v1, Lcom/flurry/sdk/u$a$a;->d:Lcom/flurry/sdk/u$a$a;

    aput-object v1, v0, v5

    sget-object v1, Lcom/flurry/sdk/u$a$a;->e:Lcom/flurry/sdk/u$a$a;

    aput-object v1, v0, v6

    sput-object v0, Lcom/flurry/sdk/u$a$a;->f:[Lcom/flurry/sdk/u$a$a;

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
    .line 81
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flurry/sdk/u$a$a;
    .locals 1

    .prologue
    .line 81
    const-class v0, Lcom/flurry/sdk/u$a$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/u$a$a;

    return-object v0
.end method

.method public static values()[Lcom/flurry/sdk/u$a$a;
    .locals 1

    .prologue
    .line 81
    sget-object v0, Lcom/flurry/sdk/u$a$a;->f:[Lcom/flurry/sdk/u$a$a;

    invoke-virtual {v0}, [Lcom/flurry/sdk/u$a$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flurry/sdk/u$a$a;

    return-object v0
.end method
