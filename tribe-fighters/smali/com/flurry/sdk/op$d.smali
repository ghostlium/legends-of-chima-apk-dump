.class public final Lcom/flurry/sdk/op$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/op;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# instance fields
.field public final a:Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lcom/flurry/sdk/op;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/jl;Lcom/flurry/sdk/op;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/flurry/sdk/op;",
            ")V"
        }
    .end annotation

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lcom/flurry/sdk/op$d;->a:Lcom/flurry/sdk/jl;

    .line 76
    iput-object p2, p0, Lcom/flurry/sdk/op$d;->b:Lcom/flurry/sdk/op;

    .line 77
    return-void
.end method
