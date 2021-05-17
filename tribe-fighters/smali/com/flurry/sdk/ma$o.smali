.class final Lcom/flurry/sdk/ma$o;
.super Lcom/flurry/sdk/ma;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ma;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "o"
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 329
    const-class v0, Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/ma;-><init>(Ljava/lang/Class;)V

    .line 330
    return-void
.end method


# virtual methods
.method public synthetic b(Ljava/lang/String;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 326
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/ma$o;->c(Ljava/lang/String;Lcom/flurry/sdk/ja;)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public c(Ljava/lang/String;Lcom/flurry/sdk/ja;)Ljava/util/UUID;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 336
    invoke-static {p1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method
