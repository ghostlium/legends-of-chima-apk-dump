.class final Lcom/flurry/sdk/fz$1;
.super Ljava/lang/ThreadLocal;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Lcom/flurry/sdk/fz$a;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected a()Lcom/flurry/sdk/fz$a;
    .locals 1

    .prologue
    .line 51
    new-instance v0, Lcom/flurry/sdk/fz$a;

    invoke-direct {v0}, Lcom/flurry/sdk/fz$a;-><init>()V

    return-object v0
.end method

.method protected synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 50
    invoke-virtual {p0}, Lcom/flurry/sdk/fz$1;->a()Lcom/flurry/sdk/fz$a;

    move-result-object v0

    return-object v0
.end method
