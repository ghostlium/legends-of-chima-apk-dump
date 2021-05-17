.class public final Lcom/flurry/sdk/ie;
.super Lcom/flurry/sdk/hv;
.source "SourceFile"


# instance fields
.field protected final c:Lcom/flurry/sdk/ie;

.field protected d:I

.field protected e:I

.field protected f:Ljava/lang/String;

.field protected g:Lcom/flurry/sdk/ie;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/ie;III)V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/flurry/sdk/hv;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/ie;->g:Lcom/flurry/sdk/ie;

    .line 45
    iput p2, p0, Lcom/flurry/sdk/ie;->a:I

    .line 46
    iput-object p1, p0, Lcom/flurry/sdk/ie;->c:Lcom/flurry/sdk/ie;

    .line 47
    iput p3, p0, Lcom/flurry/sdk/ie;->d:I

    .line 48
    iput p4, p0, Lcom/flurry/sdk/ie;->e:I

    .line 49
    const/4 v0, -0x1

    iput v0, p0, Lcom/flurry/sdk/ie;->b:I

    .line 50
    return-void
.end method

.method public static a(II)Lcom/flurry/sdk/ie;
    .locals 3

    .prologue
    .line 65
    new-instance v0, Lcom/flurry/sdk/ie;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0, p1}, Lcom/flurry/sdk/ie;-><init>(Lcom/flurry/sdk/ie;III)V

    return-object v0
.end method

.method public static g()Lcom/flurry/sdk/ie;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 73
    new-instance v0, Lcom/flurry/sdk/ie;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v3, v2, v3}, Lcom/flurry/sdk/ie;-><init>(Lcom/flurry/sdk/ie;III)V

    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)Lcom/flurry/sdk/hq;
    .locals 6

    .prologue
    .line 125
    const-wide/16 v2, -0x1

    .line 127
    new-instance v0, Lcom/flurry/sdk/hq;

    iget v4, p0, Lcom/flurry/sdk/ie;->d:I

    iget v5, p0, Lcom/flurry/sdk/ie;->e:I

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/hq;-><init>(Ljava/lang/Object;JII)V

    return-object v0
.end method

.method protected final a(III)V
    .locals 1

    .prologue
    .line 54
    iput p1, p0, Lcom/flurry/sdk/ie;->a:I

    .line 55
    const/4 v0, -0x1

    iput v0, p0, Lcom/flurry/sdk/ie;->b:I

    .line 56
    iput p2, p0, Lcom/flurry/sdk/ie;->d:I

    .line 57
    iput p3, p0, Lcom/flurry/sdk/ie;->e:I

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/ie;->f:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 148
    iput-object p1, p0, Lcom/flurry/sdk/ie;->f:Ljava/lang/String;

    .line 149
    return-void
.end method

.method public final b(II)Lcom/flurry/sdk/ie;
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 78
    iget-object v0, p0, Lcom/flurry/sdk/ie;->g:Lcom/flurry/sdk/ie;

    .line 79
    if-nez v0, :cond_0

    .line 80
    new-instance v0, Lcom/flurry/sdk/ie;

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/flurry/sdk/ie;-><init>(Lcom/flurry/sdk/ie;III)V

    iput-object v0, p0, Lcom/flurry/sdk/ie;->g:Lcom/flurry/sdk/ie;

    .line 84
    :goto_0
    return-object v0

    .line 83
    :cond_0
    invoke-virtual {v0, v1, p1, p2}, Lcom/flurry/sdk/ie;->a(III)V

    goto :goto_0
.end method

.method public final c(II)Lcom/flurry/sdk/ie;
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 89
    iget-object v0, p0, Lcom/flurry/sdk/ie;->g:Lcom/flurry/sdk/ie;

    .line 90
    if-nez v0, :cond_0

    .line 91
    new-instance v0, Lcom/flurry/sdk/ie;

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/flurry/sdk/ie;-><init>(Lcom/flurry/sdk/ie;III)V

    iput-object v0, p0, Lcom/flurry/sdk/ie;->g:Lcom/flurry/sdk/ie;

    .line 95
    :goto_0
    return-object v0

    .line 94
    :cond_0
    invoke-virtual {v0, v1, p1, p2}, Lcom/flurry/sdk/ie;->a(III)V

    goto :goto_0
.end method

.method public final h()Ljava/lang/String;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/flurry/sdk/ie;->f:Ljava/lang/String;

    return-object v0
.end method

.method public final i()Lcom/flurry/sdk/ie;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/flurry/sdk/ie;->c:Lcom/flurry/sdk/ie;

    return-object v0
.end method

.method public final j()Z
    .locals 2

    .prologue
    .line 142
    iget v0, p0, Lcom/flurry/sdk/ie;->b:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flurry/sdk/ie;->b:I

    .line 143
    iget v1, p0, Lcom/flurry/sdk/ie;->a:I

    if-eqz v1, :cond_0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x22

    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 165
    iget v1, p0, Lcom/flurry/sdk/ie;->a:I

    packed-switch v1, :pswitch_data_0

    .line 186
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 167
    :pswitch_0
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 170
    :pswitch_1
    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 171
    invoke-virtual {p0}, Lcom/flurry/sdk/ie;->f()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 175
    :pswitch_2
    const/16 v1, 0x7b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 176
    iget-object v1, p0, Lcom/flurry/sdk/ie;->f:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 177
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 178
    iget-object v1, p0, Lcom/flurry/sdk/ie;->f:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flurry/sdk/sa;->a(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 179
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 183
    :goto_1
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 181
    :cond_0
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 165
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
