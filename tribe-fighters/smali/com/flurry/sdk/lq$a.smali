.class public Lcom/flurry/sdk/lq$a;
.super Lcom/flurry/sdk/mc;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/lq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/mc",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field protected final a:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected final b:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/flurry/sdk/mr;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/mr;",
            ")V"
        }
    .end annotation

    .prologue
    .line 115
    const-class v0, Ljava/lang/Enum;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mc;-><init>(Ljava/lang/Class;)V

    .line 116
    iput-object p1, p0, Lcom/flurry/sdk/lq$a;->a:Ljava/lang/Class;

    .line 117
    invoke-virtual {p2}, Lcom/flurry/sdk/mr;->e()Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/lq$a;->b:Ljava/lang/reflect/Method;

    .line 118
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 124
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 127
    sget-object v1, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_0

    sget-object v1, Lcom/flurry/sdk/hw;->f:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_0

    .line 128
    iget-object v0, p0, Lcom/flurry/sdk/lq$a;->a:Ljava/lang/Class;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 130
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    .line 132
    :try_start_0
    iget-object v1, p0, Lcom/flurry/sdk/lq$a;->b:Ljava/lang/reflect/Method;

    iget-object v2, p0, Lcom/flurry/sdk/lq$a;->a:Ljava/lang/Class;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 136
    :goto_0
    return-object v0

    .line 133
    :catch_0
    move-exception v0

    .line 134
    invoke-static {v0}, Lcom/flurry/sdk/qs;->c(Ljava/lang/Throwable;)V

    .line 136
    const/4 v0, 0x0

    goto :goto_0
.end method
