.class public final Lcom/flurry/sdk/ps$d;
.super Lcom/flurry/sdk/pq;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/pq",
        "<[C>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 297
    const-class v0, [C

    invoke-direct {p0, v0}, Lcom/flurry/sdk/pq;-><init>(Ljava/lang/Class;)V

    return-void
.end method

.method private final a(Lcom/flurry/sdk/hp;[C)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 333
    const/4 v0, 0x0

    array-length v1, p2

    :goto_0
    if-ge v0, v1, :cond_0

    .line 334
    const/4 v2, 0x1

    invoke-virtual {p1, p2, v0, v2}, Lcom/flurry/sdk/hp;->a([CII)V

    .line 333
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 336
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 293
    check-cast p1, [C

    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ps$d;->a([CLcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 293
    check-cast p1, [C

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/ps$d;->a([CLcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V

    return-void
.end method

.method public a([CLcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 304
    sget-object v0, Lcom/flurry/sdk/ju$a;->s:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p3, v0}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 305
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->b()V

    .line 306
    invoke-direct {p0, p2, p1}, Lcom/flurry/sdk/ps$d;->a(Lcom/flurry/sdk/hp;[C)V

    .line 307
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->c()V

    .line 311
    :goto_0
    return-void

    .line 309
    :cond_0
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p2, p1, v0, v1}, Lcom/flurry/sdk/hp;->a([CII)V

    goto :goto_0
.end method

.method public a([CLcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 319
    sget-object v0, Lcom/flurry/sdk/ju$a;->s:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p3, v0}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->c(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 321
    invoke-direct {p0, p2, p1}, Lcom/flurry/sdk/ps$d;->a(Lcom/flurry/sdk/hp;[C)V

    .line 322
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->f(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 328
    :goto_0
    return-void

    .line 324
    :cond_0
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 325
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p2, p1, v0, v1}, Lcom/flurry/sdk/hp;->a([CII)V

    .line 326
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->d(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    goto :goto_0
.end method
