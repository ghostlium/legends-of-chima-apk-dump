.class public Lnet/minidev/json/JSONValue;
.super Ljava/lang/Object;
.source "JSONValue.java"


# static fields
.field public static COMPRESSION:Lnet/minidev/json/JSONStyle;

.field private static final FACTORY_FAKE_COINTAINER:Lnet/minidev/json/parser/FakeContainerFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lnet/minidev/json/JSONStyle;->NO_COMPRESS:Lnet/minidev/json/JSONStyle;

    sput-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    .line 58
    new-instance v0, Lnet/minidev/json/parser/FakeContainerFactory;

    invoke-direct {v0}, Lnet/minidev/json/parser/FakeContainerFactory;-><init>()V

    sput-object v0, Lnet/minidev/json/JSONValue;->FACTORY_FAKE_COINTAINER:Lnet/minidev/json/parser/FakeContainerFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static SAXParse(Ljava/io/InputStream;Lnet/minidev/json/parser/ContentHandler;)V
    .locals 2
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "handler"    # Lnet/minidev/json/parser/ContentHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    new-instance v0, Lnet/minidev/json/parser/JSONParser;

    sget v1, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    .line 203
    .local v0, "p":Lnet/minidev/json/parser/JSONParser;
    sget-object v1, Lnet/minidev/json/JSONValue;->FACTORY_FAKE_COINTAINER:Lnet/minidev/json/parser/FakeContainerFactory;

    invoke-virtual {v0, p0, v1, p1}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/InputStream;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;

    .line 204
    return-void
.end method

.method public static SAXParse(Ljava/io/Reader;Lnet/minidev/json/parser/ContentHandler;)V
    .locals 2
    .param p0, "input"    # Ljava/io/Reader;
    .param p1, "handler"    # Lnet/minidev/json/parser/ContentHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 212
    new-instance v0, Lnet/minidev/json/parser/JSONParser;

    sget v1, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    .line 213
    .local v0, "p":Lnet/minidev/json/parser/JSONParser;
    sget-object v1, Lnet/minidev/json/JSONValue;->FACTORY_FAKE_COINTAINER:Lnet/minidev/json/parser/FakeContainerFactory;

    invoke-virtual {v0, p0, v1, p1}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;

    .line 214
    return-void
.end method

.method public static SAXParse(Ljava/lang/String;Lnet/minidev/json/parser/ContentHandler;)V
    .locals 2
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "handler"    # Lnet/minidev/json/parser/ContentHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 222
    new-instance v0, Lnet/minidev/json/parser/JSONParser;

    sget v1, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    .line 223
    .local v0, "p":Lnet/minidev/json/parser/JSONParser;
    sget-object v1, Lnet/minidev/json/JSONValue;->FACTORY_FAKE_COINTAINER:Lnet/minidev/json/parser/FakeContainerFactory;

    invoke-virtual {v0, p0, v1, p1}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;

    .line 224
    return-void
.end method

.method public static compress(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 249
    sget-object v0, Lnet/minidev/json/JSONStyle;->MAX_COMPRESS:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, v0}, Lnet/minidev/json/JSONValue;->compress(Ljava/lang/String;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static compress(Ljava/lang/String;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;
    .locals 5
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "style"    # Lnet/minidev/json/JSONStyle;

    .prologue
    .line 233
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 234
    .local v3, "sb":Ljava/lang/StringBuilder;
    new-instance v0, Lnet/minidev/json/parser/ContentHandlerCompressor;

    invoke-direct {v0, v3, p1}, Lnet/minidev/json/parser/ContentHandlerCompressor;-><init>(Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 235
    .local v0, "comp":Lnet/minidev/json/parser/ContentHandlerCompressor;
    new-instance v2, Lnet/minidev/json/parser/JSONParser;

    sget v4, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v2, v4}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    .line 236
    .local v2, "p":Lnet/minidev/json/parser/JSONParser;
    sget-object v4, Lnet/minidev/json/JSONValue;->FACTORY_FAKE_COINTAINER:Lnet/minidev/json/parser/FakeContainerFactory;

    invoke-virtual {v2, p0, v4, v0}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;

    .line 237
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    .line 239
    .end local v0    # "comp":Lnet/minidev/json/parser/ContentHandlerCompressor;
    .end local v2    # "p":Lnet/minidev/json/parser/JSONParser;
    .end local v3    # "sb":Ljava/lang/StringBuilder;
    .end local p0    # "input":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 238
    .restart local p0    # "input":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 239
    .local v1, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method public static escape(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 671
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, v0}, Lnet/minidev/json/JSONValue;->escape(Ljava/lang/String;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escape(Ljava/lang/String;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "compression"    # Lnet/minidev/json/JSONStyle;

    .prologue
    .line 679
    if-nez p0, :cond_0

    .line 680
    const/4 v1, 0x0

    .line 683
    :goto_0
    return-object v1

    .line 681
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 682
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p1, p0, v0}, Lnet/minidev/json/JSONStyle;->escape(Ljava/lang/String;Ljava/lang/Appendable;)V

    .line 683
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static escape(Ljava/lang/String;Ljava/lang/Appendable;)V
    .locals 1
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "ap"    # Ljava/lang/Appendable;

    .prologue
    .line 687
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, p1, v0}, Lnet/minidev/json/JSONValue;->escape(Ljava/lang/String;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 688
    return-void
.end method

.method public static escape(Ljava/lang/String;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V
    .locals 0
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "ap"    # Ljava/lang/Appendable;
    .param p2, "compression"    # Lnet/minidev/json/JSONStyle;

    .prologue
    .line 691
    if-nez p0, :cond_0

    .line 694
    :goto_0
    return-void

    .line 693
    :cond_0
    invoke-virtual {p2, p0, p1}, Lnet/minidev/json/JSONStyle;->escape(Ljava/lang/String;Ljava/lang/Appendable;)V

    goto :goto_0
.end method

.method public static isValidJson(Ljava/io/Reader;)Z
    .locals 3
    .param p0, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 398
    :try_start_0
    new-instance v1, Lnet/minidev/json/parser/JSONParser;

    sget v2, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v1, v2}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v2, Lnet/minidev/json/JSONValue;->FACTORY_FAKE_COINTAINER:Lnet/minidev/json/parser/FakeContainerFactory;

    invoke-virtual {v1, p0, v2}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    :try_end_0
    .catch Lnet/minidev/json/parser/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 399
    const/4 v1, 0x1

    .line 401
    :goto_0
    return v1

    .line 400
    :catch_0
    move-exception v0

    .line 401
    .local v0, "e":Lnet/minidev/json/parser/ParseException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isValidJson(Ljava/lang/String;)Z
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 412
    :try_start_0
    new-instance v1, Lnet/minidev/json/parser/JSONParser;

    sget v2, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v1, v2}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v2, Lnet/minidev/json/JSONValue;->FACTORY_FAKE_COINTAINER:Lnet/minidev/json/parser/FakeContainerFactory;

    invoke-virtual {v1, p0, v2}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    :try_end_0
    .catch Lnet/minidev/json/parser/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 413
    const/4 v1, 0x1

    .line 415
    :goto_0
    return v1

    .line 414
    :catch_0
    move-exception v0

    .line 415
    .local v0, "e":Lnet/minidev/json/parser/ParseException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isValidJsonStrict(Ljava/io/Reader;)Z
    .locals 3
    .param p0, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 370
    :try_start_0
    new-instance v1, Lnet/minidev/json/parser/JSONParser;

    const/16 v2, 0x190

    invoke-direct {v1, v2}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v2, Lnet/minidev/json/JSONValue;->FACTORY_FAKE_COINTAINER:Lnet/minidev/json/parser/FakeContainerFactory;

    invoke-virtual {v1, p0, v2}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    :try_end_0
    .catch Lnet/minidev/json/parser/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 371
    const/4 v1, 0x1

    .line 373
    :goto_0
    return v1

    .line 372
    :catch_0
    move-exception v0

    .line 373
    .local v0, "e":Lnet/minidev/json/parser/ParseException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isValidJsonStrict(Ljava/lang/String;)Z
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 384
    :try_start_0
    new-instance v1, Lnet/minidev/json/parser/JSONParser;

    const/16 v2, 0x190

    invoke-direct {v1, v2}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v2, Lnet/minidev/json/JSONValue;->FACTORY_FAKE_COINTAINER:Lnet/minidev/json/parser/FakeContainerFactory;

    invoke-virtual {v1, p0, v2}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    :try_end_0
    .catch Lnet/minidev/json/parser/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 385
    const/4 v1, 0x1

    .line 387
    :goto_0
    return v1

    .line 386
    :catch_0
    move-exception v0

    .line 387
    .local v0, "e":Lnet/minidev/json/parser/ParseException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static parse(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 3
    .param p0, "in"    # Ljava/io/InputStream;

    .prologue
    .line 98
    :try_start_0
    new-instance v1, Lnet/minidev/json/parser/JSONParser;

    sget v2, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v1, v2}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    invoke-virtual {v1, p0}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/InputStream;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 100
    :goto_0
    return-object v1

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static parse(Ljava/io/Reader;)Ljava/lang/Object;
    .locals 3
    .param p0, "in"    # Ljava/io/Reader;

    .prologue
    .line 118
    :try_start_0
    new-instance v1, Lnet/minidev/json/parser/JSONParser;

    sget v2, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v1, v2}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    invoke-virtual {v1, p0}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/Reader;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 120
    :goto_0
    return-object v1

    .line 119
    :catch_0
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static parse(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 138
    :try_start_0
    new-instance v1, Lnet/minidev/json/parser/JSONParser;

    sget v2, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v1, v2}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    invoke-virtual {v1, p0}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 140
    :goto_0
    return-object v1

    .line 139
    :catch_0
    move-exception v0

    .line 140
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static parse([B)Ljava/lang/Object;
    .locals 3
    .param p0, "in"    # [B

    .prologue
    .line 76
    :try_start_0
    new-instance v1, Lnet/minidev/json/parser/JSONParser;

    sget v2, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v1, v2}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    invoke-virtual {v1, p0}, Lnet/minidev/json/parser/JSONParser;->parse([B)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 78
    :goto_0
    return-object v1

    .line 77
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static parseKeepingOrder(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 3
    .param p0, "in"    # Ljava/io/InputStream;

    .prologue
    .line 164
    :try_start_0
    new-instance v1, Lnet/minidev/json/parser/JSONParser;

    sget v2, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v1, v2}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v2, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_ORDERED:Lnet/minidev/json/parser/ContainerFactory;

    invoke-virtual {v1, p0, v2}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/InputStream;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 166
    :goto_0
    return-object v1

    .line 165
    :catch_0
    move-exception v0

    .line 166
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static parseKeepingOrder(Ljava/io/Reader;)Ljava/lang/Object;
    .locals 3
    .param p0, "in"    # Ljava/io/Reader;

    .prologue
    .line 177
    :try_start_0
    new-instance v1, Lnet/minidev/json/parser/JSONParser;

    sget v2, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v1, v2}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v2, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_ORDERED:Lnet/minidev/json/parser/ContainerFactory;

    invoke-virtual {v1, p0, v2}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 179
    :goto_0
    return-object v1

    .line 178
    :catch_0
    move-exception v0

    .line 179
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static parseKeepingOrder(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    .line 190
    :try_start_0
    new-instance v1, Lnet/minidev/json/parser/JSONParser;

    sget v2, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v1, v2}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v2, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_ORDERED:Lnet/minidev/json/parser/ContainerFactory;

    invoke-virtual {v1, p0, v2}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 192
    :goto_0
    return-object v1

    .line 191
    :catch_0
    move-exception v0

    .line 192
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static parseKeepingOrder([B)Ljava/lang/Object;
    .locals 3
    .param p0, "in"    # [B

    .prologue
    .line 151
    :try_start_0
    new-instance v1, Lnet/minidev/json/parser/JSONParser;

    sget v2, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v1, v2}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v2, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_ORDERED:Lnet/minidev/json/parser/ContainerFactory;

    invoke-virtual {v1, p0, v2}, Lnet/minidev/json/parser/JSONParser;->parse([BLnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 153
    :goto_0
    return-object v1

    .line 152
    :catch_0
    move-exception v0

    .line 153
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static parseStrict(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 2
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 324
    new-instance v0, Lnet/minidev/json/parser/JSONParser;

    const/16 v1, 0x190

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v1, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    invoke-virtual {v0, p0, v1}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/InputStream;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static parseStrict(Ljava/io/Reader;)Ljava/lang/Object;
    .locals 2
    .param p0, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 336
    new-instance v0, Lnet/minidev/json/parser/JSONParser;

    const/16 v1, 0x190

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v1, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    invoke-virtual {v0, p0, v1}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static parseStrict(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 348
    new-instance v0, Lnet/minidev/json/parser/JSONParser;

    const/16 v1, 0x190

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v1, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    invoke-virtual {v0, p0, v1}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static parseStrict([B)Ljava/lang/Object;
    .locals 2
    .param p0, "s"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 360
    new-instance v0, Lnet/minidev/json/parser/JSONParser;

    const/16 v1, 0x190

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v1, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    invoke-virtual {v0, p0, v1}, Lnet/minidev/json/parser/JSONParser;->parse([BLnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static parseWithException(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 2
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 286
    new-instance v0, Lnet/minidev/json/parser/JSONParser;

    sget v1, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v1, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    invoke-virtual {v0, p0, v1}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/InputStream;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static parseWithException(Ljava/io/Reader;)Ljava/lang/Object;
    .locals 2
    .param p0, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 298
    new-instance v0, Lnet/minidev/json/parser/JSONParser;

    sget v1, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v1, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    invoke-virtual {v0, p0, v1}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static parseWithException(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 310
    new-instance v0, Lnet/minidev/json/parser/JSONParser;

    sget v1, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v1, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    invoke-virtual {v0, p0, v1}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static parseWithException([B)Ljava/lang/Object;
    .locals 2
    .param p0, "in"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 272
    new-instance v0, Lnet/minidev/json/parser/JSONParser;

    sget v1, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    sget-object v1, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    invoke-virtual {v0, p0, v1}, Lnet/minidev/json/parser/JSONParser;->parse([BLnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static toJSONString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 641
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, v0}, Lnet/minidev/json/JSONValue;->toJSONString(Ljava/lang/Object;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toJSONString(Ljava/lang/Object;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "compression"    # Lnet/minidev/json/JSONStyle;

    .prologue
    .line 661
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 663
    .local v0, "sb":Ljava/lang/StringBuilder;
    :try_start_0
    invoke-static {p0, v0, p1}, Lnet/minidev/json/JSONValue;->writeJSONString(Ljava/lang/Object;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 667
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 664
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static uncompress(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 258
    sget-object v0, Lnet/minidev/json/JSONStyle;->NO_COMPRESS:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, v0}, Lnet/minidev/json/JSONValue;->compress(Ljava/lang/String;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static writeJSONString(Ljava/lang/Object;Ljava/lang/Appendable;)V
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "out"    # Ljava/lang/Appendable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 430
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, p1, v0}, Lnet/minidev/json/JSONValue;->writeJSONString(Ljava/lang/Object;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 431
    return-void
.end method

.method public static writeJSONString(Ljava/lang/Object;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V
    .locals 24
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "out"    # Ljava/lang/Appendable;
    .param p2, "compression"    # Lnet/minidev/json/JSONStyle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 445
    if-nez p0, :cond_0

    .line 446
    const-string v23, "null"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 628
    .end local p0    # "value":Ljava/lang/Object;
    :goto_0
    return-void

    .line 450
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_0
    move-object/from16 v0, p0

    instance-of v0, v0, Ljava/lang/String;

    move/from16 v23, v0

    if-eqz v23, :cond_2

    move-object/from16 v23, p0

    .line 451
    check-cast v23, Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lnet/minidev/json/JSONStyle;->mustProtectValue(Ljava/lang/String;)Z

    move-result v23

    if-nez v23, :cond_1

    .line 452
    check-cast p0, Ljava/lang/String;

    .end local p0    # "value":Ljava/lang/Object;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_0

    .line 454
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_1
    const/16 v23, 0x22

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 455
    check-cast p0, Ljava/lang/String;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-static/range {p0 .. p2}, Lnet/minidev/json/JSONValue;->escape(Ljava/lang/String;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 456
    const/16 v23, 0x22

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_0

    .line 461
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_2
    move-object/from16 v0, p0

    instance-of v0, v0, Ljava/lang/Number;

    move/from16 v23, v0

    if-eqz v23, :cond_7

    .line 462
    move-object/from16 v0, p0

    instance-of v0, v0, Ljava/lang/Double;

    move/from16 v23, v0

    if-eqz v23, :cond_4

    move-object/from16 v23, p0

    .line 463
    check-cast v23, Ljava/lang/Double;

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Double;->isInfinite()Z

    move-result v23

    if-eqz v23, :cond_3

    .line 464
    const-string v23, "null"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_0

    .line 466
    :cond_3
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_0

    .line 467
    :cond_4
    move-object/from16 v0, p0

    instance-of v0, v0, Ljava/lang/Float;

    move/from16 v23, v0

    if-eqz v23, :cond_6

    move-object/from16 v23, p0

    .line 468
    check-cast v23, Ljava/lang/Float;

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Float;->isInfinite()Z

    move-result v23

    if-eqz v23, :cond_5

    .line 469
    const-string v23, "null"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto/16 :goto_0

    .line 471
    :cond_5
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto/16 :goto_0

    .line 473
    :cond_6
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto/16 :goto_0

    .line 478
    :cond_7
    move-object/from16 v0, p0

    instance-of v0, v0, Ljava/lang/Boolean;

    move/from16 v23, v0

    if-eqz v23, :cond_8

    .line 479
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto/16 :goto_0

    .line 480
    :cond_8
    move-object/from16 v0, p0

    instance-of v0, v0, Lnet/minidev/json/JSONStreamAware;

    move/from16 v23, v0

    if-eqz v23, :cond_a

    .line 481
    move-object/from16 v0, p0

    instance-of v0, v0, Lnet/minidev/json/JSONStreamAwareEx;

    move/from16 v23, v0

    if-eqz v23, :cond_9

    .line 482
    check-cast p0, Lnet/minidev/json/JSONStreamAwareEx;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-interface/range {p0 .. p2}, Lnet/minidev/json/JSONStreamAwareEx;->writeJSONString(Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    goto/16 :goto_0

    .line 484
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_9
    check-cast p0, Lnet/minidev/json/JSONStreamAware;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-interface/range {p0 .. p1}, Lnet/minidev/json/JSONStreamAware;->writeJSONString(Ljava/lang/Appendable;)V

    goto/16 :goto_0

    .line 485
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_a
    move-object/from16 v0, p0

    instance-of v0, v0, Lnet/minidev/json/JSONAware;

    move/from16 v23, v0

    if-eqz v23, :cond_c

    .line 486
    move-object/from16 v0, p0

    instance-of v0, v0, Lnet/minidev/json/JSONAwareEx;

    move/from16 v23, v0

    if-eqz v23, :cond_b

    .line 487
    check-cast p0, Lnet/minidev/json/JSONAwareEx;

    .end local p0    # "value":Ljava/lang/Object;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-interface {v0, v1}, Lnet/minidev/json/JSONAwareEx;->toJSONString(Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto/16 :goto_0

    .line 489
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_b
    check-cast p0, Lnet/minidev/json/JSONAware;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-interface/range {p0 .. p0}, Lnet/minidev/json/JSONAware;->toJSONString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto/16 :goto_0

    .line 490
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_c
    move-object/from16 v0, p0

    instance-of v0, v0, Ljava/util/Map;

    move/from16 v23, v0

    if-eqz v23, :cond_d

    .line 491
    check-cast p0, Ljava/util/Map;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-static/range {p0 .. p2}, Lnet/minidev/json/JSONObject;->writeJSON(Ljava/util/Map;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    goto/16 :goto_0

    .line 492
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_d
    move-object/from16 v0, p0

    instance-of v0, v0, Ljava/lang/Iterable;

    move/from16 v23, v0

    if-eqz v23, :cond_e

    .line 493
    check-cast p0, Ljava/lang/Iterable;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-static/range {p0 .. p2}, Lnet/minidev/json/JSONArray;->writeJSONString(Ljava/lang/Iterable;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    goto/16 :goto_0

    .line 494
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_e
    move-object/from16 v0, p0

    instance-of v0, v0, Ljava/util/Date;

    move/from16 v23, v0

    if-eqz v23, :cond_f

    .line 495
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-static {v0, v1, v2}, Lnet/minidev/json/JSONValue;->writeJSONString(Ljava/lang/Object;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    goto/16 :goto_0

    .line 496
    :cond_f
    move-object/from16 v0, p0

    instance-of v0, v0, Ljava/lang/Enum;

    move/from16 v23, v0

    if-eqz v23, :cond_11

    .line 498
    check-cast p0, Ljava/lang/Enum;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v21

    .line 499
    .local v21, "s":Ljava/lang/String;
    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lnet/minidev/json/JSONStyle;->mustProtectValue(Ljava/lang/String;)Z

    move-result v23

    if-nez v23, :cond_10

    .line 500
    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto/16 :goto_0

    .line 502
    :cond_10
    const/16 v23, 0x22

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 503
    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-static {v0, v1, v2}, Lnet/minidev/json/JSONValue;->escape(Ljava/lang/String;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 504
    const/16 v23, 0x22

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto/16 :goto_0

    .line 507
    .end local v21    # "s":Ljava/lang/String;
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_11
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Class;->isArray()Z

    move-result v23

    if-eqz v23, :cond_23

    .line 508
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    .line 509
    .local v5, "arrayClz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v5}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v8

    .line 511
    .local v8, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v23, 0x5b

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 512
    const/16 v19, 0x0

    .line 514
    .local v19, "needSep":Z
    invoke-virtual {v8}, Ljava/lang/Class;->isPrimitive()Z

    move-result v23

    if-eqz v23, :cond_20

    .line 515
    sget-object v23, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v23

    if-ne v8, v0, :cond_13

    .line 516
    check-cast p0, [I

    .end local p0    # "value":Ljava/lang/Object;
    move-object/from16 v4, p0

    check-cast v4, [I

    .local v4, "arr$":[I
    array-length v0, v4

    move/from16 v16, v0

    .local v16, "len$":I
    const/4 v15, 0x0

    .local v15, "i$":I
    :goto_1
    move/from16 v0, v16

    if-ge v15, v0, :cond_22

    aget v6, v4, v15

    .line 517
    .local v6, "b":I
    if-eqz v19, :cond_12

    .line 518
    const/16 v23, 0x2c

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 521
    :goto_2
    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 516
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 520
    :cond_12
    const/16 v19, 0x1

    goto :goto_2

    .line 523
    .end local v4    # "arr$":[I
    .end local v6    # "b":I
    .end local v15    # "i$":I
    .end local v16    # "len$":I
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_13
    sget-object v23, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v23

    if-ne v8, v0, :cond_15

    .line 524
    check-cast p0, [S

    .end local p0    # "value":Ljava/lang/Object;
    move-object/from16 v4, p0

    check-cast v4, [S

    .local v4, "arr$":[S
    array-length v0, v4

    move/from16 v16, v0

    .restart local v16    # "len$":I
    const/4 v15, 0x0

    .restart local v15    # "i$":I
    :goto_3
    move/from16 v0, v16

    if-ge v15, v0, :cond_22

    aget-short v6, v4, v15

    .line 525
    .local v6, "b":S
    if-eqz v19, :cond_14

    .line 526
    const/16 v23, 0x2c

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 529
    :goto_4
    invoke-static {v6}, Ljava/lang/Short;->toString(S)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 524
    add-int/lit8 v15, v15, 0x1

    goto :goto_3

    .line 528
    :cond_14
    const/16 v19, 0x1

    goto :goto_4

    .line 531
    .end local v4    # "arr$":[S
    .end local v6    # "b":S
    .end local v15    # "i$":I
    .end local v16    # "len$":I
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_15
    sget-object v23, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v23

    if-ne v8, v0, :cond_17

    .line 532
    check-cast p0, [B

    .end local p0    # "value":Ljava/lang/Object;
    move-object/from16 v4, p0

    check-cast v4, [B

    .local v4, "arr$":[B
    array-length v0, v4

    move/from16 v16, v0

    .restart local v16    # "len$":I
    const/4 v15, 0x0

    .restart local v15    # "i$":I
    :goto_5
    move/from16 v0, v16

    if-ge v15, v0, :cond_22

    aget-byte v6, v4, v15

    .line 533
    .local v6, "b":B
    if-eqz v19, :cond_16

    .line 534
    const/16 v23, 0x2c

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 537
    :goto_6
    invoke-static {v6}, Ljava/lang/Byte;->toString(B)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 532
    add-int/lit8 v15, v15, 0x1

    goto :goto_5

    .line 536
    :cond_16
    const/16 v19, 0x1

    goto :goto_6

    .line 539
    .end local v4    # "arr$":[B
    .end local v6    # "b":B
    .end local v15    # "i$":I
    .end local v16    # "len$":I
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_17
    sget-object v23, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v23

    if-ne v8, v0, :cond_19

    .line 540
    check-cast p0, [J

    .end local p0    # "value":Ljava/lang/Object;
    move-object/from16 v4, p0

    check-cast v4, [J

    .local v4, "arr$":[J
    array-length v0, v4

    move/from16 v16, v0

    .restart local v16    # "len$":I
    const/4 v15, 0x0

    .restart local v15    # "i$":I
    :goto_7
    move/from16 v0, v16

    if-ge v15, v0, :cond_22

    aget-wide v6, v4, v15

    .line 541
    .local v6, "b":J
    if-eqz v19, :cond_18

    .line 542
    const/16 v23, 0x2c

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 545
    :goto_8
    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 540
    add-int/lit8 v15, v15, 0x1

    goto :goto_7

    .line 544
    :cond_18
    const/16 v19, 0x1

    goto :goto_8

    .line 547
    .end local v4    # "arr$":[J
    .end local v6    # "b":J
    .end local v15    # "i$":I
    .end local v16    # "len$":I
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_19
    sget-object v23, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v23

    if-ne v8, v0, :cond_1b

    .line 548
    check-cast p0, [F

    .end local p0    # "value":Ljava/lang/Object;
    move-object/from16 v4, p0

    check-cast v4, [F

    .local v4, "arr$":[F
    array-length v0, v4

    move/from16 v16, v0

    .restart local v16    # "len$":I
    const/4 v15, 0x0

    .restart local v15    # "i$":I
    :goto_9
    move/from16 v0, v16

    if-ge v15, v0, :cond_22

    aget v6, v4, v15

    .line 549
    .local v6, "b":F
    if-eqz v19, :cond_1a

    .line 550
    const/16 v23, 0x2c

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 553
    :goto_a
    invoke-static {v6}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 548
    add-int/lit8 v15, v15, 0x1

    goto :goto_9

    .line 552
    :cond_1a
    const/16 v19, 0x1

    goto :goto_a

    .line 555
    .end local v4    # "arr$":[F
    .end local v6    # "b":F
    .end local v15    # "i$":I
    .end local v16    # "len$":I
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_1b
    sget-object v23, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v23

    if-ne v8, v0, :cond_1d

    .line 556
    check-cast p0, [D

    .end local p0    # "value":Ljava/lang/Object;
    move-object/from16 v4, p0

    check-cast v4, [D

    .local v4, "arr$":[D
    array-length v0, v4

    move/from16 v16, v0

    .restart local v16    # "len$":I
    const/4 v15, 0x0

    .restart local v15    # "i$":I
    :goto_b
    move/from16 v0, v16

    if-ge v15, v0, :cond_22

    aget-wide v6, v4, v15

    .line 557
    .local v6, "b":D
    if-eqz v19, :cond_1c

    .line 558
    const/16 v23, 0x2c

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 561
    :goto_c
    invoke-static {v6, v7}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 556
    add-int/lit8 v15, v15, 0x1

    goto :goto_b

    .line 560
    :cond_1c
    const/16 v19, 0x1

    goto :goto_c

    .line 563
    .end local v4    # "arr$":[D
    .end local v6    # "b":D
    .end local v15    # "i$":I
    .end local v16    # "len$":I
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_1d
    sget-object v23, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v23

    if-ne v8, v0, :cond_22

    .line 564
    check-cast p0, [Z

    .end local p0    # "value":Ljava/lang/Object;
    move-object/from16 v4, p0

    check-cast v4, [Z

    .local v4, "arr$":[Z
    array-length v0, v4

    move/from16 v16, v0

    .restart local v16    # "len$":I
    const/4 v15, 0x0

    .restart local v15    # "i$":I
    :goto_d
    move/from16 v0, v16

    if-ge v15, v0, :cond_22

    aget-boolean v6, v4, v15

    .line 565
    .local v6, "b":Z
    if-eqz v19, :cond_1e

    .line 566
    const/16 v23, 0x2c

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 569
    :goto_e
    if-eqz v6, :cond_1f

    .line 570
    const-string v23, "true"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 564
    :goto_f
    add-int/lit8 v15, v15, 0x1

    goto :goto_d

    .line 568
    :cond_1e
    const/16 v19, 0x1

    goto :goto_e

    .line 572
    :cond_1f
    const-string v23, "false"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_f

    .line 576
    .end local v4    # "arr$":[Z
    .end local v6    # "b":Z
    .end local v15    # "i$":I
    .end local v16    # "len$":I
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_20
    check-cast p0, [Ljava/lang/Object;

    .end local p0    # "value":Ljava/lang/Object;
    move-object/from16 v4, p0

    check-cast v4, [Ljava/lang/Object;

    .local v4, "arr$":[Ljava/lang/Object;
    array-length v0, v4

    move/from16 v16, v0

    .restart local v16    # "len$":I
    const/4 v15, 0x0

    .restart local v15    # "i$":I
    :goto_10
    move/from16 v0, v16

    if-ge v15, v0, :cond_22

    aget-object v20, v4, v15

    .line 577
    .local v20, "o":Ljava/lang/Object;
    if-eqz v19, :cond_21

    .line 578
    const/16 v23, 0x2c

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 581
    :goto_11
    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-static {v0, v1, v2}, Lnet/minidev/json/JSONValue;->writeJSONString(Ljava/lang/Object;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 576
    add-int/lit8 v15, v15, 0x1

    goto :goto_10

    .line 580
    :cond_21
    const/16 v19, 0x1

    goto :goto_11

    .line 584
    .end local v4    # "arr$":[Ljava/lang/Object;
    .end local v15    # "i$":I
    .end local v16    # "len$":I
    .end local v20    # "o":Ljava/lang/Object;
    :cond_22
    const/16 v23, 0x5d

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto/16 :goto_0

    .line 587
    .end local v5    # "arrayClz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v19    # "needSep":Z
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_23
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    .line 588
    .local v10, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v19, 0x0

    .line 589
    .restart local v19    # "needSep":Z
    invoke-virtual {v10}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v13

    .line 590
    .local v13, "fields":[Ljava/lang/reflect/Field;
    const/16 v23, 0x7b

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 591
    move-object v4, v13

    .local v4, "arr$":[Ljava/lang/reflect/Field;
    array-length v0, v4

    move/from16 v16, v0

    .restart local v16    # "len$":I
    const/4 v15, 0x0

    .restart local v15    # "i$":I
    :goto_12
    move/from16 v0, v16

    if-ge v15, v0, :cond_2a

    aget-object v12, v4, v15

    .line 592
    .local v12, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v12}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v17

    .line 593
    .local v17, "m":I
    move/from16 v0, v17

    and-int/lit16 v0, v0, 0x98

    move/from16 v23, v0

    if-lez v23, :cond_25

    .line 591
    :cond_24
    :goto_13
    add-int/lit8 v15, v15, 0x1

    goto :goto_12

    .line 595
    :cond_25
    const/16 v22, 0x0

    .line 596
    .local v22, "v":Ljava/lang/Object;
    and-int/lit8 v23, v17, 0x1

    if-lez v23, :cond_26

    .line 597
    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    .line 617
    :goto_14
    if-eqz v19, :cond_29

    .line 618
    const/16 v23, 0x2c

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 621
    :goto_15
    invoke-virtual {v12}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-static {v0, v1, v2, v3}, Lnet/minidev/json/JSONObject;->writeJSONKV(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_13

    .line 624
    .end local v4    # "arr$":[Ljava/lang/reflect/Field;
    .end local v10    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v12    # "field":Ljava/lang/reflect/Field;
    .end local v13    # "fields":[Ljava/lang/reflect/Field;
    .end local v15    # "i$":I
    .end local v16    # "len$":I
    .end local v17    # "m":I
    .end local v19    # "needSep":Z
    .end local v22    # "v":Ljava/lang/Object;
    :catch_0
    move-exception v11

    .line 625
    .local v11, "e":Ljava/lang/Exception;
    new-instance v23, Ljava/lang/RuntimeException;

    move-object/from16 v0, v23

    invoke-direct {v0, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v23

    .line 599
    .end local v11    # "e":Ljava/lang/Exception;
    .restart local v4    # "arr$":[Ljava/lang/reflect/Field;
    .restart local v10    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v12    # "field":Ljava/lang/reflect/Field;
    .restart local v13    # "fields":[Ljava/lang/reflect/Field;
    .restart local v15    # "i$":I
    .restart local v16    # "len$":I
    .restart local v17    # "m":I
    .restart local v19    # "needSep":Z
    .restart local v22    # "v":Ljava/lang/Object;
    :cond_26
    :try_start_1
    invoke-virtual {v12}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lnet/minidev/json/JSONUtil;->getGetterName(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v14

    .line 600
    .local v14, "g":Ljava/lang/String;
    const/16 v18, 0x0

    .line 603
    .local v18, "mtd":Ljava/lang/reflect/Method;
    const/16 v23, 0x0

    :try_start_2
    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v10, v14, v0}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v18

    .line 606
    :goto_16
    if-nez v18, :cond_28

    .line 607
    :try_start_3
    invoke-virtual {v12}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    .line 608
    .local v9, "c2":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v23, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v23

    if-eq v9, v0, :cond_27

    const-class v23, Ljava/lang/Boolean;

    move-object/from16 v0, v23

    if-ne v9, v0, :cond_28

    .line 609
    :cond_27
    invoke-virtual {v12}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lnet/minidev/json/JSONUtil;->getIsName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 610
    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v10, v14, v0}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v18

    .line 613
    .end local v9    # "c2":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_28
    if-eqz v18, :cond_24

    .line 615
    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    goto :goto_14

    .line 620
    .end local v14    # "g":Ljava/lang/String;
    .end local v18    # "mtd":Ljava/lang/reflect/Method;
    :cond_29
    const/16 v19, 0x1

    goto :goto_15

    .line 623
    .end local v12    # "field":Ljava/lang/reflect/Field;
    .end local v17    # "m":I
    .end local v22    # "v":Ljava/lang/Object;
    :cond_2a
    const/16 v23, 0x7d

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    .line 604
    .restart local v12    # "field":Ljava/lang/reflect/Field;
    .restart local v14    # "g":Ljava/lang/String;
    .restart local v17    # "m":I
    .restart local v18    # "mtd":Ljava/lang/reflect/Method;
    .restart local v22    # "v":Ljava/lang/Object;
    :catch_1
    move-exception v23

    goto :goto_16
.end method
