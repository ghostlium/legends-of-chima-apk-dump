.class public final Lcom/flurry/sdk/rh;
.super Lcom/flurry/sdk/rt;
.source "SourceFile"


# static fields
.field public static final c:Lcom/flurry/sdk/rh;

.field public static final d:Lcom/flurry/sdk/rh;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    new-instance v0, Lcom/flurry/sdk/rh;

    invoke-direct {v0}, Lcom/flurry/sdk/rh;-><init>()V

    sput-object v0, Lcom/flurry/sdk/rh;->c:Lcom/flurry/sdk/rh;

    .line 19
    new-instance v0, Lcom/flurry/sdk/rh;

    invoke-direct {v0}, Lcom/flurry/sdk/rh;-><init>()V

    sput-object v0, Lcom/flurry/sdk/rh;->d:Lcom/flurry/sdk/rh;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/flurry/sdk/rt;-><init>()V

    return-void
.end method

.method public static r()Lcom/flurry/sdk/rh;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/flurry/sdk/rh;->c:Lcom/flurry/sdk/rh;

    return-object v0
.end method

.method public static s()Lcom/flurry/sdk/rh;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/flurry/sdk/rh;->d:Lcom/flurry/sdk/rh;

    return-object v0
.end method


# virtual methods
.method public a(D)D
    .locals 2

    .prologue
    .line 66
    sget-object v0, Lcom/flurry/sdk/rh;->c:Lcom/flurry/sdk/rh;

    if-ne p0, v0, :cond_0

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public final a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 73
    sget-object v0, Lcom/flurry/sdk/rh;->c:Lcom/flurry/sdk/rh;

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->a(Z)V

    .line 74
    return-void

    .line 73
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 82
    if-ne p1, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public f()Z
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x1

    return v0
.end method

.method public i()Z
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/flurry/sdk/rh;->c:Lcom/flurry/sdk/rh;

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public m()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/flurry/sdk/rh;->c:Lcom/flurry/sdk/rh;

    if-ne p0, v0, :cond_0

    const-string v0, "true"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "false"

    goto :goto_0
.end method
