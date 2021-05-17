.class public final Lcom/flurry/sdk/sg$a;
.super Lcom/flurry/sdk/id;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/sg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field protected d:Lcom/flurry/sdk/hx;

.field protected e:Lcom/flurry/sdk/sg$b;

.field protected f:I

.field protected g:Lcom/flurry/sdk/ie;

.field protected h:Z

.field protected transient i:Lcom/flurry/sdk/rz;

.field protected j:Lcom/flurry/sdk/hq;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/sg$b;Lcom/flurry/sdk/hx;)V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 796
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/id;-><init>(I)V

    .line 786
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/sg$a;->j:Lcom/flurry/sdk/hq;

    .line 797
    iput-object p1, p0, Lcom/flurry/sdk/sg$a;->e:Lcom/flurry/sdk/sg$b;

    .line 798
    iput v1, p0, Lcom/flurry/sdk/sg$a;->f:I

    .line 799
    iput-object p2, p0, Lcom/flurry/sdk/sg$a;->d:Lcom/flurry/sdk/hx;

    .line 800
    invoke-static {v1, v1}, Lcom/flurry/sdk/ie;->a(II)Lcom/flurry/sdk/ie;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/sg$a;->g:Lcom/flurry/sdk/ie;

    .line 801
    return-void
.end method


# virtual methods
.method protected final A()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 1096
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->e:Lcom/flurry/sdk/sg$b;

    iget v1, p0, Lcom/flurry/sdk/sg$a;->f:I

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/sg$b;->b(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected final B()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 1101
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    invoke-virtual {v0}, Lcom/flurry/sdk/hw;->c()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1102
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Current token ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") not numeric, can not use numeric value accessors"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg$a;->a(Ljava/lang/String;)Lcom/flurry/sdk/hs;

    move-result-object v0

    throw v0

    .line 1104
    :cond_1
    return-void
.end method

.method protected H()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 1108
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->U()V

    .line 1109
    return-void
.end method

.method public a()Lcom/flurry/sdk/hx;
    .locals 1

    .prologue
    .line 808
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->d:Lcom/flurry/sdk/hx;

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/hq;)V
    .locals 0

    .prologue
    .line 804
    iput-object p1, p0, Lcom/flurry/sdk/sg$a;->j:Lcom/flurry/sdk/hq;

    .line 805
    return-void
.end method

.method public a(Lcom/flurry/sdk/hl;)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 1064
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    sget-object v1, Lcom/flurry/sdk/hw;->g:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_0

    .line 1066
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->A()Ljava/lang/Object;

    move-result-object v0

    .line 1067
    instance-of v1, v0, [B

    if-eqz v1, :cond_0

    .line 1068
    check-cast v0, [B

    check-cast v0, [B

    .line 1086
    :goto_0
    return-object v0

    .line 1072
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    sget-object v1, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_1

    .line 1073
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Current token ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") not VALUE_STRING (or VALUE_EMBEDDED_OBJECT with byte[]), can not access as binary"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg$a;->a(Ljava/lang/String;)Lcom/flurry/sdk/hs;

    move-result-object v0

    throw v0

    .line 1075
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->k()Ljava/lang/String;

    move-result-object v1

    .line 1076
    if-nez v1, :cond_2

    .line 1077
    const/4 v0, 0x0

    goto :goto_0

    .line 1079
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->i:Lcom/flurry/sdk/rz;

    .line 1080
    if-nez v0, :cond_3

    .line 1081
    new-instance v0, Lcom/flurry/sdk/rz;

    const/16 v2, 0x64

    invoke-direct {v0, v2}, Lcom/flurry/sdk/rz;-><init>(I)V

    iput-object v0, p0, Lcom/flurry/sdk/sg$a;->i:Lcom/flurry/sdk/rz;

    .line 1085
    :goto_1
    invoke-virtual {p0, v1, v0, p1}, Lcom/flurry/sdk/sg$a;->a(Ljava/lang/String;Lcom/flurry/sdk/rz;Lcom/flurry/sdk/hl;)V

    .line 1086
    invoke-virtual {v0}, Lcom/flurry/sdk/rz;->b()[B

    move-result-object v0

    goto :goto_0

    .line 1083
    :cond_3
    iget-object v2, p0, Lcom/flurry/sdk/sg$a;->i:Lcom/flurry/sdk/rz;

    invoke-virtual {v2}, Lcom/flurry/sdk/rz;->a()V

    goto :goto_1
.end method

.method public b()Lcom/flurry/sdk/hw;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v3, -0x1

    .line 856
    iget-boolean v1, p0, Lcom/flurry/sdk/sg$a;->h:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/flurry/sdk/sg$a;->e:Lcom/flurry/sdk/sg$b;

    if-nez v1, :cond_1

    .line 885
    :cond_0
    :goto_0
    return-object v0

    .line 859
    :cond_1
    iget v1, p0, Lcom/flurry/sdk/sg$a;->f:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/flurry/sdk/sg$a;->f:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_2

    .line 860
    const/4 v1, 0x0

    iput v1, p0, Lcom/flurry/sdk/sg$a;->f:I

    .line 861
    iget-object v1, p0, Lcom/flurry/sdk/sg$a;->e:Lcom/flurry/sdk/sg$b;

    invoke-virtual {v1}, Lcom/flurry/sdk/sg$b;->a()Lcom/flurry/sdk/sg$b;

    move-result-object v1

    iput-object v1, p0, Lcom/flurry/sdk/sg$a;->e:Lcom/flurry/sdk/sg$b;

    .line 862
    iget-object v1, p0, Lcom/flurry/sdk/sg$a;->e:Lcom/flurry/sdk/sg$b;

    if-eqz v1, :cond_0

    .line 866
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->e:Lcom/flurry/sdk/sg$b;

    iget v1, p0, Lcom/flurry/sdk/sg$a;->f:I

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/sg$b;->a(I)Lcom/flurry/sdk/hw;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    .line 868
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    sget-object v1, Lcom/flurry/sdk/hw;->f:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_5

    .line 869
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->A()Ljava/lang/Object;

    move-result-object v0

    .line 870
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_4

    check-cast v0, Ljava/lang/String;

    .line 871
    :goto_1
    iget-object v1, p0, Lcom/flurry/sdk/sg$a;->g:Lcom/flurry/sdk/ie;

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/ie;->a(Ljava/lang/String;)V

    .line 885
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    goto :goto_0

    .line 870
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 872
    :cond_5
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    sget-object v1, Lcom/flurry/sdk/hw;->b:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_6

    .line 873
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->g:Lcom/flurry/sdk/ie;

    invoke-virtual {v0, v3, v3}, Lcom/flurry/sdk/ie;->c(II)Lcom/flurry/sdk/ie;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/sg$a;->g:Lcom/flurry/sdk/ie;

    goto :goto_2

    .line 874
    :cond_6
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    sget-object v1, Lcom/flurry/sdk/hw;->d:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_7

    .line 875
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->g:Lcom/flurry/sdk/ie;

    invoke-virtual {v0, v3, v3}, Lcom/flurry/sdk/ie;->b(II)Lcom/flurry/sdk/ie;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/sg$a;->g:Lcom/flurry/sdk/ie;

    goto :goto_2

    .line 876
    :cond_7
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    sget-object v1, Lcom/flurry/sdk/hw;->c:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_8

    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    sget-object v1, Lcom/flurry/sdk/hw;->e:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_3

    .line 879
    :cond_8
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->g:Lcom/flurry/sdk/ie;

    invoke-virtual {v0}, Lcom/flurry/sdk/ie;->i()Lcom/flurry/sdk/ie;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/sg$a;->g:Lcom/flurry/sdk/ie;

    .line 881
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->g:Lcom/flurry/sdk/ie;

    if-nez v0, :cond_3

    .line 882
    invoke-static {v3, v3}, Lcom/flurry/sdk/ie;->a(II)Lcom/flurry/sdk/ie;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/sg$a;->g:Lcom/flurry/sdk/ie;

    goto :goto_2
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 841
    iget-boolean v0, p0, Lcom/flurry/sdk/sg$a;->h:Z

    if-nez v0, :cond_0

    .line 842
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/sg$a;->h:Z

    .line 844
    :cond_0
    return-void
.end method

.method public g()Ljava/lang/String;
    .locals 1

    .prologue
    .line 909
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->g:Lcom/flurry/sdk/ie;

    invoke-virtual {v0}, Lcom/flurry/sdk/ie;->h()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public h()Lcom/flurry/sdk/hq;
    .locals 1

    .prologue
    .line 901
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->i()Lcom/flurry/sdk/hq;

    move-result-object v0

    return-object v0
.end method

.method public i()Lcom/flurry/sdk/hq;
    .locals 1

    .prologue
    .line 905
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->j:Lcom/flurry/sdk/hq;

    if-nez v0, :cond_0

    sget-object v0, Lcom/flurry/sdk/hq;->a:Lcom/flurry/sdk/hq;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->j:Lcom/flurry/sdk/hq;

    goto :goto_0
.end method

.method public k()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 921
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    sget-object v2, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    sget-object v2, Lcom/flurry/sdk/hw;->f:Lcom/flurry/sdk/hw;

    if-ne v0, v2, :cond_4

    .line 923
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->A()Ljava/lang/Object;

    move-result-object v0

    .line 924
    instance-of v2, v0, Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 925
    check-cast v0, Ljava/lang/String;

    move-object v1, v0

    .line 938
    :cond_1
    :goto_0
    return-object v1

    .line 927
    :cond_2
    if-nez v0, :cond_3

    move-object v0, v1

    :goto_1
    move-object v1, v0

    goto :goto_0

    :cond_3
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 929
    :cond_4
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    if-eqz v0, :cond_1

    .line 932
    sget-object v0, Lcom/flurry/sdk/sg$1;->a:[I

    iget-object v2, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    invoke-virtual {v2}, Lcom/flurry/sdk/hw;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    .line 938
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    invoke-virtual {v0}, Lcom/flurry/sdk/hw;->a()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 935
    :pswitch_0
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->A()Ljava/lang/Object;

    move-result-object v0

    .line 936
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 932
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public l()[C
    .locals 1

    .prologue
    .line 943
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->k()Ljava/lang/String;

    move-result-object v0

    .line 944
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    goto :goto_0
.end method

.method public m()I
    .locals 1

    .prologue
    .line 949
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->k()Ljava/lang/String;

    move-result-object v0

    .line 950
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_0
.end method

.method public n()I
    .locals 1

    .prologue
    .line 954
    const/4 v0, 0x0

    return v0
.end method

.method public o()Z
    .locals 1

    .prologue
    .line 959
    const/4 v0, 0x0

    return v0
.end method

.method public final p()Ljava/lang/Number;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 1041
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->B()V

    .line 1042
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->A()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    return-object v0
.end method

.method public q()Lcom/flurry/sdk/ht$b;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 1029
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->p()Ljava/lang/Number;

    move-result-object v0

    .line 1030
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_0

    sget-object v0, Lcom/flurry/sdk/ht$b;->a:Lcom/flurry/sdk/ht$b;

    .line 1036
    :goto_0
    return-object v0

    .line 1031
    :cond_0
    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_1

    sget-object v0, Lcom/flurry/sdk/ht$b;->b:Lcom/flurry/sdk/ht$b;

    goto :goto_0

    .line 1032
    :cond_1
    instance-of v1, v0, Ljava/lang/Double;

    if-eqz v1, :cond_2

    sget-object v0, Lcom/flurry/sdk/ht$b;->e:Lcom/flurry/sdk/ht$b;

    goto :goto_0

    .line 1033
    :cond_2
    instance-of v1, v0, Ljava/math/BigDecimal;

    if-eqz v1, :cond_3

    sget-object v0, Lcom/flurry/sdk/ht$b;->f:Lcom/flurry/sdk/ht$b;

    goto :goto_0

    .line 1034
    :cond_3
    instance-of v1, v0, Ljava/lang/Float;

    if-eqz v1, :cond_4

    sget-object v0, Lcom/flurry/sdk/ht$b;->d:Lcom/flurry/sdk/ht$b;

    goto :goto_0

    .line 1035
    :cond_4
    instance-of v0, v0, Ljava/math/BigInteger;

    if-eqz v0, :cond_5

    sget-object v0, Lcom/flurry/sdk/ht$b;->c:Lcom/flurry/sdk/ht$b;

    goto :goto_0

    .line 1036
    :cond_5
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public t()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 1015
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    sget-object v1, Lcom/flurry/sdk/hw;->i:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_0

    .line 1016
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->A()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 1018
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->p()Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    goto :goto_0
.end method

.method public u()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 1023
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->p()Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public v()Ljava/math/BigInteger;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 971
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->p()Ljava/lang/Number;

    move-result-object v0

    .line 972
    instance-of v1, v0, Ljava/math/BigInteger;

    if-eqz v1, :cond_0

    .line 973
    check-cast v0, Ljava/math/BigInteger;

    .line 980
    :goto_0
    return-object v0

    .line 975
    :cond_0
    sget-object v1, Lcom/flurry/sdk/sg$1;->b:[I

    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->q()Lcom/flurry/sdk/ht$b;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/sdk/ht$b;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 980
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_0

    .line 977
    :pswitch_0
    check-cast v0, Ljava/math/BigDecimal;

    invoke-virtual {v0}, Ljava/math/BigDecimal;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_0

    .line 975
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method public w()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 1008
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->p()Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    return v0
.end method

.method public x()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 1003
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->p()Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public y()Ljava/math/BigDecimal;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 986
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->p()Ljava/lang/Number;

    move-result-object v0

    .line 987
    instance-of v1, v0, Ljava/math/BigDecimal;

    if-eqz v1, :cond_0

    .line 988
    check-cast v0, Ljava/math/BigDecimal;

    .line 998
    :goto_0
    return-object v0

    .line 990
    :cond_0
    sget-object v1, Lcom/flurry/sdk/sg$1;->b:[I

    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->q()Lcom/flurry/sdk/ht$b;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/sdk/ht$b;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 998
    :pswitch_0
    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v0

    goto :goto_0

    .line 993
    :pswitch_1
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v0

    goto :goto_0

    .line 995
    :pswitch_2
    new-instance v1, Ljava/math/BigDecimal;

    check-cast v0, Ljava/math/BigInteger;

    invoke-direct {v1, v0}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;)V

    move-object v0, v1

    goto :goto_0

    .line 990
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public z()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 1054
    iget-object v0, p0, Lcom/flurry/sdk/sg$a;->b:Lcom/flurry/sdk/hw;

    sget-object v1, Lcom/flurry/sdk/hw;->g:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_0

    .line 1055
    invoke-virtual {p0}, Lcom/flurry/sdk/sg$a;->A()Ljava/lang/Object;

    move-result-object v0

    .line 1057
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
