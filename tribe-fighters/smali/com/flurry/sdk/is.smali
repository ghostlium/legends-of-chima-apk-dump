.class public abstract Lcom/flurry/sdk/is;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final a:Lcom/flurry/sdk/rx;


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/rx;)V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/flurry/sdk/is;->a:Lcom/flurry/sdk/rx;

    .line 47
    return-void
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/flurry/sdk/is;->a:Lcom/flurry/sdk/rx;

    return-object v0
.end method

.method public b()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lcom/flurry/sdk/is;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public abstract c()Lcom/flurry/sdk/mn;
.end method
