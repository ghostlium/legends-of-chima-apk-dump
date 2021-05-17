.class public Lcom/flurry/sdk/pv;
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


# static fields
.field static final a:Lcom/flurry/sdk/pv;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    new-instance v0, Lcom/flurry/sdk/pv;

    invoke-direct {v0}, Lcom/flurry/sdk/pv;-><init>()V

    sput-object v0, Lcom/flurry/sdk/pv;->a:Lcom/flurry/sdk/pv;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/pq;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 30
    instance-of v0, p1, Ljava/util/Date;

    if-eqz v0, :cond_0

    .line 31
    check-cast p1, Ljava/util/Date;

    invoke-virtual {p3, p1, p2}, Lcom/flurry/sdk/jw;->b(Ljava/util/Date;Lcom/flurry/sdk/hp;)V

    .line 35
    :goto_0
    return-void

    .line 33
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;)V

    goto :goto_0
.end method
