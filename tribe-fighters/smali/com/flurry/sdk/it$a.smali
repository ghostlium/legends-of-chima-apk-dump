.class public Lcom/flurry/sdk/it$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/it;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/it;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field protected final a:Ljava/lang/String;

.field protected final b:Lcom/flurry/sdk/rx;

.field protected final c:Lcom/flurry/sdk/mq;

.field protected final d:Lcom/flurry/sdk/qp;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/qp;Lcom/flurry/sdk/mq;)V
    .locals 0

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object p1, p0, Lcom/flurry/sdk/it$a;->a:Ljava/lang/String;

    .line 89
    iput-object p2, p0, Lcom/flurry/sdk/it$a;->b:Lcom/flurry/sdk/rx;

    .line 90
    iput-object p4, p0, Lcom/flurry/sdk/it$a;->c:Lcom/flurry/sdk/mq;

    .line 91
    iput-object p3, p0, Lcom/flurry/sdk/it$a;->d:Lcom/flurry/sdk/qp;

    .line 92
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/it$a;
    .locals 4

    .prologue
    .line 95
    new-instance v0, Lcom/flurry/sdk/it$a;

    iget-object v1, p0, Lcom/flurry/sdk/it$a;->a:Ljava/lang/String;

    iget-object v2, p0, Lcom/flurry/sdk/it$a;->d:Lcom/flurry/sdk/qp;

    iget-object v3, p0, Lcom/flurry/sdk/it$a;->c:Lcom/flurry/sdk/mq;

    invoke-direct {v0, v1, p1, v2, v3}, Lcom/flurry/sdk/it$a;-><init>(Ljava/lang/String;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/qp;Lcom/flurry/sdk/mq;)V

    return-object v0
.end method

.method public a()Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/flurry/sdk/it$a;->b:Lcom/flurry/sdk/rx;

    return-object v0
.end method

.method public b()Lcom/flurry/sdk/mq;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/flurry/sdk/it$a;->c:Lcom/flurry/sdk/mq;

    return-object v0
.end method

.method public c()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/flurry/sdk/it$a;->a:Ljava/lang/String;

    return-object v0
.end method
