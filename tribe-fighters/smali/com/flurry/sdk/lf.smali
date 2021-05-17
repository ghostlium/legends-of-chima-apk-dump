.class public final Lcom/flurry/sdk/lf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field final a:Lcom/flurry/sdk/ht;

.field final b:Lcom/flurry/sdk/ja;

.field final c:[Ljava/lang/Object;

.field private d:I

.field private e:Lcom/flurry/sdk/le;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;I)V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/flurry/sdk/lf;->a:Lcom/flurry/sdk/ht;

    .line 43
    iput-object p2, p0, Lcom/flurry/sdk/lf;->b:Lcom/flurry/sdk/ja;

    .line 44
    iput p3, p0, Lcom/flurry/sdk/lf;->d:I

    .line 45
    new-array v0, p3, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/flurry/sdk/lf;->c:[Ljava/lang/Object;

    .line 46
    return-void
.end method


# virtual methods
.method protected a()Lcom/flurry/sdk/le;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/flurry/sdk/lf;->e:Lcom/flurry/sdk/le;

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/ks;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 95
    new-instance v0, Lcom/flurry/sdk/le$a;

    iget-object v1, p0, Lcom/flurry/sdk/lf;->e:Lcom/flurry/sdk/le;

    invoke-direct {v0, v1, p3, p1, p2}, Lcom/flurry/sdk/le$a;-><init>(Lcom/flurry/sdk/le;Ljava/lang/Object;Lcom/flurry/sdk/ks;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/flurry/sdk/lf;->e:Lcom/flurry/sdk/le;

    .line 96
    return-void
.end method

.method public a(Lcom/flurry/sdk/kt;Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 91
    new-instance v0, Lcom/flurry/sdk/le$c;

    iget-object v1, p0, Lcom/flurry/sdk/lf;->e:Lcom/flurry/sdk/le;

    invoke-direct {v0, v1, p2, p1}, Lcom/flurry/sdk/le$c;-><init>(Lcom/flurry/sdk/le;Ljava/lang/Object;Lcom/flurry/sdk/kt;)V

    iput-object v0, p0, Lcom/flurry/sdk/lf;->e:Lcom/flurry/sdk/le;

    .line 92
    return-void
.end method

.method public a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 99
    new-instance v0, Lcom/flurry/sdk/le$b;

    iget-object v1, p0, Lcom/flurry/sdk/lf;->e:Lcom/flurry/sdk/le;

    invoke-direct {v0, v1, p2, p1}, Lcom/flurry/sdk/le$b;-><init>(Lcom/flurry/sdk/le;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/flurry/sdk/lf;->e:Lcom/flurry/sdk/le;

    .line 100
    return-void
.end method

.method public a([Lcom/flurry/sdk/kt;)V
    .locals 7

    .prologue
    .line 50
    const/4 v0, 0x0

    array-length v1, p1

    :goto_0
    if-ge v0, v1, :cond_1

    .line 51
    aget-object v2, p1, v0

    .line 52
    if-eqz v2, :cond_0

    .line 54
    iget-object v3, p0, Lcom/flurry/sdk/lf;->c:[Ljava/lang/Object;

    iget-object v4, p0, Lcom/flurry/sdk/lf;->b:Lcom/flurry/sdk/ja;

    invoke-virtual {v2}, Lcom/flurry/sdk/kt;->k()Ljava/lang/Object;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v2, v6}, Lcom/flurry/sdk/ja;->a(Ljava/lang/Object;Lcom/flurry/sdk/it;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v3, v0

    .line 50
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 58
    :cond_1
    return-void
.end method

.method public a(ILjava/lang/Object;)Z
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/flurry/sdk/lf;->c:[Ljava/lang/Object;

    aput-object p2, v0, p1

    .line 87
    iget v0, p0, Lcom/flurry/sdk/lf;->d:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/flurry/sdk/lf;->d:I

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final a([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 4

    .prologue
    .line 67
    if-eqz p1, :cond_1

    .line 68
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/flurry/sdk/lf;->c:[Ljava/lang/Object;

    array-length v1, v1

    :goto_0
    if-ge v0, v1, :cond_1

    .line 69
    iget-object v2, p0, Lcom/flurry/sdk/lf;->c:[Ljava/lang/Object;

    aget-object v2, v2, v0

    if-nez v2, :cond_0

    .line 70
    aget-object v2, p1, v0

    .line 71
    if-eqz v2, :cond_0

    .line 72
    iget-object v3, p0, Lcom/flurry/sdk/lf;->c:[Ljava/lang/Object;

    aput-object v2, v3, v0

    .line 68
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 77
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/lf;->c:[Ljava/lang/Object;

    return-object v0
.end method
