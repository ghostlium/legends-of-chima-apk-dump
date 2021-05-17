.class public Lcom/flurry/sdk/hn;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final a:I

.field static final b:I

.field protected static final c:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Lcom/flurry/sdk/ry;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field protected d:Lcom/flurry/sdk/rv;

.field protected e:Lcom/flurry/sdk/ru;

.field protected f:Lcom/flurry/sdk/hx;

.field protected g:I

.field protected h:I

.field protected i:Lcom/flurry/sdk/ii;

.field protected j:Lcom/flurry/sdk/ik;

.field protected k:Lcom/flurry/sdk/io;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    invoke-static {}, Lcom/flurry/sdk/ht$a;->a()I

    move-result v0

    sput v0, Lcom/flurry/sdk/hn;->a:I

    .line 71
    invoke-static {}, Lcom/flurry/sdk/hp$a;->a()I

    move-result v0

    sput v0, Lcom/flurry/sdk/hn;->b:I

    .line 84
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/flurry/sdk/hn;->c:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 169
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/hn;-><init>(Lcom/flurry/sdk/hx;)V

    return-void
.end method

.method public constructor <init>(Lcom/flurry/sdk/hx;)V
    .locals 1

    .prologue
    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    invoke-static {}, Lcom/flurry/sdk/rv;->a()Lcom/flurry/sdk/rv;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/hn;->d:Lcom/flurry/sdk/rv;

    .line 101
    invoke-static {}, Lcom/flurry/sdk/ru;->a()Lcom/flurry/sdk/ru;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/hn;->e:Lcom/flurry/sdk/ru;

    .line 121
    sget v0, Lcom/flurry/sdk/hn;->a:I

    iput v0, p0, Lcom/flurry/sdk/hn;->g:I

    .line 126
    sget v0, Lcom/flurry/sdk/hn;->b:I

    iput v0, p0, Lcom/flurry/sdk/hn;->h:I

    .line 171
    iput-object p1, p0, Lcom/flurry/sdk/hn;->f:Lcom/flurry/sdk/hx;

    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/ht$a;)Lcom/flurry/sdk/hn;
    .locals 2

    .prologue
    .line 255
    iget v0, p0, Lcom/flurry/sdk/hn;->g:I

    invoke-virtual {p1}, Lcom/flurry/sdk/ht$a;->c()I

    move-result v1

    or-int/2addr v0, v1

    iput v0, p0, Lcom/flurry/sdk/hn;->g:I

    .line 256
    return-object p0
.end method

.method public a(Lcom/flurry/sdk/hx;)Lcom/flurry/sdk/hn;
    .locals 0

    .prologue
    .line 475
    iput-object p1, p0, Lcom/flurry/sdk/hn;->f:Lcom/flurry/sdk/hx;

    .line 476
    return-object p0
.end method

.method public a(Ljava/io/Writer;)Lcom/flurry/sdk/hp;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 709
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/hn;->a(Ljava/lang/Object;Z)Lcom/flurry/sdk/ij;

    move-result-object v0

    .line 711
    iget-object v1, p0, Lcom/flurry/sdk/hn;->k:Lcom/flurry/sdk/io;

    if-eqz v1, :cond_0

    .line 712
    iget-object v1, p0, Lcom/flurry/sdk/hn;->k:Lcom/flurry/sdk/io;

    invoke-virtual {v1, v0, p1}, Lcom/flurry/sdk/io;->a(Lcom/flurry/sdk/ij;Ljava/io/Writer;)Ljava/io/Writer;

    move-result-object p1

    .line 714
    :cond_0
    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/hn;->a(Ljava/io/Writer;Lcom/flurry/sdk/ij;)Lcom/flurry/sdk/hp;

    move-result-object v0

    return-object v0
.end method

.method protected a(Ljava/io/Writer;Lcom/flurry/sdk/ij;)Lcom/flurry/sdk/hp;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 845
    new-instance v0, Lcom/flurry/sdk/ih;

    iget v1, p0, Lcom/flurry/sdk/hn;->h:I

    iget-object v2, p0, Lcom/flurry/sdk/hn;->f:Lcom/flurry/sdk/hx;

    invoke-direct {v0, p2, v1, v2, p1}, Lcom/flurry/sdk/ih;-><init>(Lcom/flurry/sdk/ij;ILcom/flurry/sdk/hx;Ljava/io/Writer;)V

    .line 846
    iget-object v1, p0, Lcom/flurry/sdk/hn;->i:Lcom/flurry/sdk/ii;

    if-eqz v1, :cond_0

    .line 847
    iget-object v1, p0, Lcom/flurry/sdk/hn;->i:Lcom/flurry/sdk/ii;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/ih;->a(Lcom/flurry/sdk/ii;)Lcom/flurry/sdk/hp;

    .line 849
    :cond_0
    return-object v0
.end method

.method public a(Ljava/io/Reader;)Lcom/flurry/sdk/ht;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 581
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/hn;->a(Ljava/lang/Object;Z)Lcom/flurry/sdk/ij;

    move-result-object v0

    .line 583
    iget-object v1, p0, Lcom/flurry/sdk/hn;->j:Lcom/flurry/sdk/ik;

    if-eqz v1, :cond_0

    .line 584
    iget-object v1, p0, Lcom/flurry/sdk/hn;->j:Lcom/flurry/sdk/ik;

    invoke-virtual {v1, v0, p1}, Lcom/flurry/sdk/ik;->a(Lcom/flurry/sdk/ij;Ljava/io/Reader;)Ljava/io/Reader;

    move-result-object p1

    .line 586
    :cond_0
    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/hn;->a(Ljava/io/Reader;Lcom/flurry/sdk/ij;)Lcom/flurry/sdk/ht;

    move-result-object v0

    return-object v0
.end method

.method protected a(Ljava/io/Reader;Lcom/flurry/sdk/ij;)Lcom/flurry/sdk/ht;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 802
    new-instance v0, Lcom/flurry/sdk/ig;

    iget v2, p0, Lcom/flurry/sdk/hn;->g:I

    iget-object v4, p0, Lcom/flurry/sdk/hn;->f:Lcom/flurry/sdk/hx;

    iget-object v1, p0, Lcom/flurry/sdk/hn;->d:Lcom/flurry/sdk/rv;

    sget-object v3, Lcom/flurry/sdk/ht$a;->j:Lcom/flurry/sdk/ht$a;

    invoke-virtual {p0, v3}, Lcom/flurry/sdk/hn;->b(Lcom/flurry/sdk/ht$a;)Z

    move-result v3

    sget-object v5, Lcom/flurry/sdk/ht$a;->i:Lcom/flurry/sdk/ht$a;

    invoke-virtual {p0, v5}, Lcom/flurry/sdk/hn;->b(Lcom/flurry/sdk/ht$a;)Z

    move-result v5

    invoke-virtual {v1, v3, v5}, Lcom/flurry/sdk/rv;->a(ZZ)Lcom/flurry/sdk/rv;

    move-result-object v5

    move-object v1, p2

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/ig;-><init>(Lcom/flurry/sdk/ij;ILjava/io/Reader;Lcom/flurry/sdk/hx;Lcom/flurry/sdk/rv;)V

    return-object v0
.end method

.method public a()Lcom/flurry/sdk/hx;
    .locals 1

    .prologue
    .line 479
    iget-object v0, p0, Lcom/flurry/sdk/hn;->f:Lcom/flurry/sdk/hx;

    return-object v0
.end method

.method protected a(Ljava/lang/Object;Z)Lcom/flurry/sdk/ij;
    .locals 2

    .prologue
    .line 894
    new-instance v0, Lcom/flurry/sdk/ij;

    invoke-virtual {p0}, Lcom/flurry/sdk/hn;->b()Lcom/flurry/sdk/ry;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lcom/flurry/sdk/ij;-><init>(Lcom/flurry/sdk/ry;Ljava/lang/Object;Z)V

    return-object v0
.end method

.method public b()Lcom/flurry/sdk/ry;
    .locals 3

    .prologue
    .line 905
    sget-object v0, Lcom/flurry/sdk/hn;->c:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/SoftReference;

    .line 906
    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 908
    :goto_0
    if-nez v0, :cond_0

    .line 909
    new-instance v0, Lcom/flurry/sdk/ry;

    invoke-direct {v0}, Lcom/flurry/sdk/ry;-><init>()V

    .line 910
    sget-object v1, Lcom/flurry/sdk/hn;->c:Ljava/lang/ThreadLocal;

    new-instance v2, Ljava/lang/ref/SoftReference;

    invoke-direct {v2, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 912
    :cond_0
    return-object v0

    .line 906
    :cond_1
    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/ry;

    goto :goto_0
.end method

.method public final b(Lcom/flurry/sdk/ht$a;)Z
    .locals 2

    .prologue
    .line 276
    iget v0, p0, Lcom/flurry/sdk/hn;->g:I

    invoke-virtual {p1}, Lcom/flurry/sdk/ht$a;->c()I

    move-result v1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
