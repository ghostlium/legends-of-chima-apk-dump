.class public final Lcom/flurry/sdk/rg;
.super Lcom/flurry/sdk/rt;
.source "SourceFile"


# static fields
.field static final c:Lcom/flurry/sdk/rg;


# instance fields
.field final d:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 16
    new-instance v0, Lcom/flurry/sdk/rg;

    const/4 v1, 0x0

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lcom/flurry/sdk/rg;-><init>([B)V

    sput-object v0, Lcom/flurry/sdk/rg;->c:Lcom/flurry/sdk/rg;

    return-void
.end method

.method public constructor <init>([B)V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/flurry/sdk/rt;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/flurry/sdk/rg;->d:[B

    .line 29
    return-void
.end method

.method public static a([B)Lcom/flurry/sdk/rg;
    .locals 1

    .prologue
    .line 43
    if-nez p0, :cond_0

    .line 44
    const/4 v0, 0x0

    .line 49
    :goto_0
    return-object v0

    .line 46
    :cond_0
    array-length v0, p0

    if-nez v0, :cond_1

    .line 47
    sget-object v0, Lcom/flurry/sdk/rg;->c:Lcom/flurry/sdk/rg;

    goto :goto_0

    .line 49
    :cond_1
    new-instance v0, Lcom/flurry/sdk/rg;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/rg;-><init>([B)V

    goto :goto_0
.end method


# virtual methods
.method public final a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 108
    iget-object v0, p0, Lcom/flurry/sdk/rg;->d:[B

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->a([B)V

    .line 109
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 114
    if-ne p1, p0, :cond_1

    const/4 v0, 0x1

    .line 119
    :cond_0
    :goto_0
    return v0

    .line 115
    :cond_1
    if-eqz p1, :cond_0

    .line 116
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_0

    .line 119
    check-cast p1, Lcom/flurry/sdk/rg;

    iget-object v0, p1, Lcom/flurry/sdk/rg;->d:[B

    iget-object v1, p0, Lcom/flurry/sdk/rg;->d:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/flurry/sdk/rg;->d:[B

    if-nez v0, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rg;->d:[B

    array-length v0, v0

    goto :goto_0
.end method

.method public m()Ljava/lang/String;
    .locals 3

    .prologue
    .line 95
    invoke-static {}, Lcom/flurry/sdk/hm;->a()Lcom/flurry/sdk/hl;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/rg;->d:[B

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/flurry/sdk/hl;->a([BZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 134
    invoke-static {}, Lcom/flurry/sdk/hm;->a()Lcom/flurry/sdk/hl;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/rg;->d:[B

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/flurry/sdk/hl;->a([BZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
