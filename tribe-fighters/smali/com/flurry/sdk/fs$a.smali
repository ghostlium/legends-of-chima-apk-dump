.class public Lcom/flurry/sdk/fs$a;
.super Ljava/util/AbstractList;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/fq;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractList",
        "<TT;>;",
        "Lcom/flurry/sdk/fq",
        "<TT;>;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/flurry/sdk/fq",
        "<TT;>;>;"
    }
.end annotation


# static fields
.field private static final a:[Ljava/lang/Object;


# instance fields
.field private final b:Lcom/flurry/sdk/fm;

.field private c:I

.field private d:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 125
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lcom/flurry/sdk/fs$a;->a:[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(ILcom/flurry/sdk/fm;)V
    .locals 3

    .prologue
    .line 129
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 128
    sget-object v0, Lcom/flurry/sdk/fs$a;->a:[Ljava/lang/Object;

    iput-object v0, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    .line 130
    if-eqz p2, :cond_0

    sget-object v0, Lcom/flurry/sdk/fm$v;->c:Lcom/flurry/sdk/fm$v;

    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/fm$v;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 131
    :cond_0
    new-instance v0, Lcom/flurry/sdk/fk;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not an array schema: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_1
    iput-object p2, p0, Lcom/flurry/sdk/fs$a;->b:Lcom/flurry/sdk/fm;

    .line 133
    if-eqz p1, :cond_2

    .line 134
    new-array v0, p1, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    .line 135
    :cond_2
    return-void
.end method

.method static synthetic a(Lcom/flurry/sdk/fs$a;)I
    .locals 1

    .prologue
    .line 123
    iget v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    return v0
.end method

.method static synthetic b(Lcom/flurry/sdk/fs$a;)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/fq;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/fq",
            "<TT;>;)I"
        }
    .end annotation

    .prologue
    .line 203
    invoke-static {}, Lcom/flurry/sdk/fs;->a()Lcom/flurry/sdk/fs;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/sdk/fs$a;->a()Lcom/flurry/sdk/fm;

    move-result-object v1

    invoke-virtual {v0, p0, p1, v1}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/Object;Lcom/flurry/sdk/fm;)I

    move-result v0

    return v0
.end method

.method public a()Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/flurry/sdk/fs$a;->b:Lcom/flurry/sdk/fm;

    return-object v0
.end method

.method public add(ILjava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 171
    iget v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    if-gt p1, v0, :cond_0

    if-gez p1, :cond_1

    .line 172
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Index "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " out of bounds."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 174
    :cond_1
    iget v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    iget-object v1, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    array-length v1, v1

    if-ne v0, v1, :cond_2

    .line 175
    iget v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 176
    iget-object v1, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    iget v2, p0, Lcom/flurry/sdk/fs$a;->c:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 177
    iput-object v0, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    .line 179
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    add-int/lit8 v2, p1, 0x1

    iget v3, p0, Lcom/flurry/sdk/fs$a;->c:I

    sub-int/2addr v3, p1

    invoke-static {v0, p1, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 180
    iget-object v0, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    aput-object p2, v0, p1

    .line 181
    iget v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    .line 182
    return-void
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 162
    iget v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    iget-object v1, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 163
    iget v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 164
    iget-object v1, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    iget v2, p0, Lcom/flurry/sdk/fs$a;->c:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 165
    iput-object v0, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    .line 167
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    iget v1, p0, Lcom/flurry/sdk/fs$a;->c:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/flurry/sdk/fs$a;->c:I

    aput-object p1, v0, v1

    .line 168
    const/4 v0, 0x1

    return v0
.end method

.method public b()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 200
    iget v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    iget-object v1, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    iget v1, p0, Lcom/flurry/sdk/fs$a;->c:I

    aget-object v0, v0, v1

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 147
    const/4 v0, 0x0

    iput v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    return-void
.end method

.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 122
    check-cast p1, Lcom/flurry/sdk/fq;

    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs$a;->a(Lcom/flurry/sdk/fq;)I

    move-result v0

    return v0
.end method

.method public get(I)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 157
    iget v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    if-lt p1, v0, :cond_0

    .line 158
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Index "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " out of bounds."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 149
    new-instance v0, Lcom/flurry/sdk/fs$a$1;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/fs$a$1;-><init>(Lcom/flurry/sdk/fs$a;)V

    return-object v0
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 191
    iget v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    if-lt p1, v0, :cond_0

    .line 192
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Index "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " out of bounds."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 193
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    aget-object v0, v0, p1

    .line 194
    iget v1, p0, Lcom/flurry/sdk/fs$a;->c:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/flurry/sdk/fs$a;->c:I

    .line 195
    iget-object v1, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    add-int/lit8 v2, p1, 0x1

    iget-object v3, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    iget v4, p0, Lcom/flurry/sdk/fs$a;->c:I

    sub-int/2addr v4, p1

    invoke-static {v1, v2, v3, p1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 196
    iget-object v1, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    iget v2, p0, Lcom/flurry/sdk/fs$a;->c:I

    const/4 v3, 0x0

    aput-object v3, v1, v2

    .line 197
    return-object v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)TT;"
        }
    .end annotation

    .prologue
    .line 184
    iget v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    if-lt p1, v0, :cond_0

    .line 185
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Index "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " out of bounds."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 186
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    aget-object v0, v0, p1

    .line 187
    iget-object v1, p0, Lcom/flurry/sdk/fs$a;->d:[Ljava/lang/Object;

    aput-object p2, v1, p1

    .line 188
    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 146
    iget v0, p0, Lcom/flurry/sdk/fs$a;->c:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 220
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 221
    const-string v0, "["

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 222
    const/4 v0, 0x0

    .line 223
    invoke-virtual {p0}, Lcom/flurry/sdk/fs$a;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 224
    if-nez v1, :cond_1

    const-string v1, "null"

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 225
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0}, Lcom/flurry/sdk/fs$a;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 226
    const-string v1, ", "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 224
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 228
    :cond_2
    const-string v0, "]"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 229
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
