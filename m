Return-Path: <SRS0=iVBa=SO=gmail.com=masuksodsai@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17E5D60D1A
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Nov 2024 04:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E124C4CED1; Tue, 19 Nov 2024 04:43:30 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8FABC4CECF
	for <linux-firmware@kernel.org>; Tue, 19 Nov 2024 04:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8FABC4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so377016a12.0
        for <linux-firmware@kernel.org>; Mon, 18 Nov 2024 20:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731991408; x=1732596208; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iMRVzBpXOV/Pos9YyrBKg7qurYP/eG3+lKzWBopyjZY=;
        b=J0VM7M1WPabtNvHBSRkJcp6vWdauxXGnDCjbZCwy70A6LUEt1N65ZF+45lOFnfrw5m
         OTdBjW0KK9lWtn7ppkWfLGDSmd/WzII3Y7TQ9oImI0G1WaCfn0XDODqxdeYDNRWwOj8W
         6PIOELHB6+/gx9Pr+UAQ4LD99HBiEQsc1D2wJzdRxLruVXY9jXYIlhUMaBOr202j6+Eb
         WvgMeZ4h8JLxcCLiCRuygXofTbrr1pT68WbMoToTqPq9sS2qKItNxW8uoQPG35Ea6XGb
         U/ClOHEASDwZ16tlEMSvD+furq9GbUyyoSTK5xlNoWreaHemhDEFRWHuKnyvcRl3xvnQ
         35Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731991408; x=1732596208;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iMRVzBpXOV/Pos9YyrBKg7qurYP/eG3+lKzWBopyjZY=;
        b=Co0VjYsROmzndiuLc+UipHhTSvaGexG8ttXytEygsA+JyIyk27wHvgVPMFoHxrfarp
         YAduU+ZGzELEQQBo7QYoXg76iRYmRq6k/+5Ra/d/qeDlqJs2erg+J40YO0QabOzOwh8t
         TpnQHz3DdfZp2v24zVzm5zDF6sxkcPK344lWEuFfmldIXP3VnLN9YQDoy4dKVk7bhvwB
         suDeUF2+4pz0sAO/R6ZCGGe2OiqxBFqnwNVbJG9qkbaLVmIqQf4S91jEKwF2dMCkVM7m
         Y7hVk7dxfFiiRHLQSa2HlDlhr+8R5W0mWGTbOFx85TFXzn3zys5rKhl4Y1jZqjy59WDH
         YOFA==
X-Gm-Message-State: AOJu0YymRW5hAdJsT5KP0T/Nag7nBuoCKpwawJFhzp+teGMnP7Az1lWZ
	G7s9mGClKmkcu9N4nA6N+HvCj9+Ovzt5IonQP8erlo/2PbbJd/baKn/7hAHga+hFppkozYY8K7m
	U0r3jUwAcUxOpkXFHWLTb6D1dBpIpDO4=
X-Google-Smtp-Source: AGHT+IG01pitzSlwQAuTZheQQMCzMPDepoDwEpRsFWuVXWxgpXiOckSklIQh5SgM+/mwfEY7o2QKz7Xy0mtLAst4AAM=
X-Received: by 2002:a05:6a21:3941:b0:1dc:2365:a114 with SMTP id
 adf61e73a8af0-1dc90b3b2a9mr20552382637.24.1731991408643; Mon, 18 Nov 2024
 20:43:28 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?4Lih4Liy4Liq4Li44LiCIOC4quC4lOC5g+C4qg==?= <masuksodsai@gmail.com>
Date: Tue, 19 Nov 2024 11:43:18 +0700
Message-ID: <CADOVP5rJGRgDkS9aXkFS-MtAh-ahOk9U0cir5MYasH1AVWaoLA@mail.gmail.com>
Subject: =?UTF-8?B?4Lia4Lij4Li04LiB4Liy4Lij4Liq4Li04LiZ4LmA4LiK4Li34LmI4Lit4Liq4Liz4Lir?=
	=?UTF-8?B?4Lij4Lix4Lia4Lic4Li54LmJ4Lib4Lij4Liw4LiB4Lit4Lia4LiB4Liy4Lij4LiX4Li44LiB4Lib4Lij?=
	=?UTF-8?B?4Liw4LmA4Lig4LiXIOC5hOC4oeC5iOC4oeC4teC5guC4reC4meC4geC5iOC4reC4mSDguYTguKHguYg=?=
	=?UTF-8?B?4Lih4Li14Lih4Lix4LiU4LiI4Liz?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000aa97c006273cac0c"

--000000000000aa97c006273cac0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

4Lia4Lij4Li04Lip4Lix4LiXIFRQTCBHcm91cCDguIjguLPguIHguLHguJQg4Liq4Li04LiZ4LmA
4LiK4Li34LmI4Lit4LmA4Lie4Li34LmI4Lit4LiE4LiZ4LmE4LiX4LiiDQrguKrguLPguKvguKPg
uLHguJrguYDguIjguYnguLLguILguK3guIfguJjguLjguKPguIHguLTguIjguJfguLjguIHguYbg
uJvguKPguLDguYDguKDguJcg4LiX4Li14LmI4LiV4LmJ4Lit4LiH4LiB4Liy4Lij4LiX4Li44LiZ
4Lir4Lih4Li44LiZ4LmA4Lin4Li14Lii4LiZDQrguKfguIfguYDguIfguLTguJnguK3guJnguLjg
uKHguLHguJXguLTguKrguLnguIfguKrguLjguJQgNTAsMDAwLTEwLDAwMCwwMDAg4Lia4Liy4LiX
DQoNCuC5g+C4hOC4o+C5hOC4oeC5iOC5gOC4iuC4t+C5iOC4rSDguYHguJXguYjguKrguLTguJng
uYDguIrguLfguYjguK3guYDguKPguLLguYTguJTguYnguIjguKPguLTguIcNCuKclO+4j+C4iOC4
lOC5gOC4m+C5h+C4meC4o+C4ueC4m+C5geC4muC4muC4muC4o+C4tOC4qeC4seC4lyDguYPguJrg
uJfguLDguYDguJrguLXguKLguJnguJ7guLLguJPguLTguIrguKLguYwg4LmD4Lia4Lib4Lij4Liw
4LiB4Lit4Lia4LiB4Liy4LijDQrinJTvuI/guK3guLHguJXguKPguLLguJTguK3guIHguYDguJrg
uLXguYnguKLguYDguKPguLTguYjguKHguJXguYnguJnguJfguLXguYggMS4zICUNCuKclO+4j+C4
peC4lOC4leC5ieC4mS3guKXguJTguJTguK3guIENCuKclO+4j+C5hOC4oeC5iOC5gOC4iuC5h+C4
hOC5gOC4hOC4o+C4lOC4tOC4lSDguJrguLnguYLguKMNCuKclO+4j+C5hOC4oeC5iOC4leC5ieC4
reC4h+C4oeC4teC4muC4uOC4hOC4hOC4peC4hOC5ieC4s+C4m+C4o+C4sOC4geC4seC4mQ0K4pyU
77iP4Lic4LmI4Liy4LiZ4LiB4Liy4Lij4Lit4LiZ4Li44Lih4Lix4LiV4Li04Lij4Lix4Lia4LmA
4LiH4Li04LiZ4LiX4Lix4LiZ4LiX4Li1DQrinJTvuI/guYTguKHguYjguKHguLXguYLguK3guJng
uIHguYjguK3guJkg4LmE4Lih4LmI4Lih4Li14Lih4Lix4LiU4LiI4LizDQrguJXguLTguJTguJXg
uYjguK0NCuC5gOC4muC4reC4o+C5jOC5guC4l+C4oyA6IDA4NDIzNDExMzIo4LiE4Li44LiT4Lia
4Li1KQ0KDQpMaW5lIGlkIDogdHBsMTk5OQ0K
--000000000000aa97c006273cac0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj7guJrguKPguLTguKnguLHguJcgVFBMIEdyb3VwIOC4iOC4s+C4
geC4seC4lCDguKrguLTguJnguYDguIrguLfguYjguK3guYDguJ7guLfguYjguK3guITguJnguYTg
uJfguKI8L2Rpdj48ZGl2PuC4quC4s+C4q+C4o+C4seC4muC5gOC4iOC5ieC4suC4guC4reC4h+C4
mOC4uOC4o+C4geC4tOC4iOC4l+C4uOC4geC5huC4m+C4o+C4sOC5gOC4oOC4lyDguJfguLXguYjg
uJXguYnguK3guIfguIHguLLguKPguJfguLjguJnguKvguKHguLjguJnguYDguKfguLXguKLguJk8
L2Rpdj48ZGl2PuC4p+C4h+C5gOC4h+C4tOC4meC4reC4meC4uOC4oeC4seC4leC4tOC4quC4ueC4
h+C4quC4uOC4lCA1MCwwMDAtMTAsMDAwLDAwMCDguJrguLLguJc8L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PuC5g+C4hOC4o+C5hOC4oeC5iOC5gOC4iuC4t+C5iOC4rSDguYHguJXguYjguKrguLTg
uJnguYDguIrguLfguYjguK3guYDguKPguLLguYTguJTguYnguIjguKPguLTguIc8L2Rpdj48ZGl2
PuKclO+4j+C4iOC4lOC5gOC4m+C5h+C4meC4o+C4ueC4m+C5geC4muC4muC4muC4o+C4tOC4qeC4
seC4lyDguYPguJrguJfguLDguYDguJrguLXguKLguJnguJ7guLLguJPguLTguIrguKLguYwg4LmD
4Lia4Lib4Lij4Liw4LiB4Lit4Lia4LiB4Liy4LijPC9kaXY+PGRpdj7inJTvuI/guK3guLHguJXg
uKPguLLguJTguK3guIHguYDguJrguLXguYnguKLguYDguKPguLTguYjguKHguJXguYnguJnguJfg
uLXguYggMS4zICU8L2Rpdj48ZGl2PuKclO+4j+C4peC4lOC4leC5ieC4mS3guKXguJTguJTguK3g
uIE8L2Rpdj48ZGl2PuKclO+4j+C5hOC4oeC5iOC5gOC4iuC5h+C4hOC5gOC4hOC4o+C4lOC4tOC4
lSDguJrguLnguYLguKM8L2Rpdj48ZGl2PuKclO+4j+C5hOC4oeC5iOC4leC5ieC4reC4h+C4oeC4
teC4muC4uOC4hOC4hOC4peC4hOC5ieC4s+C4m+C4o+C4sOC4geC4seC4mTwvZGl2PjxkaXY+4pyU
77iP4Lic4LmI4Liy4LiZ4LiB4Liy4Lij4Lit4LiZ4Li44Lih4Lix4LiV4Li04Lij4Lix4Lia4LmA
4LiH4Li04LiZ4LiX4Lix4LiZ4LiX4Li1PC9kaXY+PGRpdj7inJTvuI/guYTguKHguYjguKHguLXg
uYLguK3guJnguIHguYjguK3guJkg4LmE4Lih4LmI4Lih4Li14Lih4Lix4LiU4LiI4LizPC9kaXY+
PGRpdj7guJXguLTguJTguJXguYjguK08L2Rpdj48ZGl2PuC5gOC4muC4reC4o+C5jOC5guC4l+C4
oyA6IDA4NDIzNDExMzIo4LiE4Li44LiT4Lia4Li1KTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
TGluZSBpZCA6IHRwbDE5OTk8L2Rpdj48L2Rpdj4NCg==
--000000000000aa97c006273cac0c--
