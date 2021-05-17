.class public final Lcom/google/android/gms/drive/internal/q;
.super Lcom/google/android/gms/internal/ht;


# static fields
.field public static final oG:[Lcom/google/android/gms/drive/internal/q;


# instance fields
.field public oH:Ljava/lang/String;

.field public oI:J

.field public oJ:J

.field private oK:I

.field public versionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/android/gms/drive/internal/q;

    sput-object v0, Lcom/google/android/gms/drive/internal/q;->oG:[Lcom/google/android/gms/drive/internal/q;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    const-wide/16 v1, -0x1

    invoke-direct {p0}, Lcom/google/android/gms/internal/ht;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/drive/internal/q;->versionCode:I

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/drive/internal/q;->oH:Ljava/lang/String;

    iput-wide v1, p0, Lcom/google/android/gms/drive/internal/q;->oI:J

    iput-wide v1, p0, Lcom/google/android/gms/drive/internal/q;->oJ:J

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/drive/internal/q;->oK:I

    return-void
.end method

.method public static e([B)Lcom/google/android/gms/drive/internal/q;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/hs;
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/drive/internal/q;

    invoke-direct {v0}, Lcom/google/android/gms/drive/internal/q;-><init>()V

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/ht;->a(Lcom/google/android/gms/internal/ht;[B)Lcom/google/android/gms/internal/ht;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/drive/internal/q;

    return-object v0
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/hq;)Lcom/google/android/gms/drive/internal/q;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/hq;->fz()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/hv;->a(Lcom/google/android/gms/internal/hq;I)Z

    move-result v0

    if-nez v0, :cond_0

    :sswitch_0
    return-object p0

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/hq;->fB()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/drive/internal/q;->versionCode:I

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/hq;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/drive/internal/q;->oH:Ljava/lang/String;

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/hq;->fC()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/drive/internal/q;->oI:J

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/hq;->fC()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/drive/internal/q;->oJ:J

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x12 -> :sswitch_2
        0x18 -> :sswitch_3
        0x20 -> :sswitch_4
    .end sparse-switch
.end method

.method public a(Lcom/google/android/gms/internal/hr;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    iget v1, p0, Lcom/google/android/gms/drive/internal/q;->versionCode:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/hr;->d(II)V

    const/4 v0, 0x2

    iget-object v1, p0, Lcom/google/android/gms/drive/internal/q;->oH:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/hr;->b(ILjava/lang/String;)V

    const/4 v0, 0x3

    iget-wide v1, p0, Lcom/google/android/gms/drive/internal/q;->oI:J

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/android/gms/internal/hr;->c(IJ)V

    const/4 v0, 0x4

    iget-wide v1, p0, Lcom/google/android/gms/drive/internal/q;->oJ:J

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/android/gms/internal/hr;->c(IJ)V

    return-void
.end method

.method public synthetic b(Lcom/google/android/gms/internal/hq;)Lcom/google/android/gms/internal/ht;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/internal/q;->a(Lcom/google/android/gms/internal/hq;)Lcom/google/android/gms/drive/internal/q;

    move-result-object v0

    return-object v0
.end method

.method public cw()I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget v2, p0, Lcom/google/android/gms/drive/internal/q;->versionCode:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/hr;->e(II)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/android/gms/drive/internal/q;->oH:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/hr;->d(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x3

    iget-wide v2, p0, Lcom/google/android/gms/drive/internal/q;->oI:J

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/hr;->d(IJ)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x4

    iget-wide v2, p0, Lcom/google/android/gms/drive/internal/q;->oJ:J

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/hr;->d(IJ)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/drive/internal/q;->oK:I

    return v0
.end method
