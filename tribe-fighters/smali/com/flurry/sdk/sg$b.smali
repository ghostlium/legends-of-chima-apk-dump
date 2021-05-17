.class public final Lcom/flurry/sdk/sg$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/sg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# static fields
.field private static final d:[Lcom/flurry/sdk/hw;


# instance fields
.field protected a:Lcom/flurry/sdk/sg$b;

.field protected b:J

.field protected final c:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 1130
    const/16 v0, 0x10

    new-array v0, v0, [Lcom/flurry/sdk/hw;

    sput-object v0, Lcom/flurry/sdk/sg$b;->d:[Lcom/flurry/sdk/hw;

    .line 1131
    invoke-static {}, Lcom/flurry/sdk/hw;->values()[Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 1132
    sget-object v1, Lcom/flurry/sdk/sg$b;->d:[Lcom/flurry/sdk/hw;

    const/16 v2, 0xf

    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v0, v4, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1133
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 1152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1150
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/flurry/sdk/sg$b;->c:[Ljava/lang/Object;

    .line 1152
    return-void
.end method


# virtual methods
.method public a(I)Lcom/flurry/sdk/hw;
    .locals 3

    .prologue
    .line 1158
    iget-wide v0, p0, Lcom/flurry/sdk/sg$b;->b:J

    .line 1159
    if-lez p1, :cond_0

    .line 1160
    shl-int/lit8 v2, p1, 0x2

    shr-long/2addr v0, v2

    .line 1162
    :cond_0
    long-to-int v0, v0

    and-int/lit8 v0, v0, 0xf

    .line 1163
    sget-object v1, Lcom/flurry/sdk/sg$b;->d:[Lcom/flurry/sdk/hw;

    aget-object v0, v1, v0

    return-object v0
.end method

.method public a()Lcom/flurry/sdk/sg$b;
    .locals 1

    .prologue
    .line 1170
    iget-object v0, p0, Lcom/flurry/sdk/sg$b;->a:Lcom/flurry/sdk/sg$b;

    return-object v0
.end method

.method public a(ILcom/flurry/sdk/hw;)Lcom/flurry/sdk/sg$b;
    .locals 2

    .prologue
    .line 1176
    const/16 v0, 0x10

    if-ge p1, v0, :cond_0

    .line 1177
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/sg$b;->b(ILcom/flurry/sdk/hw;)V

    .line 1178
    const/4 v0, 0x0

    .line 1182
    :goto_0
    return-object v0

    .line 1180
    :cond_0
    new-instance v0, Lcom/flurry/sdk/sg$b;

    invoke-direct {v0}, Lcom/flurry/sdk/sg$b;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/sg$b;->a:Lcom/flurry/sdk/sg$b;

    .line 1181
    iget-object v0, p0, Lcom/flurry/sdk/sg$b;->a:Lcom/flurry/sdk/sg$b;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2}, Lcom/flurry/sdk/sg$b;->b(ILcom/flurry/sdk/hw;)V

    .line 1182
    iget-object v0, p0, Lcom/flurry/sdk/sg$b;->a:Lcom/flurry/sdk/sg$b;

    goto :goto_0
.end method

.method public a(ILcom/flurry/sdk/hw;Ljava/lang/Object;)Lcom/flurry/sdk/sg$b;
    .locals 2

    .prologue
    .line 1187
    const/16 v0, 0x10

    if-ge p1, v0, :cond_0

    .line 1188
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/sg$b;->b(ILcom/flurry/sdk/hw;Ljava/lang/Object;)V

    .line 1189
    const/4 v0, 0x0

    .line 1193
    :goto_0
    return-object v0

    .line 1191
    :cond_0
    new-instance v0, Lcom/flurry/sdk/sg$b;

    invoke-direct {v0}, Lcom/flurry/sdk/sg$b;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/sg$b;->a:Lcom/flurry/sdk/sg$b;

    .line 1192
    iget-object v0, p0, Lcom/flurry/sdk/sg$b;->a:Lcom/flurry/sdk/sg$b;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2, p3}, Lcom/flurry/sdk/sg$b;->b(ILcom/flurry/sdk/hw;Ljava/lang/Object;)V

    .line 1193
    iget-object v0, p0, Lcom/flurry/sdk/sg$b;->a:Lcom/flurry/sdk/sg$b;

    goto :goto_0
.end method

.method public b(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1167
    iget-object v0, p0, Lcom/flurry/sdk/sg$b;->c:[Ljava/lang/Object;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public b(ILcom/flurry/sdk/hw;)V
    .locals 4

    .prologue
    .line 1198
    invoke-virtual {p2}, Lcom/flurry/sdk/hw;->ordinal()I

    move-result v0

    int-to-long v0, v0

    .line 1202
    if-lez p1, :cond_0

    .line 1203
    shl-int/lit8 v2, p1, 0x2

    shl-long/2addr v0, v2

    .line 1205
    :cond_0
    iget-wide v2, p0, Lcom/flurry/sdk/sg$b;->b:J

    or-long/2addr v0, v2

    iput-wide v0, p0, Lcom/flurry/sdk/sg$b;->b:J

    .line 1206
    return-void
.end method

.method public b(ILcom/flurry/sdk/hw;Ljava/lang/Object;)V
    .locals 4

    .prologue
    .line 1210
    iget-object v0, p0, Lcom/flurry/sdk/sg$b;->c:[Ljava/lang/Object;

    aput-object p3, v0, p1

    .line 1211
    invoke-virtual {p2}, Lcom/flurry/sdk/hw;->ordinal()I

    move-result v0

    int-to-long v0, v0

    .line 1215
    if-lez p1, :cond_0

    .line 1216
    shl-int/lit8 v2, p1, 0x2

    shl-long/2addr v0, v2

    .line 1218
    :cond_0
    iget-wide v2, p0, Lcom/flurry/sdk/sg$b;->b:J

    or-long/2addr v0, v2

    iput-wide v0, p0, Lcom/flurry/sdk/sg$b;->b:J

    .line 1219
    return-void
.end method
