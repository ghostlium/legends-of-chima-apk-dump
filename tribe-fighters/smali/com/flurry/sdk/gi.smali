.class public Lcom/flurry/sdk/gi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/gi$1;,
        Lcom/flurry/sdk/gi$a;
    }
.end annotation


# static fields
.field private static final c:Lcom/flurry/sdk/gi;


# instance fields
.field protected a:I

.field protected b:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 49
    new-instance v0, Lcom/flurry/sdk/gi$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/flurry/sdk/gi$a;-><init>(Lcom/flurry/sdk/gi$1;)V

    sput-object v0, Lcom/flurry/sdk/gi;->c:Lcom/flurry/sdk/gi;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/16 v0, 0x800

    iput v0, p0, Lcom/flurry/sdk/gi;->a:I

    .line 53
    const/high16 v0, 0x10000

    iput v0, p0, Lcom/flurry/sdk/gi;->b:I

    .line 326
    return-void
.end method

.method public static a()Lcom/flurry/sdk/gi;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/flurry/sdk/gi;->c:Lcom/flurry/sdk/gi;

    return-object v0
.end method


# virtual methods
.method public a(Ljava/io/OutputStream;Lcom/flurry/sdk/gb;)Lcom/flurry/sdk/gb;
    .locals 2

    .prologue
    .line 171
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/flurry/sdk/gc;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 172
    :cond_0
    new-instance v0, Lcom/flurry/sdk/gc;

    iget v1, p0, Lcom/flurry/sdk/gi;->a:I

    invoke-direct {v0, p1, v1}, Lcom/flurry/sdk/gc;-><init>(Ljava/io/OutputStream;I)V

    .line 174
    :goto_0
    return-object v0

    :cond_1
    check-cast p2, Lcom/flurry/sdk/gc;

    iget v0, p0, Lcom/flurry/sdk/gi;->a:I

    invoke-virtual {p2, p1, v0}, Lcom/flurry/sdk/gc;->a(Ljava/io/OutputStream;I)Lcom/flurry/sdk/gc;

    move-result-object v0

    goto :goto_0
.end method

.method public a(I)Lcom/flurry/sdk/gi;
    .locals 2

    .prologue
    const/high16 v0, 0x1000000

    const/16 v1, 0x20

    .line 82
    if-ge p1, v1, :cond_1

    .line 84
    :goto_0
    if-le v1, v0, :cond_0

    .line 86
    :goto_1
    iput v0, p0, Lcom/flurry/sdk/gi;->a:I

    .line 87
    return-object p0

    :cond_0
    move v0, v1

    goto :goto_1

    :cond_1
    move v1, p1

    goto :goto_0
.end method

.method public b(Ljava/io/OutputStream;Lcom/flurry/sdk/gb;)Lcom/flurry/sdk/gb;
    .locals 2

    .prologue
    .line 212
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/flurry/sdk/gg;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 213
    :cond_0
    new-instance v0, Lcom/flurry/sdk/gg;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/gg;-><init>(Ljava/io/OutputStream;)V

    .line 215
    :goto_0
    return-object v0

    :cond_1
    check-cast p2, Lcom/flurry/sdk/gg;

    invoke-virtual {p2, p1}, Lcom/flurry/sdk/gg;->a(Ljava/io/OutputStream;)Lcom/flurry/sdk/gg;

    move-result-object v0

    goto :goto_0
.end method
