.class public final enum Lcom/amazon/insights/core/http/HttpClient$HttpMethod;
.super Ljava/lang/Enum;
.source "HttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/insights/core/http/HttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HttpMethod"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/insights/core/http/HttpClient$HttpMethod;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

.field public static final enum GET:Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

.field public static final enum POST:Lcom/amazon/insights/core/http/HttpClient$HttpMethod;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 15
    new-instance v0, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    const-string v1, "GET"

    invoke-direct {v0, v1, v2}, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;->GET:Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    .line 16
    new-instance v0, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    const-string v1, "POST"

    invoke-direct {v0, v1, v3}, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;->POST:Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    .line 14
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    sget-object v1, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;->GET:Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;->POST:Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    aput-object v1, v0, v3

    sput-object v0, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;->$VALUES:[Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$HttpMethod;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 14
    const-class v0, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    return-object v0
.end method

.method public static values()[Lcom/amazon/insights/core/http/HttpClient$HttpMethod;
    .locals 1

    .prologue
    .line 14
    sget-object v0, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;->$VALUES:[Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    invoke-virtual {v0}, [Lcom/amazon/insights/core/http/HttpClient$HttpMethod;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    return-object v0
.end method
