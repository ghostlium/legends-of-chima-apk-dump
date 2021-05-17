.class public Lcom/flurry/sdk/sb$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/ia;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/sb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field static final a:Ljava/lang/String;

.field static final b:[C


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 251
    const/4 v0, 0x0

    .line 253
    :try_start_0
    const-string v1, "line.separator"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 255
    :goto_0
    if-nez v0, :cond_0

    const-string v0, "\n"

    :cond_0
    sput-object v0, Lcom/flurry/sdk/sb$b;->a:Ljava/lang/String;

    .line 259
    const/16 v0, 0x40

    new-array v0, v0, [C

    sput-object v0, Lcom/flurry/sdk/sb$b;->b:[C

    .line 261
    sget-object v0, Lcom/flurry/sdk/sb$b;->b:[C

    const/16 v1, 0x20

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([CC)V

    .line 262
    return-void

    .line 254
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 264
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/hp;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    const/16 v3, 0x40

    const/4 v2, 0x0

    .line 273
    sget-object v0, Lcom/flurry/sdk/sb$b;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->c(Ljava/lang/String;)V

    .line 274
    add-int v0, p2, p2

    .line 275
    :goto_0
    if-le v0, v3, :cond_0

    .line 276
    sget-object v1, Lcom/flurry/sdk/sb$b;->b:[C

    invoke-virtual {p1, v1, v2, v3}, Lcom/flurry/sdk/hp;->b([CII)V

    .line 277
    sget-object v1, Lcom/flurry/sdk/sb$b;->b:[C

    array-length v1, v1

    sub-int/2addr v0, v1

    goto :goto_0

    .line 279
    :cond_0
    sget-object v1, Lcom/flurry/sdk/sb$b;->b:[C

    invoke-virtual {p1, v1, v2, v0}, Lcom/flurry/sdk/hp;->b([CII)V

    .line 280
    return-void
.end method

.method public a()Z
    .locals 1

    .prologue
    .line 267
    const/4 v0, 0x0

    return v0
.end method
