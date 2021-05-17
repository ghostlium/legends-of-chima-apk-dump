.class public Lcom/flurry/sdk/qt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 24
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 25
    new-instance v1, Lcom/flurry/sdk/qt$1;

    invoke-direct {v1, p0, v0}, Lcom/flurry/sdk/qt$1;-><init>(Ljava/lang/Object;I)V

    return-object v1
.end method
