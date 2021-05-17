.class public Lcom/flurry/sdk/fm$q;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "q"
.end annotation


# instance fields
.field private a:Lcom/flurry/sdk/fm$o;

.field private b:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 925
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 926
    new-instance v0, Lcom/flurry/sdk/fm$o;

    invoke-direct {v0}, Lcom/flurry/sdk/fm$o;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/fm$q;->a:Lcom/flurry/sdk/fm$o;

    .line 927
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/fm$q;->b:Z

    return-void
.end method

.method private a(Lcom/flurry/sdk/ht;)Lcom/flurry/sdk/fm;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 977
    invoke-static {}, Lcom/flurry/sdk/fm;->q()Ljava/lang/ThreadLocal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 979
    :try_start_0
    invoke-static {}, Lcom/flurry/sdk/fm;->q()Ljava/lang/ThreadLocal;

    move-result-object v0

    iget-boolean v2, p0, Lcom/flurry/sdk/fm$q;->b:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 980
    sget-object v0, Lcom/flurry/sdk/fm;->b:Lcom/flurry/sdk/jq;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/jq;->a(Lcom/flurry/sdk/ht;)Lcom/flurry/sdk/hr;

    move-result-object v0

    iget-object v2, p0, Lcom/flurry/sdk/fm$q;->a:Lcom/flurry/sdk/fm$o;

    invoke-static {v0, v2}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/hr;Lcom/flurry/sdk/fm$o;)Lcom/flurry/sdk/fm;
    :try_end_0
    .catch Lcom/flurry/sdk/hs; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 984
    invoke-static {}, Lcom/flurry/sdk/fm;->q()Ljava/lang/ThreadLocal;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    return-object v0

    .line 981
    :catch_0
    move-exception v0

    .line 982
    :try_start_1
    new-instance v2, Lcom/flurry/sdk/fn;

    invoke-direct {v2, v0}, Lcom/flurry/sdk/fn;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 984
    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/flurry/sdk/fm;->q()Ljava/lang/ThreadLocal;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    throw v0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lcom/flurry/sdk/fm;
    .locals 2

    .prologue
    .line 970
    :try_start_0
    sget-object v0, Lcom/flurry/sdk/fm;->a:Lcom/flurry/sdk/hn;

    new-instance v1, Ljava/io/StringReader;

    invoke-direct {v1, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/hn;->a(Ljava/io/Reader;)Lcom/flurry/sdk/ht;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/fm$q;->a(Lcom/flurry/sdk/ht;)Lcom/flurry/sdk/fm;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    .line 971
    :catch_0
    move-exception v0

    .line 972
    new-instance v1, Lcom/flurry/sdk/fn;

    invoke-direct {v1, v0}, Lcom/flurry/sdk/fn;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
