.class final Lcom/flurry/android/ck;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static ev:I


# instance fields
.field private final ew:I

.field private final ex:J

.field private final ey:Ljava/lang/String;

.field private ez:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/fc;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const/4 v0, 0x1

    sput v0, Lcom/flurry/android/ck;->ev:I

    return-void
.end method

.method constructor <init>(JLjava/lang/String;)V
    .locals 2

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    sget v0, Lcom/flurry/android/ck;->ev:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/flurry/android/ck;->ev:I

    iput v0, p0, Lcom/flurry/android/ck;->ew:I

    .line 22
    iput-wide p1, p0, Lcom/flurry/android/ck;->ex:J

    .line 23
    iput-object p3, p0, Lcom/flurry/android/ck;->ey:Ljava/lang/String;

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    .line 26
    return-void
.end method

.method constructor <init>(Ljava/io/DataInput;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/ck;->ew:I

    .line 31
    invoke-interface {p1}, Ljava/io/DataInput;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flurry/android/ck;->ex:J

    .line 32
    invoke-interface {p1}, Ljava/io/DataInput;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/ck;->ey:Ljava/lang/String;

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    .line 34
    invoke-interface {p1}, Ljava/io/DataInput;->readShort()S

    move-result v1

    .line 35
    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    .line 37
    iget-object v2, p0, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    new-instance v3, Lcom/flurry/android/fc;

    invoke-direct {v3, p1}, Lcom/flurry/android/fc;-><init>(Ljava/io/DataInput;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    add-int/lit8 v0, v0, 0x1

    int-to-short v0, v0

    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method


# virtual methods
.method final a(Lcom/flurry/android/fc;)V
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    return-void
.end method

.method final a(Ljava/io/DataOutput;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    iget v0, p0, Lcom/flurry/android/ck;->ew:I

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeInt(I)V

    .line 48
    iget-wide v0, p0, Lcom/flurry/android/ck;->ex:J

    invoke-interface {p1, v0, v1}, Ljava/io/DataOutput;->writeLong(J)V

    .line 49
    iget-object v0, p0, Lcom/flurry/android/ck;->ey:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeUTF(Ljava/lang/String;)V

    .line 50
    iget-object v0, p0, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeShort(I)V

    .line 51
    iget-object v0, p0, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/fc;

    .line 53
    invoke-virtual {v0, p1}, Lcom/flurry/android/fc;->a(Ljava/io/DataOutput;)V

    goto :goto_0

    .line 55
    :cond_0
    return-void
.end method

.method final ac()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/flurry/android/ck;->ey:Ljava/lang/String;

    return-object v0
.end method

.method final ad()J
    .locals 2

    .prologue
    .line 69
    iget-wide v0, p0, Lcom/flurry/android/ck;->ex:J

    return-wide v0
.end method

.method final ae()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/fc;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 79
    if-ne p0, p1, :cond_1

    .line 89
    :cond_0
    :goto_0
    return v0

    .line 83
    :cond_1
    instance-of v2, p1, Lcom/flurry/android/ck;

    if-nez v2, :cond_2

    move v0, v1

    .line 84
    goto :goto_0

    .line 87
    :cond_2
    check-cast p1, Lcom/flurry/android/ck;

    .line 89
    iget v2, p0, Lcom/flurry/android/ck;->ew:I

    iget v3, p1, Lcom/flurry/android/ck;->ew:I

    if-ne v2, v3, :cond_3

    iget-wide v2, p0, Lcom/flurry/android/ck;->ex:J

    iget-wide v4, p1, Lcom/flurry/android/ck;->ex:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/flurry/android/ck;->ey:Ljava/lang/String;

    iget-object v3, p1, Lcom/flurry/android/ck;->ey:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    iget-object v3, p1, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    iget-object v3, p1, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method final getIndex()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/flurry/android/ck;->ew:I

    return v0
.end method

.method public final hashCode()I
    .locals 4

    .prologue
    .line 97
    .line 99
    iget v0, p0, Lcom/flurry/android/ck;->ew:I

    or-int/lit8 v0, v0, 0x11

    .line 100
    int-to-long v0, v0

    iget-wide v2, p0, Lcom/flurry/android/ck;->ex:J

    or-long/2addr v0, v2

    long-to-int v0, v0

    .line 102
    iget-object v1, p0, Lcom/flurry/android/ck;->ey:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 103
    iget-object v1, p0, Lcom/flurry/android/ck;->ey:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    or-int/2addr v0, v1

    .line 106
    :cond_0
    iget-object v1, p0, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    if-eqz v1, :cond_1

    .line 107
    iget-object v1, p0, Lcom/flurry/android/ck;->ez:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    or-int/2addr v0, v1

    .line 110
    :cond_1
    return v0
.end method
