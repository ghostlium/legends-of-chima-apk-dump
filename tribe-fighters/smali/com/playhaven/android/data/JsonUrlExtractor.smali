.class public Lcom/playhaven/android/data/JsonUrlExtractor;
.super Ljava/lang/Object;
.source "JsonUrlExtractor.java"


# static fields
.field private static final URL_PT1:Ljava/lang/String; = "([\"])(([^\"]+)([\\.])("

.field private static final URL_PT2:Ljava/lang/String; = "))([\"])"

.field private static final ctPattern:Ljava/util/regex/Pattern;

.field private static final flags:I = 0x28

.field private static final imgPattern:Ljava/util/regex/Pattern;

.field private static final urlPatternGroup:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x28

    .line 35
    const-string v0, "([\"])(([^\"]+)([\\.])(gz))([\"])"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/playhaven/android/data/JsonUrlExtractor;->ctPattern:Ljava/util/regex/Pattern;

    .line 38
    const-string v0, "([\"])(([^\"]+)([\\.])(jpg|gif|png))([\"])"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/playhaven/android/data/JsonUrlExtractor;->imgPattern:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getContentTemplates(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p0, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    sget-object v0, Lcom/playhaven/android/data/JsonUrlExtractor;->ctPattern:Ljava/util/regex/Pattern;

    invoke-static {v0, p0}, Lcom/playhaven/android/data/JsonUrlExtractor;->getForPattern(Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private static getForPattern(Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .param p0, "pattern"    # Ljava/util/regex/Pattern;
    .param p1, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/regex/Pattern;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .local v1, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 52
    .local v0, "matcher":Ljava/util/regex/Matcher;
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-nez v2, :cond_0

    .line 55
    return-object v1

    .line 53
    :cond_0
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public static getImages(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p0, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    sget-object v0, Lcom/playhaven/android/data/JsonUrlExtractor;->imgPattern:Ljava/util/regex/Pattern;

    invoke-static {v0, p0}, Lcom/playhaven/android/data/JsonUrlExtractor;->getForPattern(Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
