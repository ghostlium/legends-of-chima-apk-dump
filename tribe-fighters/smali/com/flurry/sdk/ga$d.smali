.class Lcom/flurry/sdk/ga$d;
.super Lcom/flurry/sdk/ga$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ga;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "d"
.end annotation


# instance fields
.field protected b:Z

.field private c:Ljava/io/InputStream;


# direct methods
.method private constructor <init>(Ljava/io/InputStream;)V
    .locals 1

    .prologue
    .line 743
    invoke-direct {p0}, Lcom/flurry/sdk/ga$c;-><init>()V

    .line 740
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/sdk/ga$d;->b:Z

    .line 744
    iput-object p1, p0, Lcom/flurry/sdk/ga$d;->c:Ljava/io/InputStream;

    .line 745
    return-void
.end method

.method synthetic constructor <init>(Ljava/io/InputStream;Lcom/flurry/sdk/ga$1;)V
    .locals 0

    .prologue
    .line 738
    invoke-direct {p0, p1}, Lcom/flurry/sdk/ga$d;-><init>(Ljava/io/InputStream;)V

    return-void
.end method


# virtual methods
.method protected a(J)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v5, 0x0

    const/4 v1, 0x1

    .line 749
    const/4 v0, 0x0

    .line 750
    :goto_0
    cmp-long v2, p1, v5

    if-lez v2, :cond_3

    .line 751
    iget-object v2, p0, Lcom/flurry/sdk/ga$d;->c:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v2

    .line 752
    cmp-long v4, v2, v5

    if-lez v4, :cond_0

    .line 753
    sub-long/2addr p1, v2

    .line 754
    goto :goto_0

    .line 760
    :cond_0
    cmp-long v2, v2, v5

    if-nez v2, :cond_2

    .line 761
    if-eqz v0, :cond_1

    .line 762
    iput-boolean v1, p0, Lcom/flurry/sdk/ga$d;->b:Z

    .line 763
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    :cond_1
    move v0, v1

    .line 766
    goto :goto_0

    .line 769
    :cond_2
    iput-boolean v1, p0, Lcom/flurry/sdk/ga$d;->b:Z

    .line 770
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 772
    :cond_3
    return-void
.end method

.method protected a([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 810
    :goto_0
    if-lez p3, :cond_1

    .line 811
    iget-object v0, p0, Lcom/flurry/sdk/ga$d;->c:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 812
    if-gez v0, :cond_0

    .line 813
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/ga$d;->b:Z

    .line 814
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 816
    :cond_0
    sub-int/2addr p3, v0

    .line 817
    add-int/2addr p2, v0

    .line 818
    goto :goto_0

    .line 819
    :cond_1
    return-void
.end method

.method protected b([BII)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 823
    move v0, p3

    .line 825
    :goto_0
    if-lez v0, :cond_0

    .line 826
    :try_start_0
    iget-object v1, p0, Lcom/flurry/sdk/ga$d;->c:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 827
    if-gez v1, :cond_1

    .line 828
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/flurry/sdk/ga$d;->b:Z
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 837
    :cond_0
    :goto_1
    sub-int v0, p3, v0

    return v0

    .line 831
    :cond_1
    sub-int/2addr v0, v1

    .line 832
    add-int/2addr p2, v1

    .line 833
    goto :goto_0

    .line 834
    :catch_0
    move-exception v1

    .line 835
    iput-boolean v2, p0, Lcom/flurry/sdk/ga$d;->b:Z

    goto :goto_1
.end method

.method protected b(J)J
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    const/4 v1, 0x1

    .line 776
    .line 778
    const/4 v0, 0x0

    move-wide v2, p1

    .line 779
    :goto_0
    cmp-long v4, v2, v7

    if-lez v4, :cond_1

    .line 780
    :try_start_0
    iget-object v4, p0, Lcom/flurry/sdk/ga$d;->c:Ljava/io/InputStream;

    invoke-virtual {v4, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v4

    .line 781
    cmp-long v6, v4, v7

    if-lez v6, :cond_0

    .line 782
    sub-long/2addr v2, v4

    .line 783
    goto :goto_0

    .line 789
    :cond_0
    cmp-long v4, v4, v7

    if-nez v4, :cond_3

    .line 790
    if-eqz v0, :cond_2

    .line 791
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/ga$d;->b:Z

    .line 805
    :cond_1
    :goto_1
    sub-long v0, p1, v2

    return-wide v0

    :cond_2
    move v0, v1

    .line 795
    goto :goto_0

    .line 798
    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/ga$d;->b:Z
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 802
    :catch_0
    move-exception v0

    .line 803
    iput-boolean v1, p0, Lcom/flurry/sdk/ga$d;->b:Z

    goto :goto_1
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 859
    iget-object v0, p0, Lcom/flurry/sdk/ga$d;->c:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 860
    return-void
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 842
    iget-object v0, p0, Lcom/flurry/sdk/ga$d;->a:Lcom/flurry/sdk/ga$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/ga$a;->c()I

    move-result v0

    iget-object v1, p0, Lcom/flurry/sdk/ga$d;->a:Lcom/flurry/sdk/ga$a;

    invoke-virtual {v1}, Lcom/flurry/sdk/ga$a;->b()I

    move-result v1

    sub-int/2addr v0, v1

    if-nez v0, :cond_0

    .line 843
    iget-object v0, p0, Lcom/flurry/sdk/ga$d;->c:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 848
    :goto_0
    return v0

    .line 845
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ga$d;->a:Lcom/flurry/sdk/ga$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/ga$a;->b()I

    move-result v1

    .line 846
    iget-object v0, p0, Lcom/flurry/sdk/ga$d;->a:Lcom/flurry/sdk/ga$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/ga$a;->d()[B

    move-result-object v0

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    .line 847
    iget-object v2, p0, Lcom/flurry/sdk/ga$d;->a:Lcom/flurry/sdk/ga$a;

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v1}, Lcom/flurry/sdk/ga$a;->a(I)V

    goto :goto_0
.end method
