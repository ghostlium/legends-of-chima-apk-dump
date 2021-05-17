.class public Lcom/amazon/insights/core/io/DecryptionException;
.super Ljava/io/IOException;
.source "DecryptionException.java"


# static fields
.field private static final serialVersionUID:J = 0x700d6ea6c1ed2398L


# direct methods
.method public constructor <init>(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 11
    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 12
    return-void
.end method
