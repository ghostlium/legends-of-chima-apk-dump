.class Lcom/flurry/sdk/gc$b;
.super Lcom/flurry/sdk/gc$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/gc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "b"
.end annotation


# instance fields
.field private final a:Ljava/io/OutputStream;


# direct methods
.method private constructor <init>(Ljava/io/OutputStream;)V
    .locals 0

    .prologue
    .line 192
    invoke-direct {p0}, Lcom/flurry/sdk/gc$a;-><init>()V

    .line 193
    iput-object p1, p0, Lcom/flurry/sdk/gc$b;->a:Ljava/io/OutputStream;

    .line 194
    return-void
.end method

.method synthetic constructor <init>(Ljava/io/OutputStream;Lcom/flurry/sdk/gc$1;)V
    .locals 0

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lcom/flurry/sdk/gc$b;-><init>(Ljava/io/OutputStream;)V

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    iget-object v0, p0, Lcom/flurry/sdk/gc$b;->a:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 203
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
    .line 198
    iget-object v0, p0, Lcom/flurry/sdk/gc$b;->a:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 199
    return-void
.end method
