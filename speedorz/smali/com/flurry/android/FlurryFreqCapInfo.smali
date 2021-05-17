.class public Lcom/flurry/android/FlurryFreqCapInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private dn:Ljava/lang/String;

.field private do:J

.field private dp:J

.field private dq:I

.field private dr:I

.field private ds:I

.field private dt:I


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method constructor <init>(Ljava/io/DataInput;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-interface {p1}, Ljava/io/DataInput;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dn:Ljava/lang/String;

    .line 35
    invoke-interface {p1}, Ljava/io/DataInput;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->do:J

    .line 36
    invoke-interface {p1}, Ljava/io/DataInput;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dp:J

    .line 37
    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dq:I

    .line 38
    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dr:I

    .line 39
    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->ds:I

    .line 40
    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dt:I

    .line 41
    return-void
.end method

.method constructor <init>(Ljava/lang/String;JJIII)V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dn:Ljava/lang/String;

    .line 24
    iput-wide p2, p0, Lcom/flurry/android/FlurryFreqCapInfo;->do:J

    .line 25
    iput-wide p4, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dp:J

    .line 26
    iput p6, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dr:I

    .line 27
    iput p7, p0, Lcom/flurry/android/FlurryFreqCapInfo;->ds:I

    .line 28
    iput p8, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dt:I

    .line 29
    const/4 v0, 0x0

    iput v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dq:I

    .line 30
    return-void
.end method


# virtual methods
.method final a(Ljava/io/DataOutput;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    iget-object v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dn:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeUTF(Ljava/lang/String;)V

    .line 46
    iget-wide v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->do:J

    invoke-interface {p1, v0, v1}, Ljava/io/DataOutput;->writeLong(J)V

    .line 47
    iget-wide v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dp:J

    invoke-interface {p1, v0, v1}, Ljava/io/DataOutput;->writeLong(J)V

    .line 48
    iget v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dq:I

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeInt(I)V

    .line 49
    iget v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dr:I

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeInt(I)V

    .line 50
    iget v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->ds:I

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeInt(I)V

    .line 51
    iget v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dt:I

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeInt(I)V

    .line 52
    return-void
.end method

.method public getCopy()Lcom/flurry/android/FlurryFreqCapInfo;
    .locals 9

    .prologue
    .line 56
    new-instance v0, Lcom/flurry/android/FlurryFreqCapInfo;

    invoke-virtual {p0}, Lcom/flurry/android/FlurryFreqCapInfo;->getIdHash()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/android/FlurryFreqCapInfo;->getServeTime()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/flurry/android/FlurryFreqCapInfo;->getExpirationTime()J

    move-result-wide v4

    invoke-virtual {p0}, Lcom/flurry/android/FlurryFreqCapInfo;->getNewCap()I

    move-result v6

    invoke-virtual {p0}, Lcom/flurry/android/FlurryFreqCapInfo;->getPreviousCap()I

    move-result v7

    invoke-virtual {p0}, Lcom/flurry/android/FlurryFreqCapInfo;->getPreviousCapType()I

    move-result v8

    invoke-direct/range {v0 .. v8}, Lcom/flurry/android/FlurryFreqCapInfo;-><init>(Ljava/lang/String;JJIII)V

    .line 57
    invoke-virtual {p0}, Lcom/flurry/android/FlurryFreqCapInfo;->getViews()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/FlurryFreqCapInfo;->setViews(I)V

    .line 59
    return-object v0
.end method

.method public getExpirationTime()J
    .locals 2

    .prologue
    .line 95
    iget-wide v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dp:J

    return-wide v0
.end method

.method public getIdHash()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dn:Ljava/lang/String;

    return-object v0
.end method

.method public getNewCap()I
    .locals 1

    .prologue
    .line 83
    iget v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dr:I

    return v0
.end method

.method public getPreviousCap()I
    .locals 1

    .prologue
    .line 87
    iget v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->ds:I

    return v0
.end method

.method public getPreviousCapType()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dt:I

    return v0
.end method

.method public getServeTime()J
    .locals 2

    .prologue
    .line 99
    iget-wide v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->do:J

    return-wide v0
.end method

.method public getViews()I
    .locals 1

    .prologue
    .line 71
    iget v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dq:I

    return v0
.end method

.method public setIdHash(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dn:Ljava/lang/String;

    .line 68
    return-void
.end method

.method public setViews(I)V
    .locals 0

    .prologue
    .line 75
    iput p1, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dq:I

    .line 76
    return-void
.end method

.method public updateViews()V
    .locals 1

    .prologue
    .line 79
    iget v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dq:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flurry/android/FlurryFreqCapInfo;->dq:I

    .line 80
    return-void
.end method
