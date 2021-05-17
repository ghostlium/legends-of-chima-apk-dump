.class final Lcom/flurry/sdk/ft$1;
.super Ljava/lang/ThreadLocal;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ft;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Ljava/util/Map",
        "<",
        "Lcom/flurry/sdk/fm;",
        "Ljava/util/Map",
        "<",
        "Lcom/flurry/sdk/fm;",
        "Lcom/flurry/sdk/gk;",
        ">;>;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected a()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/fm;",
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/fm;",
            "Lcom/flurry/sdk/gk;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 94
    new-instance v0, Lcom/flurry/sdk/gy;

    invoke-direct {v0}, Lcom/flurry/sdk/gy;-><init>()V

    return-object v0
.end method

.method protected synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 92
    invoke-virtual {p0}, Lcom/flurry/sdk/ft$1;->a()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
