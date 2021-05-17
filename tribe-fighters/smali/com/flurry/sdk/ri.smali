.class public abstract Lcom/flurry/sdk/ri;
.super Lcom/flurry/sdk/re;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/ri$b;,
        Lcom/flurry/sdk/ri$a;
    }
.end annotation


# instance fields
.field d:Lcom/flurry/sdk/rm;


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/rm;)V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/flurry/sdk/re;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/flurry/sdk/ri;->d:Lcom/flurry/sdk/rm;

    .line 28
    return-void
.end method


# virtual methods
.method public m()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    const-string v0, ""

    return-object v0
.end method

.method public final r()Lcom/flurry/sdk/ro;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/flurry/sdk/ri;->d:Lcom/flurry/sdk/rm;

    invoke-virtual {v0}, Lcom/flurry/sdk/rm;->a()Lcom/flurry/sdk/ro;

    move-result-object v0

    return-object v0
.end method
