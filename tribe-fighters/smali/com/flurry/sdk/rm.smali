.class public Lcom/flurry/sdk/rm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lcom/flurry/sdk/rm;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    new-instance v0, Lcom/flurry/sdk/rm;

    invoke-direct {v0}, Lcom/flurry/sdk/rm;-><init>()V

    sput-object v0, Lcom/flurry/sdk/rm;->a:Lcom/flurry/sdk/rm;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a([B)Lcom/flurry/sdk/rg;
    .locals 1

    .prologue
    .line 187
    invoke-static {p1}, Lcom/flurry/sdk/rg;->a([B)Lcom/flurry/sdk/rg;

    move-result-object v0

    return-object v0
.end method

.method public a(Z)Lcom/flurry/sdk/rh;
    .locals 1

    .prologue
    .line 35
    if-eqz p1, :cond_0

    invoke-static {}, Lcom/flurry/sdk/rh;->r()Lcom/flurry/sdk/rh;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/flurry/sdk/rh;->s()Lcom/flurry/sdk/rh;

    move-result-object v0

    goto :goto_0
.end method

.method public a()Lcom/flurry/sdk/ro;
    .locals 1

    .prologue
    .line 42
    invoke-static {}, Lcom/flurry/sdk/ro;->r()Lcom/flurry/sdk/ro;

    move-result-object v0

    return-object v0
.end method

.method public a(D)Lcom/flurry/sdk/rp;
    .locals 1

    .prologue
    .line 150
    invoke-static {p1, p2}, Lcom/flurry/sdk/rk;->b(D)Lcom/flurry/sdk/rk;

    move-result-object v0

    return-object v0
.end method

.method public a(I)Lcom/flurry/sdk/rp;
    .locals 1

    .prologue
    .line 90
    invoke-static {p1}, Lcom/flurry/sdk/rl;->a(I)Lcom/flurry/sdk/rl;

    move-result-object v0

    return-object v0
.end method

.method public a(J)Lcom/flurry/sdk/rp;
    .locals 1

    .prologue
    .line 108
    invoke-static {p1, p2}, Lcom/flurry/sdk/rn;->a(J)Lcom/flurry/sdk/rn;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/math/BigDecimal;)Lcom/flurry/sdk/rp;
    .locals 1

    .prologue
    .line 168
    invoke-static {p1}, Lcom/flurry/sdk/rj;->a(Ljava/math/BigDecimal;)Lcom/flurry/sdk/rj;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/math/BigInteger;)Lcom/flurry/sdk/rp;
    .locals 1

    .prologue
    .line 126
    invoke-static {p1}, Lcom/flurry/sdk/rf;->a(Ljava/math/BigInteger;)Lcom/flurry/sdk/rf;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/Object;)Lcom/flurry/sdk/rr;
    .locals 1

    .prologue
    .line 220
    new-instance v0, Lcom/flurry/sdk/rr;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/rr;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public a(Ljava/lang/String;)Lcom/flurry/sdk/rs;
    .locals 1

    .prologue
    .line 180
    invoke-static {p1}, Lcom/flurry/sdk/rs;->b(Ljava/lang/String;)Lcom/flurry/sdk/rs;

    move-result-object v0

    return-object v0
.end method

.method public b()Lcom/flurry/sdk/rd;
    .locals 1

    .prologue
    .line 207
    new-instance v0, Lcom/flurry/sdk/rd;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/rd;-><init>(Lcom/flurry/sdk/rm;)V

    return-object v0
.end method

.method public c()Lcom/flurry/sdk/rq;
    .locals 1

    .prologue
    .line 212
    new-instance v0, Lcom/flurry/sdk/rq;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/rq;-><init>(Lcom/flurry/sdk/rm;)V

    return-object v0
.end method
