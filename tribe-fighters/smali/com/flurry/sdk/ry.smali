.class public Lcom/flurry/sdk/ry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/ry$b;,
        Lcom/flurry/sdk/ry$a;
    }
.end annotation


# instance fields
.field protected final a:[[B

.field protected final b:[[C


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    invoke-static {}, Lcom/flurry/sdk/ry$a;->values()[Lcom/flurry/sdk/ry$a;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [[B

    iput-object v0, p0, Lcom/flurry/sdk/ry;->a:[[B

    .line 48
    invoke-static {}, Lcom/flurry/sdk/ry$b;->values()[Lcom/flurry/sdk/ry$b;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [[C

    iput-object v0, p0, Lcom/flurry/sdk/ry;->b:[[C

    .line 50
    return-void
.end method

.method private final a(I)[B
    .locals 1

    .prologue
    .line 102
    new-array v0, p1, [B

    return-object v0
.end method

.method private final b(I)[C
    .locals 1

    .prologue
    .line 107
    new-array v0, p1, [C

    return-object v0
.end method


# virtual methods
.method public final a(Lcom/flurry/sdk/ry$b;[C)V
    .locals 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/flurry/sdk/ry;->b:[[C

    invoke-virtual {p1}, Lcom/flurry/sdk/ry$b;->ordinal()I

    move-result v1

    aput-object p2, v0, v1

    .line 92
    return-void
.end method

.method public final a(Lcom/flurry/sdk/ry$a;)[B
    .locals 4

    .prologue
    .line 54
    invoke-virtual {p1}, Lcom/flurry/sdk/ry$a;->ordinal()I

    move-result v1

    .line 55
    iget-object v0, p0, Lcom/flurry/sdk/ry;->a:[[B

    aget-object v0, v0, v1

    .line 56
    if-nez v0, :cond_0

    .line 57
    invoke-static {p1}, Lcom/flurry/sdk/ry$a;->a(Lcom/flurry/sdk/ry$a;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/ry;->a(I)[B

    move-result-object v0

    .line 61
    :goto_0
    return-object v0

    .line 59
    :cond_0
    iget-object v2, p0, Lcom/flurry/sdk/ry;->a:[[B

    const/4 v3, 0x0

    aput-object v3, v2, v1

    goto :goto_0
.end method

.method public final a(Lcom/flurry/sdk/ry$b;)[C
    .locals 1

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/ry;->a(Lcom/flurry/sdk/ry$b;I)[C

    move-result-object v0

    return-object v0
.end method

.method public final a(Lcom/flurry/sdk/ry$b;I)[C
    .locals 4

    .prologue
    .line 76
    invoke-static {p1}, Lcom/flurry/sdk/ry$b;->a(Lcom/flurry/sdk/ry$b;)I

    move-result v0

    if-le v0, p2, :cond_0

    .line 77
    invoke-static {p1}, Lcom/flurry/sdk/ry$b;->a(Lcom/flurry/sdk/ry$b;)I

    move-result p2

    .line 79
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/ry$b;->ordinal()I

    move-result v1

    .line 80
    iget-object v0, p0, Lcom/flurry/sdk/ry;->b:[[C

    aget-object v0, v0, v1

    .line 81
    if-eqz v0, :cond_1

    array-length v2, v0

    if-ge v2, p2, :cond_2

    .line 82
    :cond_1
    invoke-direct {p0, p2}, Lcom/flurry/sdk/ry;->b(I)[C

    move-result-object v0

    .line 86
    :goto_0
    return-object v0

    .line 84
    :cond_2
    iget-object v2, p0, Lcom/flurry/sdk/ry;->b:[[C

    const/4 v3, 0x0

    aput-object v3, v2, v1

    goto :goto_0
.end method
