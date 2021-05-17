.class Lcom/jayway/jsonpath/JsonModel$JsonSubModel;
.super Lcom/jayway/jsonpath/JsonModel;
.source "JsonModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/JsonModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JsonSubModel"
.end annotation


# instance fields
.field private final parent:Lcom/jayway/jsonpath/JsonModel;

.field private final subModelPath:Lcom/jayway/jsonpath/JsonPath;


# direct methods
.method private constructor <init>(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;)V
    .locals 1
    .param p1, "jsonObject"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;
    .param p3, "parent"    # Lcom/jayway/jsonpath/JsonModel;
    .param p4, "subModelPath"    # Lcom/jayway/jsonpath/JsonPath;

    .prologue
    .line 1053
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/jayway/jsonpath/JsonModel;-><init>(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;Lcom/jayway/jsonpath/JsonModel$1;)V

    .line 1054
    iput-object p3, p0, Lcom/jayway/jsonpath/JsonModel$JsonSubModel;->parent:Lcom/jayway/jsonpath/JsonModel;

    .line 1055
    iput-object p4, p0, Lcom/jayway/jsonpath/JsonModel$JsonSubModel;->subModelPath:Lcom/jayway/jsonpath/JsonPath;

    .line 1056
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Lcom/jayway/jsonpath/JsonModel$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lcom/jayway/jsonpath/spi/JsonProvider;
    .param p3, "x2"    # Lcom/jayway/jsonpath/JsonModel;
    .param p4, "x3"    # Lcom/jayway/jsonpath/JsonPath;
    .param p5, "x4"    # Lcom/jayway/jsonpath/JsonModel$1;

    .prologue
    .line 1047
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/jayway/jsonpath/JsonModel$JsonSubModel;-><init>(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;)V

    return-void
.end method

.method static synthetic access$400(Lcom/jayway/jsonpath/JsonModel$JsonSubModel;)Lcom/jayway/jsonpath/JsonPath;
    .locals 1
    .param p0, "x0"    # Lcom/jayway/jsonpath/JsonModel$JsonSubModel;

    .prologue
    .line 1047
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$JsonSubModel;->subModelPath:Lcom/jayway/jsonpath/JsonPath;

    return-object v0
.end method

.method static synthetic access$500(Lcom/jayway/jsonpath/JsonModel$JsonSubModel;)Lcom/jayway/jsonpath/JsonModel;
    .locals 1
    .param p0, "x0"    # Lcom/jayway/jsonpath/JsonModel$JsonSubModel;

    .prologue
    .line 1047
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$JsonSubModel;->parent:Lcom/jayway/jsonpath/JsonModel;

    return-object v0
.end method
