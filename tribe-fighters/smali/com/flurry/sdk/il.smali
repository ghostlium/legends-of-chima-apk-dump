.class public final Lcom/flurry/sdk/il;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field protected static final a:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Lcom/flurry/sdk/il;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final d:[C

.field private static final e:[B


# instance fields
.field protected b:Lcom/flurry/sdk/sf;

.field protected final c:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    invoke-static {}, Lcom/flurry/sdk/sa;->d()[C

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/il;->d:[C

    .line 24
    invoke-static {}, Lcom/flurry/sdk/sa;->e()[B

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/il;->e:[B

    .line 40
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/flurry/sdk/il;->a:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/16 v3, 0x30

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    const/4 v0, 0x6

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/flurry/sdk/il;->c:[C

    .line 69
    iget-object v0, p0, Lcom/flurry/sdk/il;->c:[C

    const/4 v1, 0x0

    const/16 v2, 0x5c

    aput-char v2, v0, v1

    .line 70
    iget-object v0, p0, Lcom/flurry/sdk/il;->c:[C

    const/4 v1, 0x2

    aput-char v3, v0, v1

    .line 71
    iget-object v0, p0, Lcom/flurry/sdk/il;->c:[C

    const/4 v1, 0x3

    aput-char v3, v0, v1

    .line 72
    return-void
.end method

.method private a(I[C)I
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 346
    if-gez p1, :cond_0

    .line 347
    add-int/lit8 v0, p1, 0x1

    neg-int v0, v0

    .line 348
    const/16 v1, 0x75

    aput-char v1, p2, v2

    .line 350
    const/4 v1, 0x4

    sget-object v2, Lcom/flurry/sdk/il;->d:[C

    shr-int/lit8 v3, v0, 0x4

    aget-char v2, v2, v3

    aput-char v2, p2, v1

    .line 351
    const/4 v1, 0x5

    sget-object v2, Lcom/flurry/sdk/il;->d:[C

    and-int/lit8 v0, v0, 0xf

    aget-char v0, v2, v0

    aput-char v0, p2, v1

    .line 352
    const/4 v0, 0x6

    .line 355
    :goto_0
    return v0

    .line 354
    :cond_0
    int-to-char v0, p1

    aput-char v0, p2, v2

    .line 355
    const/4 v0, 0x2

    goto :goto_0
.end method

.method public static a()Lcom/flurry/sdk/il;
    .locals 3

    .prologue
    .line 80
    sget-object v0, Lcom/flurry/sdk/il;->a:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/SoftReference;

    .line 81
    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 83
    :goto_0
    if-nez v0, :cond_0

    .line 84
    new-instance v0, Lcom/flurry/sdk/il;

    invoke-direct {v0}, Lcom/flurry/sdk/il;-><init>()V

    .line 85
    sget-object v1, Lcom/flurry/sdk/il;->a:Ljava/lang/ThreadLocal;

    new-instance v2, Ljava/lang/ref/SoftReference;

    invoke-direct {v2, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 87
    :cond_0
    return-object v0

    .line 81
    :cond_1
    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/il;

    goto :goto_0
.end method


# virtual methods
.method public a(Ljava/lang/String;)[C
    .locals 11

    .prologue
    const/4 v5, 0x0

    .line 102
    iget-object v0, p0, Lcom/flurry/sdk/il;->b:Lcom/flurry/sdk/sf;

    .line 103
    if-nez v0, :cond_0

    .line 105
    new-instance v0, Lcom/flurry/sdk/sf;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/flurry/sdk/sf;-><init>(Lcom/flurry/sdk/ry;)V

    iput-object v0, p0, Lcom/flurry/sdk/il;->b:Lcom/flurry/sdk/sf;

    .line 107
    :cond_0
    invoke-virtual {v0}, Lcom/flurry/sdk/sf;->k()[C

    move-result-object v3

    .line 108
    invoke-static {}, Lcom/flurry/sdk/sa;->c()[I

    move-result-object v6

    .line 109
    array-length v7, v6

    .line 111
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    move v1, v5

    move v2, v5

    .line 115
    :goto_0
    if-ge v2, v8, :cond_4

    .line 118
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 119
    if-ge v9, v7, :cond_3

    aget v4, v6, v9

    if-eqz v4, :cond_3

    .line 132
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    aget v2, v6, v2

    .line 133
    iget-object v9, p0, Lcom/flurry/sdk/il;->c:[C

    invoke-direct {p0, v2, v9}, Lcom/flurry/sdk/il;->a(I[C)I

    move-result v2

    .line 134
    add-int v9, v1, v2

    array-length v10, v3

    if-le v9, v10, :cond_5

    .line 135
    array-length v9, v3

    sub-int/2addr v9, v1

    .line 136
    if-lez v9, :cond_2

    .line 137
    iget-object v10, p0, Lcom/flurry/sdk/il;->c:[C

    invoke-static {v10, v5, v3, v1, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 139
    :cond_2
    invoke-virtual {v0}, Lcom/flurry/sdk/sf;->m()[C

    move-result-object v3

    .line 140
    sub-int/2addr v2, v9

    .line 141
    iget-object v10, p0, Lcom/flurry/sdk/il;->c:[C

    invoke-static {v10, v9, v3, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 142
    add-int/2addr v1, v2

    :goto_1
    move v2, v4

    .line 148
    goto :goto_0

    .line 122
    :cond_3
    array-length v4, v3

    if-lt v1, v4, :cond_6

    .line 123
    invoke-virtual {v0}, Lcom/flurry/sdk/sf;->m()[C

    move-result-object v3

    move v4, v5

    .line 126
    :goto_2
    add-int/lit8 v1, v4, 0x1

    aput-char v9, v3, v4

    .line 127
    add-int/lit8 v2, v2, 0x1

    if-lt v2, v8, :cond_1

    .line 149
    :cond_4
    invoke-virtual {v0, v1}, Lcom/flurry/sdk/sf;->a(I)V

    .line 150
    invoke-virtual {v0}, Lcom/flurry/sdk/sf;->g()[C

    move-result-object v0

    return-object v0

    .line 144
    :cond_5
    iget-object v9, p0, Lcom/flurry/sdk/il;->c:[C

    invoke-static {v9, v5, v3, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 145
    add-int/2addr v1, v2

    goto :goto_1

    :cond_6
    move v4, v1

    goto :goto_2
.end method
