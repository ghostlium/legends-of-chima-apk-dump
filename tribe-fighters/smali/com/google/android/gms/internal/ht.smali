.class public abstract Lcom/google/android/gms/internal/ht;
.super Ljava/lang/Object;


# instance fields
.field protected oK:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/ht;->oK:I

    return-void
.end method

.method public static final a(Lcom/google/android/gms/internal/ht;[B)Lcom/google/android/gms/internal/ht;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/google/android/gms/internal/ht;",
            ">(TT;[B)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/hs;
        }
    .end annotation

    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/internal/ht;->b(Lcom/google/android/gms/internal/ht;[BII)Lcom/google/android/gms/internal/ht;

    move-result-object v0

    return-object v0
.end method

.method public static final a(Lcom/google/android/gms/internal/ht;[BII)V
    .locals 3

    :try_start_0
    invoke-static {p1, p2, p3}, Lcom/google/android/gms/internal/hr;->b([BII)Lcom/google/android/gms/internal/hr;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/ht;->a(Lcom/google/android/gms/internal/hr;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/hr;->fK()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Serializing to a byte array threw an IOException (should never happen)."

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static final a(Lcom/google/android/gms/internal/ht;)[B
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ht;->cw()I

    move-result v0

    new-array v0, v0, [B

    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {p0, v0, v1, v2}, Lcom/google/android/gms/internal/ht;->a(Lcom/google/android/gms/internal/ht;[BII)V

    return-object v0
.end method

.method public static final b(Lcom/google/android/gms/internal/ht;[BII)Lcom/google/android/gms/internal/ht;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/google/android/gms/internal/ht;",
            ">(TT;[BII)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/hs;
        }
    .end annotation

    :try_start_0
    invoke-static {p1, p2, p3}, Lcom/google/android/gms/internal/hq;->a([BII)Lcom/google/android/gms/internal/hq;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/ht;->b(Lcom/google/android/gms/internal/hq;)Lcom/google/android/gms/internal/ht;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/hq;->bp(I)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/hs; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    return-object p0

    :catch_0
    move-exception v0

    throw v0

    :catch_1
    move-exception v0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Reading from a byte array threw an IOException (should never happen)."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public abstract a(Lcom/google/android/gms/internal/hr;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract b(Lcom/google/android/gms/internal/hq;)Lcom/google/android/gms/internal/ht;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public cw()I
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/ht;->oK:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Lcom/google/android/gms/internal/hu;->b(Lcom/google/android/gms/internal/ht;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
