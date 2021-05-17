.class public final Lcom/flurry/sdk/on;
.super Lcom/flurry/sdk/pq;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/pq",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 26
    const-class v0, Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/pq;-><init>(Ljava/lang/Class;)V

    .line 27
    iput-object p1, p0, Lcom/flurry/sdk/on;->a:Ljava/lang/String;

    .line 28
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 34
    new-instance v0, Lcom/flurry/sdk/ho;

    iget-object v1, p0, Lcom/flurry/sdk/on;->a:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/flurry/sdk/ho;-><init>(Ljava/lang/String;)V

    throw v0
.end method
