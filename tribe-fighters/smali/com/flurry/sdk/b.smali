.class public final Lcom/flurry/sdk/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final b:Ljava/lang/String;


# instance fields
.field private final c:Ljava/lang/String;

.field private final d:Z

.field private final e:J

.field private final f:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 17
    const-class v0, Lcom/flurry/sdk/b;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/b;->b:Ljava/lang/String;

    .line 18
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "requested"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "filled"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "unfilled"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "rendered"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "clicked"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "videoStart"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "videoCompleted"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "videoProgressed"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "sentToUrl"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "adClosed"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "adWillClose"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "renderFailed"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "requestAdComponents"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "urlVerified"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "capExhausted"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "capNotExhausted"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/b;->a:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/io/DataInput;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    invoke-interface {p1}, Ljava/io/DataInput;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/b;->c:Ljava/lang/String;

    .line 48
    invoke-interface {p1}, Ljava/io/DataInput;->readBoolean()Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/sdk/b;->d:Z

    .line 49
    invoke-interface {p1}, Ljava/io/DataInput;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flurry/sdk/b;->e:J

    .line 50
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    .line 51
    invoke-interface {p1}, Ljava/io/DataInput;->readShort()S

    move-result v1

    .line 52
    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    .line 54
    iget-object v2, p0, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    invoke-interface {p1}, Ljava/io/DataInput;->readUTF()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1}, Ljava/io/DataInput;->readUTF()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    add-int/lit8 v0, v0, 0x1

    int-to-short v0, v0

    goto :goto_0

    .line 56
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZJLjava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZJ",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    sget-object v0, Lcom/flurry/sdk/b;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 30
    sget-object v0, Lcom/flurry/sdk/b;->b:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AdEvent initialized with unrecognized type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/flurry/sdk/b;->c:Ljava/lang/String;

    .line 33
    iput-boolean p2, p0, Lcom/flurry/sdk/b;->d:Z

    .line 34
    iput-wide p3, p0, Lcom/flurry/sdk/b;->e:J

    .line 35
    if-nez p5, :cond_1

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    .line 43
    :goto_0
    return-void

    .line 41
    :cond_1
    iput-object p5, p0, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    goto :goto_0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/flurry/sdk/b;->c:Ljava/lang/String;

    return-object v0
.end method

.method public a(Ljava/io/DataOutput;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lcom/flurry/sdk/b;->c:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeUTF(Ljava/lang/String;)V

    .line 61
    iget-boolean v0, p0, Lcom/flurry/sdk/b;->d:Z

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeBoolean(Z)V

    .line 62
    iget-wide v0, p0, Lcom/flurry/sdk/b;->e:J

    invoke-interface {p1, v0, v1}, Ljava/io/DataOutput;->writeLong(J)V

    .line 63
    iget-object v0, p0, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeShort(I)V

    .line 64
    iget-object v0, p0, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 66
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/io/DataOutput;->writeUTF(Ljava/lang/String;)V

    .line 67
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeUTF(Ljava/lang/String;)V

    goto :goto_0

    .line 69
    :cond_0
    return-void
.end method

.method public b()Z
    .locals 1

    .prologue
    .line 78
    iget-boolean v0, p0, Lcom/flurry/sdk/b;->d:Z

    return v0
.end method

.method public c()J
    .locals 2

    .prologue
    .line 83
    iget-wide v0, p0, Lcom/flurry/sdk/b;->e:J

    return-wide v0
.end method

.method public d()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 88
    iget-object v0, p0, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 93
    if-ne p0, p1, :cond_1

    .line 103
    :cond_0
    :goto_0
    return v0

    .line 97
    :cond_1
    instance-of v2, p1, Lcom/flurry/sdk/b;

    if-nez v2, :cond_2

    move v0, v1

    .line 98
    goto :goto_0

    .line 101
    :cond_2
    check-cast p1, Lcom/flurry/sdk/b;

    .line 103
    iget-object v2, p0, Lcom/flurry/sdk/b;->c:Ljava/lang/String;

    iget-object v3, p1, Lcom/flurry/sdk/b;->c:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-boolean v2, p0, Lcom/flurry/sdk/b;->d:Z

    iget-boolean v3, p1, Lcom/flurry/sdk/b;->d:Z

    if-ne v2, v3, :cond_3

    iget-wide v2, p0, Lcom/flurry/sdk/b;->e:J

    iget-wide v4, p1, Lcom/flurry/sdk/b;->e:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    iget-object v3, p1, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    iget-object v3, p1, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 111
    const/16 v0, 0x11

    .line 113
    iget-object v1, p0, Lcom/flurry/sdk/b;->c:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 114
    iget-object v1, p0, Lcom/flurry/sdk/b;->c:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    or-int/2addr v0, v1

    .line 117
    :cond_0
    iget-boolean v1, p0, Lcom/flurry/sdk/b;->d:Z

    if-eqz v1, :cond_1

    .line 118
    or-int/lit8 v0, v0, 0x1

    .line 121
    :cond_1
    int-to-long v0, v0

    iget-wide v2, p0, Lcom/flurry/sdk/b;->e:J

    or-long/2addr v0, v2

    long-to-int v0, v0

    .line 123
    iget-object v1, p0, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    if-eqz v1, :cond_2

    .line 124
    iget-object v1, p0, Lcom/flurry/sdk/b;->f:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    or-int/2addr v0, v1

    .line 127
    :cond_2
    return v0
.end method
