.class final Lcom/flurry/sdk/oo$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/oo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# instance fields
.field public final a:Lcom/flurry/sdk/or$a;

.field public final b:Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Lcom/flurry/sdk/oo$a;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/oo$a;Lcom/flurry/sdk/or$a;Lcom/flurry/sdk/jl;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/oo$a;",
            "Lcom/flurry/sdk/or$a;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object p1, p0, Lcom/flurry/sdk/oo$a;->c:Lcom/flurry/sdk/oo$a;

    .line 89
    iput-object p2, p0, Lcom/flurry/sdk/oo$a;->a:Lcom/flurry/sdk/or$a;

    .line 90
    iput-object p3, p0, Lcom/flurry/sdk/oo$a;->b:Lcom/flurry/sdk/jl;

    .line 91
    return-void
.end method
