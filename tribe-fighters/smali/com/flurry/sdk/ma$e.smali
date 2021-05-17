.class final Lcom/flurry/sdk/ma$e;
.super Lcom/flurry/sdk/ma;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ma;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "e"
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 298
    const-class v0, Ljava/util/Date;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/ma;-><init>(Ljava/lang/Class;)V

    .line 299
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
    .line 295
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/ma$e;->c(Ljava/lang/String;Lcom/flurry/sdk/ja;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public c(Ljava/lang/String;Lcom/flurry/sdk/ja;)Ljava/util/Date;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 305
    invoke-virtual {p2, p1}, Lcom/flurry/sdk/ja;->a(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method
