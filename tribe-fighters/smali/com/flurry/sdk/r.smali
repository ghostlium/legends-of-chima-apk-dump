.class Lcom/flurry/sdk/r;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:[B

.field private f:Lcom/flurry/sdk/ch;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-class v0, Lcom/flurry/sdk/r;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/r;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLcom/flurry/sdk/ch;)V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/flurry/sdk/r;->b:Ljava/lang/String;

    .line 32
    iput-object p2, p0, Lcom/flurry/sdk/r;->c:Ljava/lang/String;

    .line 33
    iput-object p3, p0, Lcom/flurry/sdk/r;->d:Ljava/lang/String;

    .line 34
    iput-object p4, p0, Lcom/flurry/sdk/r;->e:[B

    .line 35
    iput-object p5, p0, Lcom/flurry/sdk/r;->f:Lcom/flurry/sdk/ch;

    .line 36
    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .prologue
    .line 40
    new-instance v0, Lcom/flurry/sdk/x;

    invoke-direct {v0}, Lcom/flurry/sdk/x;-><init>()V

    .line 42
    iget-object v1, p0, Lcom/flurry/sdk/r;->e:[B

    iget-object v2, p0, Lcom/flurry/sdk/r;->b:Ljava/lang/String;

    const-class v3, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogResponse;

    invoke-virtual {v0, v1, v2, v3}, Lcom/flurry/sdk/x;->a([BLjava/lang/String;Ljava/lang/Class;)Lcom/flurry/sdk/gv;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogResponse;

    .line 43
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogResponse;->b()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "success"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 44
    iget-object v0, p0, Lcom/flurry/sdk/r;->f:Lcom/flurry/sdk/ch;

    const/16 v1, 0xc8

    const-string v2, ""

    iget-object v3, p0, Lcom/flurry/sdk/r;->c:Ljava/lang/String;

    iget-object v4, p0, Lcom/flurry/sdk/r;->d:Ljava/lang/String;

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/flurry/sdk/ch;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    :goto_0
    return-void

    .line 46
    :cond_0
    if-eqz v0, :cond_1

    .line 47
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogResponse;->c()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 48
    const/4 v2, 0x6

    sget-object v3, Lcom/flurry/sdk/r;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 52
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/r;->f:Lcom/flurry/sdk/ch;

    iget-object v1, p0, Lcom/flurry/sdk/r;->c:Ljava/lang/String;

    iget-object v2, p0, Lcom/flurry/sdk/r;->d:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/flurry/sdk/ch;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
