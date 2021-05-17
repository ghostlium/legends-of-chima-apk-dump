.class public Lcom/flurry/sdk/w;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Ljava/lang/String;

.field private static b:Lcom/flurry/sdk/gf;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-class v0, Lcom/flurry/sdk/w;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/w;->a:Ljava/lang/String;

    .line 27
    new-instance v0, Lcom/flurry/sdk/gf;

    invoke-direct {v0}, Lcom/flurry/sdk/gf;-><init>()V

    sput-object v0, Lcom/flurry/sdk/w;->b:Lcom/flurry/sdk/gf;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized a([BLjava/lang/Class;)Lcom/flurry/sdk/gv;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Lcom/flurry/sdk/gv;",
            ">([B",
            "Ljava/lang/Class",
            "<TA;>;)TA;"
        }
    .end annotation

    .prologue
    .line 55
    const-class v1, Lcom/flurry/sdk/w;

    monitor-enter v1

    if-nez p0, :cond_0

    .line 56
    const/4 v0, 0x6

    :try_start_0
    sget-object v2, Lcom/flurry/sdk/w;->a:Ljava/lang/String;

    const-string v3, "convertBytesToResponse: bytes array is null"

    invoke-static {v0, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    const/4 v0, 0x0

    .line 62
    :goto_0
    monitor-exit v1

    return-object v0

    .line 60
    :cond_0
    :try_start_1
    invoke-static {p0, p1}, Lcom/flurry/sdk/w;->b([BLjava/lang/Class;)Lcom/flurry/sdk/gv;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 55
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized a(Lcom/flurry/sdk/gv;Ljava/lang/Class;)[B
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Lcom/flurry/sdk/gv;",
            ">(TA;",
            "Ljava/lang/Class",
            "<TA;>;)[B"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 31
    const-class v2, Lcom/flurry/sdk/w;

    monitor-enter v2

    if-nez p0, :cond_0

    .line 32
    const/4 v1, 0x6

    :try_start_0
    sget-object v3, Lcom/flurry/sdk/w;->a:Ljava/lang/String;

    const-string v4, "convertRequestToByte: Request is null"

    invoke-static {v1, v3, v4}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    :goto_0
    monitor-exit v2

    return-object v0

    .line 37
    :cond_0
    :try_start_1
    new-instance v1, Lcom/flurry/sdk/gt;

    invoke-direct {v1, p1}, Lcom/flurry/sdk/gt;-><init>(Ljava/lang/Class;)V

    .line 38
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 39
    invoke-static {}, Lcom/flurry/sdk/gi;->a()Lcom/flurry/sdk/gi;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Lcom/flurry/sdk/gi;->b(Ljava/io/OutputStream;Lcom/flurry/sdk/gb;)Lcom/flurry/sdk/gb;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    .line 42
    :try_start_2
    invoke-virtual {v1, p0, v4}, Lcom/flurry/sdk/gt;->a(Ljava/lang/Object;Lcom/flurry/sdk/gh;)V

    .line 43
    invoke-virtual {v4}, Lcom/flurry/sdk/gb;->flush()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    :try_start_3
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    goto :goto_0

    .line 44
    :catch_0
    move-exception v1

    .line 45
    const/4 v3, 0x6

    sget-object v4, Lcom/flurry/sdk/w;->a:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error generating adlog request"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 31
    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method private static b([BLjava/lang/Class;)Lcom/flurry/sdk/gv;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Lcom/flurry/sdk/gv;",
            ">([B",
            "Ljava/lang/Class",
            "<TA;>;)TA;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x6

    const/4 v5, 0x3

    const/4 v1, 0x0

    .line 74
    sget-object v0, Lcom/flurry/sdk/w;->b:Lcom/flurry/sdk/gf;

    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v0, v2, v1}, Lcom/flurry/sdk/gf;->a(Ljava/io/InputStream;Lcom/flurry/sdk/ga;)Lcom/flurry/sdk/ga;

    move-result-object v0

    .line 76
    :try_start_0
    new-instance v2, Lcom/flurry/sdk/gs;

    invoke-direct {v2, p1}, Lcom/flurry/sdk/gs;-><init>(Ljava/lang/Class;)V

    .line 77
    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Lcom/flurry/sdk/gs;->a(Ljava/lang/Object;Lcom/flurry/sdk/ge;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/gv;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 87
    :goto_0
    return-object v0

    .line 78
    :catch_0
    move-exception v0

    .line 79
    sget-object v2, Lcom/flurry/sdk/w;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ClassCastException in parseAvroBinary:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/ClassCastException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v2, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 80
    sget-object v0, Lcom/flurry/sdk/w;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ClassCastException in parseAvroBinary: bytes = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " type = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v0, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    move-object v0, v1

    .line 82
    goto :goto_0

    .line 83
    :catch_1
    move-exception v0

    .line 84
    sget-object v2, Lcom/flurry/sdk/w;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IOException in parseAvroBinary:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v2, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 85
    sget-object v0, Lcom/flurry/sdk/w;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IOException in parseAvroBinary: bytes = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " type = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v0, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    move-object v0, v1

    .line 87
    goto/16 :goto_0
.end method
