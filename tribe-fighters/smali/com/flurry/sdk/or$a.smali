.class public final Lcom/flurry/sdk/or$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/or;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field protected a:I

.field protected b:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected c:Lcom/flurry/sdk/rx;

.field protected d:Z


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/rx;Z)V
    .locals 1

    .prologue
    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 231
    iput-object p1, p0, Lcom/flurry/sdk/or$a;->c:Lcom/flurry/sdk/rx;

    .line 232
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/or$a;->b:Ljava/lang/Class;

    .line 233
    iput-boolean p2, p0, Lcom/flurry/sdk/or$a;->d:Z

    .line 234
    invoke-static {p1, p2}, Lcom/flurry/sdk/or$a;->a(Lcom/flurry/sdk/rx;Z)I

    move-result v0

    iput v0, p0, Lcom/flurry/sdk/or$a;->a:I

    .line 235
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 223
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 224
    iput-object p1, p0, Lcom/flurry/sdk/or$a;->b:Ljava/lang/Class;

    .line 225
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/or$a;->c:Lcom/flurry/sdk/rx;

    .line 226
    iput-boolean p2, p0, Lcom/flurry/sdk/or$a;->d:Z

    .line 227
    invoke-static {p1, p2}, Lcom/flurry/sdk/or$a;->a(Ljava/lang/Class;Z)I

    move-result v0

    iput v0, p0, Lcom/flurry/sdk/or$a;->a:I

    .line 228
    return-void
.end method

.method private static final a(Lcom/flurry/sdk/rx;Z)I
    .locals 1

    .prologue
    .line 246
    invoke-virtual {p0}, Lcom/flurry/sdk/rx;->hashCode()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 247
    if-eqz p1, :cond_0

    .line 248
    add-int/lit8 v0, v0, -0x1

    .line 250
    :cond_0
    return v0
.end method

.method private static final a(Ljava/lang/Class;Z)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z)I"
        }
    .end annotation

    .prologue
    .line 238
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 239
    if-eqz p1, :cond_0

    .line 240
    add-int/lit8 v0, v0, 0x1

    .line 242
    :cond_0
    return v0
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/rx;)V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 268
    iput-object p1, p0, Lcom/flurry/sdk/or$a;->c:Lcom/flurry/sdk/rx;

    .line 269
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/or$a;->b:Ljava/lang/Class;

    .line 270
    iput-boolean v1, p0, Lcom/flurry/sdk/or$a;->d:Z

    .line 271
    invoke-static {p1, v1}, Lcom/flurry/sdk/or$a;->a(Lcom/flurry/sdk/rx;Z)I

    move-result v0

    iput v0, p0, Lcom/flurry/sdk/or$a;->a:I

    .line 272
    return-void
.end method

.method public a(Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 254
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/or$a;->c:Lcom/flurry/sdk/rx;

    .line 255
    iput-object p1, p0, Lcom/flurry/sdk/or$a;->b:Ljava/lang/Class;

    .line 256
    iput-boolean v1, p0, Lcom/flurry/sdk/or$a;->d:Z

    .line 257
    invoke-static {p1, v1}, Lcom/flurry/sdk/or$a;->a(Ljava/lang/Class;Z)I

    move-result v0

    iput v0, p0, Lcom/flurry/sdk/or$a;->a:I

    .line 258
    return-void
.end method

.method public b(Lcom/flurry/sdk/rx;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 275
    iput-object p1, p0, Lcom/flurry/sdk/or$a;->c:Lcom/flurry/sdk/rx;

    .line 276
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/or$a;->b:Ljava/lang/Class;

    .line 277
    iput-boolean v1, p0, Lcom/flurry/sdk/or$a;->d:Z

    .line 278
    invoke-static {p1, v1}, Lcom/flurry/sdk/or$a;->a(Lcom/flurry/sdk/rx;Z)I

    move-result v0

    iput v0, p0, Lcom/flurry/sdk/or$a;->a:I

    .line 279
    return-void
.end method

.method public b(Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 261
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/or$a;->c:Lcom/flurry/sdk/rx;

    .line 262
    iput-object p1, p0, Lcom/flurry/sdk/or$a;->b:Ljava/lang/Class;

    .line 263
    iput-boolean v1, p0, Lcom/flurry/sdk/or$a;->d:Z

    .line 264
    invoke-static {p1, v1}, Lcom/flurry/sdk/or$a;->a(Ljava/lang/Class;Z)I

    move-result v0

    iput v0, p0, Lcom/flurry/sdk/or$a;->a:I

    .line 265
    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 293
    if-ne p1, p0, :cond_1

    .line 301
    :cond_0
    :goto_0
    return v0

    .line 294
    :cond_1
    check-cast p1, Lcom/flurry/sdk/or$a;

    .line 295
    iget-boolean v2, p1, Lcom/flurry/sdk/or$a;->d:Z

    iget-boolean v3, p0, Lcom/flurry/sdk/or$a;->d:Z

    if-ne v2, v3, :cond_3

    .line 296
    iget-object v2, p0, Lcom/flurry/sdk/or$a;->b:Ljava/lang/Class;

    if-eqz v2, :cond_2

    .line 297
    iget-object v2, p1, Lcom/flurry/sdk/or$a;->b:Ljava/lang/Class;

    iget-object v3, p0, Lcom/flurry/sdk/or$a;->b:Ljava/lang/Class;

    if-eq v2, v3, :cond_0

    move v0, v1

    goto :goto_0

    .line 299
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/or$a;->c:Lcom/flurry/sdk/rx;

    iget-object v1, p1, Lcom/flurry/sdk/or$a;->c:Lcom/flurry/sdk/rx;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/rx;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_3
    move v0, v1

    .line 301
    goto :goto_0
.end method

.method public final hashCode()I
    .locals 1

    .prologue
    .line 281
    iget v0, p0, Lcom/flurry/sdk/or$a;->a:I

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/flurry/sdk/or$a;->b:Ljava/lang/Class;

    if-eqz v0, :cond_0

    .line 285
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{class: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/or$a;->b:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", typed? "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/flurry/sdk/or$a;->d:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 287
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/or$a;->c:Lcom/flurry/sdk/rx;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", typed? "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/flurry/sdk/or$a;->d:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
