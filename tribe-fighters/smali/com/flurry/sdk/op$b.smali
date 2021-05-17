.class final Lcom/flurry/sdk/op$b;
.super Lcom/flurry/sdk/op;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/op;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "b"
.end annotation


# static fields
.field protected static final a:Lcom/flurry/sdk/op$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 106
    new-instance v0, Lcom/flurry/sdk/op$b;

    invoke-direct {v0}, Lcom/flurry/sdk/op$b;-><init>()V

    sput-object v0, Lcom/flurry/sdk/op$b;->a:Lcom/flurry/sdk/op$b;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 104
    invoke-direct {p0}, Lcom/flurry/sdk/op;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Class;)Lcom/flurry/sdk/jl;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    const/4 v0, 0x0

    return-object v0
.end method

.method public a(Ljava/lang/Class;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/op;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/op;"
        }
    .end annotation

    .prologue
    .line 115
    new-instance v0, Lcom/flurry/sdk/op$e;

    invoke-direct {v0, p1, p2}, Lcom/flurry/sdk/op$e;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/jl;)V

    return-object v0
.end method
