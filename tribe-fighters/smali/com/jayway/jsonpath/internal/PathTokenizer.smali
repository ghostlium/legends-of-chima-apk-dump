.class public Lcom/jayway/jsonpath/internal/PathTokenizer;
.super Ljava/lang/Object;
.source "PathTokenizer.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/jayway/jsonpath/internal/PathToken;",
        ">;"
    }
.end annotation


# instance fields
.field private transient index:I

.field private pathChars:[C

.field private pathTokens:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/jayway/jsonpath/internal/PathToken;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1, "jsonPath"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathTokens:Ljava/util/List;

    .line 31
    const/4 v2, 0x0

    iput v2, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->index:I

    .line 35
    const-string v2, "$"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "$["

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 36
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "$."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 38
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    iput-object v2, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathChars:[C

    .line 40
    invoke-virtual {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->splitPath()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 41
    .local v1, "pathFragment":Ljava/lang/String;
    iget-object v2, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathTokens:Ljava/util/List;

    new-instance v3, Lcom/jayway/jsonpath/internal/PathToken;

    invoke-direct {v3, v1}, Lcom/jayway/jsonpath/internal/PathToken;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 43
    .end local v1    # "pathFragment":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private varargs assertNotInvalidPeek([C)V
    .locals 8
    .param p1, "invalidChars"    # [C

    .prologue
    .line 227
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 236
    :cond_0
    return-void

    .line 230
    :cond_1
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->peek()C

    move-result v4

    .line 231
    .local v4, "peek":C
    move-object v0, p1

    .local v0, "arr$":[C
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-char v1, v0, v2

    .line 232
    .local v1, "check":C
    if-ne v1, v4, :cond_2

    .line 233
    new-instance v5, Lcom/jayway/jsonpath/InvalidPathException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Char: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " at current position is not valid!"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/jayway/jsonpath/InvalidPathException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 231
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private varargs assertValidPeek(Z[C)V
    .locals 8
    .param p1, "acceptEmpty"    # Z
    .param p2, "validChars"    # [C

    .prologue
    .line 239
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    if-eqz p1, :cond_1

    .line 256
    :cond_0
    return-void

    .line 242
    :cond_1
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 243
    new-instance v6, Lcom/jayway/jsonpath/InvalidPathException;

    const-string v7, "Path is incomplete"

    invoke-direct {v6, v7}, Lcom/jayway/jsonpath/InvalidPathException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 245
    :cond_2
    const/4 v2, 0x0

    .line 246
    .local v2, "found":Z
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->peek()C

    move-result v5

    .line 247
    .local v5, "peek":C
    move-object v0, p2

    .local v0, "arr$":[C
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_3

    aget-char v1, v0, v3

    .line 248
    .local v1, "check":C
    if-ne v1, v5, :cond_4

    .line 249
    const/4 v2, 0x1

    .line 253
    .end local v1    # "check":C
    :cond_3
    if-nez v2, :cond_0

    .line 254
    new-instance v6, Lcom/jayway/jsonpath/InvalidPathException;

    const-string v7, "Path is invalid"

    invoke-direct {v6, v7}, Lcom/jayway/jsonpath/InvalidPathException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 247
    .restart local v1    # "check":C
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private clean(Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 5
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x0

    .line 166
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 168
    .local v0, "src":Ljava/lang/String;
    const-string v1, "\'"

    invoke-direct {p0, v0, v1}, Lcom/jayway/jsonpath/internal/PathTokenizer;->trim(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 169
    const-string v1, ")"

    invoke-direct {p0, v0, v1}, Lcom/jayway/jsonpath/internal/PathTokenizer;->trim(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 170
    const-string v1, "("

    invoke-direct {p0, v0, v1}, Lcom/jayway/jsonpath/internal/PathTokenizer;->trim(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 171
    const-string v1, "?"

    invoke-direct {p0, v0, v1}, Lcom/jayway/jsonpath/internal/PathTokenizer;->trimLeft(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 172
    const-string v1, "@"

    invoke-direct {p0, v0, v1}, Lcom/jayway/jsonpath/internal/PathTokenizer;->trimLeft(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 174
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x5

    if-lt v1, v2, :cond_0

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    const-string v2, "[\'"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 175
    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 176
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 179
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private varargs extract(Z[C)Ljava/lang/String;
    .locals 4
    .param p1, "includeSopChar"    # Z
    .param p2, "stopChars"    # [C

    .prologue
    .line 134
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .local v1, "sb":Ljava/lang/StringBuilder;
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->peek()C

    move-result v2

    invoke-direct {p0, v2, p2}, Lcom/jayway/jsonpath/internal/PathTokenizer;->isStopChar(C[C)Z

    move-result v2

    if-nez v2, :cond_4

    .line 137
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->peek()C

    move-result v2

    const/16 v3, 0x28

    if-ne v2, v3, :cond_2

    .line 139
    :cond_1
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->poll()C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 140
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->peek()C

    move-result v2

    const/16 v3, 0x29

    if-ne v2, v3, :cond_1

    .line 141
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->poll()C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 144
    :cond_2
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->poll()C

    move-result v0

    .line 146
    .local v0, "c":C
    invoke-direct {p0, v0, p2}, Lcom/jayway/jsonpath/internal/PathTokenizer;->isStopChar(C[C)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 147
    if-eqz p1, :cond_0

    .line 148
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 151
    :cond_3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 155
    .end local v0    # "c":C
    :cond_4
    if-eqz p1, :cond_5

    .line 156
    const/4 v2, 0x0

    invoke-direct {p0, v2, p2}, Lcom/jayway/jsonpath/internal/PathTokenizer;->assertValidPeek(Z[C)V

    .line 157
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->poll()C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 161
    :goto_1
    invoke-direct {p0, v1}, Lcom/jayway/jsonpath/internal/PathTokenizer;->clean(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 159
    :cond_5
    const/4 v2, 0x1

    invoke-direct {p0, v2, p2}, Lcom/jayway/jsonpath/internal/PathTokenizer;->assertValidPeek(Z[C)V

    goto :goto_1
.end method

.method private isEmpty()Z
    .locals 2

    .prologue
    .line 83
    iget v0, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->index:I

    iget-object v1, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathChars:[C

    array-length v1, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private varargs isStopChar(C[C)Z
    .locals 5
    .param p1, "c"    # C
    .param p2, "scanFor"    # [C

    .prologue
    .line 207
    const/4 v2, 0x0

    .line 208
    .local v2, "found":Z
    move-object v0, p2

    .local v0, "arr$":[C
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-char v1, v0, v3

    .line 209
    .local v1, "check":C
    if-ne v1, p1, :cond_1

    .line 210
    const/4 v2, 0x1

    .line 214
    .end local v1    # "check":C
    :cond_0
    return v2

    .line 208
    .restart local v1    # "check":C
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private peek()C
    .locals 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathChars:[C

    iget v1, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->index:I

    aget-char v0, v0, v1

    return v0
.end method

.method private poll()C
    .locals 2

    .prologue
    .line 91
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->peek()C

    move-result v0

    .line 92
    .local v0, "peek":C
    iget v1, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->index:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->index:I

    .line 93
    return v0
.end method

.method private skip(C)V
    .locals 2
    .param p1, "target"    # C

    .prologue
    .line 218
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 224
    :cond_0
    return-void

    .line 221
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathChars:[C

    iget v1, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->index:I

    aget-char v0, v0, v1

    if-ne v0, p1, :cond_0

    .line 222
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->poll()C

    goto :goto_0
.end method

.method private trim(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "trim"    # Ljava/lang/String;

    .prologue
    .line 183
    invoke-direct {p0, p1, p2}, Lcom/jayway/jsonpath/internal/PathTokenizer;->trimRight(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/jayway/jsonpath/internal/PathTokenizer;->trimLeft(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private trimLeft(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "trim"    # Ljava/lang/String;

    .prologue
    .line 197
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 198
    .local v0, "scanFor":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 199
    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 200
    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 203
    :cond_0
    return-object p1
.end method

.method private trimRight(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "trim"    # Ljava/lang/String;

    .prologue
    .line 187
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 188
    .local v0, "scanFor":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 189
    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 190
    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 193
    :cond_0
    return-object p1
.end method


# virtual methods
.method public getFragments()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 46
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 47
    .local v0, "fragments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathTokens:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jayway/jsonpath/internal/PathToken;

    .line 48
    .local v2, "pathToken":Lcom/jayway/jsonpath/internal/PathToken;
    invoke-virtual {v2}, Lcom/jayway/jsonpath/internal/PathToken;->getFragment()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 50
    .end local v2    # "pathToken":Lcom/jayway/jsonpath/internal/PathToken;
    :cond_0
    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 58
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathChars:[C

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method

.method public getPathTokens()Ljava/util/LinkedList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/jayway/jsonpath/internal/PathToken;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    new-instance v0, Ljava/util/LinkedList;

    iget-object v1, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathTokens:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/jayway/jsonpath/internal/PathToken;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathTokens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public removeLastPathToken()Lcom/jayway/jsonpath/internal/PathToken;
    .locals 3

    .prologue
    .line 70
    iget-object v1, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathTokens:Ljava/util/List;

    iget-object v2, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathTokens:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jayway/jsonpath/internal/PathToken;

    .line 73
    .local v0, "lastPathToken":Lcom/jayway/jsonpath/internal/PathToken;
    iget-object v1, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathTokens:Ljava/util/List;

    iget-object v2, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathTokens:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 74
    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/PathTokenizer;->pathTokens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public splitPath()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v6, 0x2e

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 98
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 99
    .local v1, "fragments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 100
    const/16 v2, 0x20

    invoke-direct {p0, v2}, Lcom/jayway/jsonpath/internal/PathTokenizer;->skip(C)V

    .line 101
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->peek()C

    move-result v0

    .line 103
    .local v0, "current":C
    sparse-switch v0, :sswitch_data_0

    .line 124
    const/4 v2, 0x2

    new-array v2, v2, [C

    fill-array-data v2, :array_0

    invoke-direct {p0, v4, v2}, Lcom/jayway/jsonpath/internal/PathTokenizer;->extract(Z[C)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 105
    :sswitch_0
    invoke-static {v0}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->poll()C

    goto :goto_0

    .line 110
    :sswitch_1
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->poll()C

    .line 111
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->peek()C

    move-result v2

    if-ne v2, v6, :cond_0

    .line 112
    invoke-direct {p0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->poll()C

    .line 113
    const-string v2, ".."

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    new-array v2, v5, [C

    aput-char v6, v2, v4

    invoke-direct {p0, v2}, Lcom/jayway/jsonpath/internal/PathTokenizer;->assertNotInvalidPeek([C)V

    goto :goto_0

    .line 120
    :sswitch_2
    new-array v2, v5, [C

    const/16 v3, 0x5d

    aput-char v3, v2, v4

    invoke-direct {p0, v5, v2}, Lcom/jayway/jsonpath/internal/PathTokenizer;->extract(Z[C)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 127
    .end local v0    # "current":C
    :cond_1
    return-object v1

    .line 103
    :sswitch_data_0
    .sparse-switch
        0x24 -> :sswitch_0
        0x2e -> :sswitch_1
        0x5b -> :sswitch_2
    .end sparse-switch

    .line 124
    :array_0
    .array-data 2
        0x5bs
        0x2es
    .end array-data
.end method
