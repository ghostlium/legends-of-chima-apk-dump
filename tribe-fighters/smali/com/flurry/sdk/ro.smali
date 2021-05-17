.class public final Lcom/flurry/sdk/ro;
.super Lcom/flurry/sdk/rt;
.source "SourceFile"


# static fields
.field public static final c:Lcom/flurry/sdk/ro;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    new-instance v0, Lcom/flurry/sdk/ro;

    invoke-direct {v0}, Lcom/flurry/sdk/ro;-><init>()V

    sput-object v0, Lcom/flurry/sdk/ro;->c:Lcom/flurry/sdk/ro;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/flurry/sdk/rt;-><init>()V

    return-void
.end method

.method public static r()Lcom/flurry/sdk/ro;
    .locals 1

    .prologue
    .line 21
    sget-object v0, Lcom/flurry/sdk/ro;->c:Lcom/flurry/sdk/ro;

    return-object v0
.end method


# virtual methods
.method public a(D)D
    .locals 2

    .prologue
    .line 43
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 50
    invoke-virtual {p1}, Lcom/flurry/sdk/hp;->f()V

    .line 51
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 56
    if-ne p1, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public g()Z
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x1

    return v0
.end method

.method public m()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    const-string v0, "null"

    return-object v0
.end method
