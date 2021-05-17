.class public final Lcom/google/android/gms/internal/hv;
.super Ljava/lang/Object;


# static fields
.field static final CR:I

.field static final CS:I

.field static final CT:I

.field static final CU:I

.field public static final CV:[I

.field public static final CW:[J

.field public static final CX:[F

.field public static final CY:[D

.field public static final CZ:[Z

.field public static final Da:[Ljava/lang/String;

.field public static final Db:[[B

.field public static final Dc:[B


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v4, 0x3

    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    invoke-static {v2, v4}, Lcom/google/android/gms/internal/hv;->g(II)I

    move-result v0

    sput v0, Lcom/google/android/gms/internal/hv;->CR:I

    const/4 v0, 0x4

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/hv;->g(II)I

    move-result v0

    sput v0, Lcom/google/android/gms/internal/hv;->CS:I

    invoke-static {v3, v1}, Lcom/google/android/gms/internal/hv;->g(II)I

    move-result v0

    sput v0, Lcom/google/android/gms/internal/hv;->CT:I

    invoke-static {v4, v3}, Lcom/google/android/gms/internal/hv;->g(II)I

    move-result v0

    sput v0, Lcom/google/android/gms/internal/hv;->CU:I

    new-array v0, v1, [I

    sput-object v0, Lcom/google/android/gms/internal/hv;->CV:[I

    new-array v0, v1, [J

    sput-object v0, Lcom/google/android/gms/internal/hv;->CW:[J

    new-array v0, v1, [F

    sput-object v0, Lcom/google/android/gms/internal/hv;->CX:[F

    new-array v0, v1, [D

    sput-object v0, Lcom/google/android/gms/internal/hv;->CY:[D

    new-array v0, v1, [Z

    sput-object v0, Lcom/google/android/gms/internal/hv;->CZ:[Z

    new-array v0, v1, [Ljava/lang/String;

    sput-object v0, Lcom/google/android/gms/internal/hv;->Da:[Ljava/lang/String;

    new-array v0, v1, [[B

    sput-object v0, Lcom/google/android/gms/internal/hv;->Db:[[B

    new-array v0, v1, [B

    sput-object v0, Lcom/google/android/gms/internal/hv;->Dc:[B

    return-void
.end method

.method public static a(Lcom/google/android/gms/internal/hq;I)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/hq;->bq(I)Z

    move-result v0

    return v0
.end method

.method public static bA(I)I
    .locals 1

    ushr-int/lit8 v0, p0, 0x3

    return v0
.end method

.method static bz(I)I
    .locals 1

    and-int/lit8 v0, p0, 0x7

    return v0
.end method

.method static g(II)I
    .locals 1

    shl-int/lit8 v0, p0, 0x3

    or-int/2addr v0, p1

    return v0
.end method
