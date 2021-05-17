.class Lnet/minidev/json/JStylerObj$EscapeLT;
.super Ljava/lang/Object;
.source "JStylerObj.java"

# interfaces
.implements Lnet/minidev/json/JStylerObj$StringProtector;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/minidev/json/JStylerObj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EscapeLT"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnet/minidev/json/JStylerObj$1;)V
    .locals 0
    .param p1, "x0"    # Lnet/minidev/json/JStylerObj$1;

    .prologue
    .line 205
    invoke-direct {p0}, Lnet/minidev/json/JStylerObj$EscapeLT;-><init>()V

    return-void
.end method


# virtual methods
.method public escape(Ljava/lang/String;Ljava/lang/Appendable;)V
    .locals 6
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "out"    # Ljava/lang/Appendable;

    .prologue
    .line 215
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 216
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 217
    .local v0, "ch":C
    sparse-switch v0, :sswitch_data_0

    .line 242
    if-ltz v0, :cond_0

    const/16 v4, 0x1f

    if-le v0, v4, :cond_2

    :cond_0
    const/16 v4, 0x7f

    if-lt v0, v4, :cond_1

    const/16 v4, 0x9f

    if-le v0, v4, :cond_2

    :cond_1
    const/16 v4, 0x2000

    if-lt v0, v4, :cond_3

    const/16 v4, 0x20ff

    if-gt v0, v4, :cond_3

    .line 244
    :cond_2
    const-string v4, "\\u"

    invoke-interface {p2, v4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 245
    const-string v2, "0123456789ABCDEF"

    .line 246
    .local v2, "hex":Ljava/lang/String;
    shr-int/lit8 v4, v0, 0xc

    and-int/lit8 v4, v4, 0xf

    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-interface {p2, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 247
    shr-int/lit8 v4, v0, 0x8

    and-int/lit8 v4, v4, 0xf

    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-interface {p2, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 248
    shr-int/lit8 v4, v0, 0x4

    and-int/lit8 v4, v4, 0xf

    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-interface {p2, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 249
    shr-int/lit8 v4, v0, 0x0

    and-int/lit8 v4, v4, 0xf

    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-interface {p2, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 215
    .end local v2    # "hex":Ljava/lang/String;
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 219
    :sswitch_0
    const-string v4, "\\\""

    invoke-interface {p2, v4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 255
    .end local v0    # "ch":C
    :catch_0
    move-exception v1

    .line 256
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "Impossible Exeption"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 222
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "ch":C
    :sswitch_1
    :try_start_1
    const-string v4, "\\\\"

    invoke-interface {p2, v4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_1

    .line 225
    :sswitch_2
    const-string v4, "\\b"

    invoke-interface {p2, v4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_1

    .line 228
    :sswitch_3
    const-string v4, "\\f"

    invoke-interface {p2, v4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_1

    .line 231
    :sswitch_4
    const-string v4, "\\n"

    invoke-interface {p2, v4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_1

    .line 234
    :sswitch_5
    const-string v4, "\\r"

    invoke-interface {p2, v4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_1

    .line 237
    :sswitch_6
    const-string v4, "\\t"

    invoke-interface {p2, v4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_1

    .line 251
    :cond_3
    invoke-interface {p2, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 258
    .end local v0    # "ch":C
    :cond_4
    return-void

    .line 217
    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_2
        0x9 -> :sswitch_6
        0xa -> :sswitch_4
        0xc -> :sswitch_3
        0xd -> :sswitch_5
        0x22 -> :sswitch_0
        0x5c -> :sswitch_1
    .end sparse-switch
.end method
