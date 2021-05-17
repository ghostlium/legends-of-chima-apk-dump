.class public Lcom/flurry/sdk/jp;
.super Lcom/flurry/sdk/hn;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/jp;-><init>(Lcom/flurry/sdk/jq;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Lcom/flurry/sdk/jq;)V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/flurry/sdk/hn;-><init>(Lcom/flurry/sdk/hx;)V

    .line 42
    if-nez p1, :cond_0

    .line 43
    new-instance v0, Lcom/flurry/sdk/jq;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/jq;-><init>(Lcom/flurry/sdk/hn;)V

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/jp;->a(Lcom/flurry/sdk/hx;)Lcom/flurry/sdk/hn;

    .line 45
    :cond_0
    return-void
.end method


# virtual methods
.method public synthetic a()Lcom/flurry/sdk/hx;
    .locals 1

    .prologue
    .line 31
    invoke-virtual {p0}, Lcom/flurry/sdk/jp;->c()Lcom/flurry/sdk/jq;

    move-result-object v0

    return-object v0
.end method

.method public final c()Lcom/flurry/sdk/jq;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/flurry/sdk/jp;->f:Lcom/flurry/sdk/hx;

    check-cast v0, Lcom/flurry/sdk/jq;

    return-object v0
.end method
