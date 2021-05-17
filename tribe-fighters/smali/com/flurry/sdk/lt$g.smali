.class public Lcom/flurry/sdk/lt$g;
.super Lcom/flurry/sdk/lt;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/lt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/lt",
        "<",
        "Ljava/net/URI;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 149
    const-class v0, Ljava/net/URI;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/lt;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method protected synthetic a(Ljava/lang/String;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 146
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/lt$g;->b(Ljava/lang/String;Lcom/flurry/sdk/ja;)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method protected b(Ljava/lang/String;Lcom/flurry/sdk/ja;)Ljava/net/URI;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 155
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method
