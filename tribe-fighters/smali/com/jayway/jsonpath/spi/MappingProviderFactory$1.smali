.class final Lcom/jayway/jsonpath/spi/MappingProviderFactory$1;
.super Lcom/jayway/jsonpath/spi/MappingProviderFactory;
.source "MappingProviderFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/spi/MappingProviderFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field private provider:Lcom/jayway/jsonpath/spi/MappingProvider;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/jayway/jsonpath/spi/MappingProviderFactory;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jayway/jsonpath/spi/MappingProviderFactory$1;->provider:Lcom/jayway/jsonpath/spi/MappingProvider;

    return-void
.end method


# virtual methods
.method protected create()Lcom/jayway/jsonpath/spi/MappingProvider;
    .locals 4

    .prologue
    .line 31
    iget-object v1, p0, Lcom/jayway/jsonpath/spi/MappingProviderFactory$1;->provider:Lcom/jayway/jsonpath/spi/MappingProvider;

    if-nez v1, :cond_0

    .line 32
    const-class v2, Lcom/jayway/jsonpath/spi/MappingProviderFactory;

    monitor-enter v2

    .line 34
    :try_start_0
    const-string v1, "org.codehaus.jackson.map.ObjectMapper"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 36
    new-instance v1, Lcom/jayway/jsonpath/spi/impl/JacksonProvider;

    invoke-direct {v1}, Lcom/jayway/jsonpath/spi/impl/JacksonProvider;-><init>()V

    iput-object v1, p0, Lcom/jayway/jsonpath/spi/MappingProviderFactory$1;->provider:Lcom/jayway/jsonpath/spi/MappingProvider;

    .line 37
    iget-object v1, p0, Lcom/jayway/jsonpath/spi/MappingProviderFactory$1;->provider:Lcom/jayway/jsonpath/spi/MappingProvider;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    monitor-exit v2

    .line 43
    :goto_0
    return-object v1

    .line 38
    :catch_0
    move-exception v0

    .line 39
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v3, "org.codehaus.jackson.map.ObjectMapper not found on classpath. This is an optional dependency needed for POJO conversions."

    invoke-direct {v1, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 41
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 43
    :cond_0
    iget-object v1, p0, Lcom/jayway/jsonpath/spi/MappingProviderFactory$1;->provider:Lcom/jayway/jsonpath/spi/MappingProvider;

    goto :goto_0
.end method
