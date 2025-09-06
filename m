Return-Path: <SRS0=/+Fw=3R=gmail.com=tirwatysuwichaychay@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB74CA1012
	for <linux-firmware@archiver.kernel.org>; Sat,  6 Sep 2025 13:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A9C1C4CEF4; Sat,  6 Sep 2025 13:14:41 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89E68C4CEE7
	for <linux-firmware@kernel.org>; Sat,  6 Sep 2025 13:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 89E68C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6228de280ccso2054640a12.3
        for <linux-firmware@kernel.org>; Sat, 06 Sep 2025 06:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757164478; x=1757769278; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GQLFA8maliVOHgBVzyDCxp0YreLNF2vMG74zgvU0Qgc=;
        b=TjLRwoX9hSIWqFTnWPii3Ib1QKQl06MNZdxtliD4IhLqJCKSfvtkH7CPcukveTxmJS
         7gcYox0QgdHs0Mp8RJxEEhYVFeyFQYdW7TKNH/eX1tuu/Qw+8kf+RqIfo2le3QGwukE0
         h1v7KGAhwzlrELfjupAhTHlHgZ/yurMjLL2sEZniZ8tNC+i5ratToThDTJEGGg1WZL1X
         c7g7AFCRoJ6Q3tCsZvNRa18kiH1rFpZ5K+cgMMVS4qPtswaXwCxjqDHg4Q70Qsnqc0SN
         V31NHSS8/Jc4nA2GQCbYRas51akmLHbwVz9QIwM2xok3xTG099Fm+nkltT9P1IRHtru7
         HglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757164478; x=1757769278;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQLFA8maliVOHgBVzyDCxp0YreLNF2vMG74zgvU0Qgc=;
        b=lHTZz3KkHkXPJfCa1fObdhV2zrjXqVUDKdh8dt1p54FUsb+Tw6/0tLFKhrZvkmtTio
         UIFNZb1sK8/j3gIaSw4dTJ7qjrxRF0wG0qiZIOagRUzYbJUJ+XhyG5i5kgBFVsSQ5hw1
         Vb6dL22QZ16Vw/4TwLxDwJ5zxCMj5lxr1a+5HO6lvPvaA4SB5CNJIM+Z6L3GpLkHIdJo
         QK8AhWwnrQeYCyviHHPOYikNW5tkJuyPH/Daj94yC664MdPZkziK4HlVA3DZ4fIK2xHa
         5nN15UkgsiZhY50PZskuvJNDWzLwjEP6TB58foMWpVEBz3DGgKjmqF2goGqB29ycn4Gs
         TEfA==
X-Gm-Message-State: AOJu0Yy8aMiDzeHRCFjUzHqRsaE1dZ4/YdSX53m0d7EBnoQVNgB6gw1E
	gz5SZrpIAaFpl3gFQWQh5IInB3sc9qFaeWIKH0H7wGWe1AbbOhFZ8HGUAh6VIIeMdNYRgMXwp0i
	shZWte7wjHY6ZUoUo6lERiRKns+f2UCAHFsiQ
X-Gm-Gg: ASbGncsm8thKc1E+n7qeExM9AYugF19IPjmrWe2dJo0bR34ECywoyk/fkWpnzilJvQI
	chbDdfBPGhFNU3P+6dh4gJBQgIzgINJnBT4hZgjw6CXsDbm0IbFbEm4Z1ZrhezEdb5kxdjgY+u7
	BCBsDv3I8JA29WdNX2xhjwZT2Emg+VP8Tvb/3+Pm/+XovJD+2qFe3y8yICyycOUAeXEEtI8zYpy
	hA0ecNlwOtUoJEh0cS6E/eIXhiIFb+nvBu+35JJCPsPzlgqbzD2O1cG8EYhStCh3KDQ1w==
X-Google-Smtp-Source: AGHT+IGC19bW4v38+PO2gVkPsDtEK0yWRBwuT13Rke1+DT77djXAiUkFEP8MpbB58cLUyVaR7Q5ZJ5Lzpt33OfEac/Y=
X-Received: by 2002:a05:6402:348d:b0:625:39d0:32b6 with SMTP id
 4fb4d7f45d1cf-62539d03518mr1293120a12.4.1757164478240; Sat, 06 Sep 2025
 06:14:38 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?4LmE4LiV4Lij4Lin4Lix4LiV4LiN4LmMIOC4quC4uOC4p+C4tOC4ieC4seC4ouC4iuC4suC4jQ==?= <tirwatysuwichaychay@gmail.com>
Date: Sat, 6 Sep 2025 20:14:39 +0700
X-Gm-Features: Ac12FXx1EO0G2PXb_T-jln7RexkSA6Mp4kAl__S6_fS3ZAq-iiy6RTZ0U9ineWk
Message-ID: <CANMfZYB3t7nx51zTMaUbJpYK_i02RveZDfmL+EUz-nSJhQD_6A@mail.gmail.com>
Subject: =?UTF-8?B?4LiE4Li44LiT4LmA4LiU4Li34Lit4LiU4Lij4LmJ4Lit4LiZ4LmA4Lij4Liy4Lii4Li0?=
	=?UTF-8?B?4LiZ4LiU4Li14LiK4LmI4Lin4Lii4LiE4Li44LiT?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000899e3d063e21bc1b"

--000000000000899e3d063e21bc1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

4LiU4LmJ4Lin4Lii4Lit4Lix4LiV4Lij4Liy4LiU4Lit4LiB4LmA4Lia4Li14LmI4Lii4LiX4Li1
4LmI4LmB4LiV4LiB4LiV4LmI4Liy4LiHIOC5gOC4nuC4t+C5iOC4reC5g+C4q+C5ieC5gOC4guC5
ieC4suC4luC4tuC4h+C5geC4q+C4peC5iOC4h+C5gOC4h+C4tOC4meC4l+C4uOC4mQ0K4Lia4Lij
4Li04Lip4Lix4LiXIFRQTCBHcm91cCDguIjguLPguIHguLHguJQg4Liq4Li04LiZ4LmA4LiK4Li3
4LmI4Lit4LmA4Lie4Li34LmI4Lit4LiE4LiZ4LmE4LiX4LiiDQrguKrguLPguKvguKPguLHguJrg
uYDguIjguYnguLLguILguK3guIfguJjguLjguKPguIHguLTguIjguJfguLjguIHguYbguJvguKPg
uLDguYDguKDguJcg4LiX4Li14LmI4LiV4LmJ4Lit4LiH4LiB4Liy4Lij4LiX4Li44LiZ4Lir4Lih
4Li44LiZ4LmA4Lin4Li14Lii4LiZDQrguKfguIfguYDguIfguLTguJnguK3guJnguLjguKHguLHg
uJXguLTguKrguLnguIfguKrguLjguJQgNTAsMDAwLTEwLDAwMCwwMDAg4Lia4Liy4LiXDQrguYPg
uITguKPguYTguKHguYjguYDguIrguLfguYjguK0g4LmB4LiV4LmI4Liq4Li04LiZ4LmA4LiK4Li3
4LmI4Lit4LmA4Lij4Liy4LmE4LiU4LmJ4LiI4Lij4Li04LiHDQrinJTvuI/guIjguJTguYDguJvg
uYfguJnguKPguLnguJvguYHguJrguJrguJrguKPguLTguKnguLHguJcg4LmD4Lia4LiX4Liw4LmA
4Lia4Li14Lii4LiZ4Lie4Liy4LiT4Li04LiK4Lii4LmMIOC5g+C4muC4m+C4o+C4sOC4geC4reC4
muC4geC4suC4ow0K4pyU77iP4Lit4Lix4LiV4Lij4Liy4LiU4Lit4LiB4LmA4Lia4Li14LmJ4Lii
4LmA4Lij4Li04LmI4Lih4LiV4LmJ4LiZ4LiX4Li14LmIIDEgJQ0K4pyU77iP4Lil4LiU4LiV4LmJ
4LiZLeC4peC4lOC4lOC4reC4gQ0K4pyU77iP4LmE4Lih4LmI4LmA4LiK4LmH4LiE4LmA4LiE4Lij
4LiU4Li04LiVIOC4muC4ueC5guC4ow0K4pyU77iP4LmE4Lih4LmI4LiV4LmJ4Lit4LiH4Lih4Li1
4Lia4Li44LiE4LiE4Lil4LiE4LmJ4Liz4Lib4Lij4Liw4LiB4Lix4LiZDQrinJTvuI/guJzguYjg
uLLguJnguIHguLLguKPguK3guJnguLjguKHguLHguJXguLTguKPguLHguJrguYDguIfguLTguJng
uJfguLHguJnguJfguLUNCuKclO+4j+C5hOC4oeC5iOC4oeC4teC5guC4reC4meC4geC5iOC4reC4
mSDguYTguKHguYjguKHguLXguKHguLHguJTguIjguLMNCuC4leC4tOC4lOC4leC5iOC4rQ0K4LmA
4Lia4Lit4Lij4LmM4LmC4LiX4LijIDogMDk4ODgxMzA2MyAo4LiE4Li44LiT4Lia4Li1KQ0KTGlu
ZSBpZCA6IHRwbGdyb3VwMTk5OQ0K
--000000000000899e3d063e21bc1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+4LiU4LmJ4Lin4Lii4Lit4Lix4LiV4Lij4Liy4LiU4Lit4LiB4LmA4Lia
4Li14LmI4Lii4LiX4Li14LmI4LmB4LiV4LiB4LiV4LmI4Liy4LiHIOC5gOC4nuC4t+C5iOC4reC5
g+C4q+C5ieC5gOC4guC5ieC4suC4luC4tuC4h+C5geC4q+C4peC5iOC4h+C5gOC4h+C4tOC4meC4
l+C4uOC4mTxicj7guJrguKPguLTguKnguLHguJcgVFBMIEdyb3VwIOC4iOC4s+C4geC4seC4lCDg
uKrguLTguJnguYDguIrguLfguYjguK3guYDguJ7guLfguYjguK3guITguJnguYTguJfguKI8YnI+
4Liq4Liz4Lir4Lij4Lix4Lia4LmA4LiI4LmJ4Liy4LiC4Lit4LiH4LiY4Li44Lij4LiB4Li04LiI
4LiX4Li44LiB4LmG4Lib4Lij4Liw4LmA4Lig4LiXIOC4l+C4teC5iOC4leC5ieC4reC4h+C4geC4
suC4o+C4l+C4uOC4meC4q+C4oeC4uOC4meC5gOC4p+C4teC4ouC4mTxicj7guKfguIfguYDguIfg
uLTguJnguK3guJnguLjguKHguLHguJXguLTguKrguLnguIfguKrguLjguJQgNTAsMDAwLTEwLDAw
MCwwMDAg4Lia4Liy4LiXPGJyPuC5g+C4hOC4o+C5hOC4oeC5iOC5gOC4iuC4t+C5iOC4rSDguYHg
uJXguYjguKrguLTguJnguYDguIrguLfguYjguK3guYDguKPguLLguYTguJTguYnguIjguKPguLTg
uIc8YnI+4pyU77iP4LiI4LiU4LmA4Lib4LmH4LiZ4Lij4Li54Lib4LmB4Lia4Lia4Lia4Lij4Li0
4Lip4Lix4LiXIOC5g+C4muC4l+C4sOC5gOC4muC4teC4ouC4meC4nuC4suC4k+C4tOC4iuC4ouC5
jCDguYPguJrguJvguKPguLDguIHguK3guJrguIHguLLguKM8YnI+4pyU77iP4Lit4Lix4LiV4Lij
4Liy4LiU4Lit4LiB4LmA4Lia4Li14LmJ4Lii4LmA4Lij4Li04LmI4Lih4LiV4LmJ4LiZ4LiX4Li1
4LmIIDEgJTxicj7inJTvuI/guKXguJTguJXguYnguJkt4Lil4LiU4LiU4Lit4LiBPGJyPuKclO+4
j+C5hOC4oeC5iOC5gOC4iuC5h+C4hOC5gOC4hOC4o+C4lOC4tOC4lSDguJrguLnguYLguKM8YnI+
4pyU77iP4LmE4Lih4LmI4LiV4LmJ4Lit4LiH4Lih4Li14Lia4Li44LiE4LiE4Lil4LiE4LmJ4Liz
4Lib4Lij4Liw4LiB4Lix4LiZPGJyPuKclO+4j+C4nOC5iOC4suC4meC4geC4suC4o+C4reC4meC4
uOC4oeC4seC4leC4tOC4o+C4seC4muC5gOC4h+C4tOC4meC4l+C4seC4meC4l+C4tTxicj7inJTv
uI/guYTguKHguYjguKHguLXguYLguK3guJnguIHguYjguK3guJkg4LmE4Lih4LmI4Lih4Li14Lih
4Lix4LiU4LiI4LizPGJyPuC4leC4tOC4lOC4leC5iOC4rTxicj7guYDguJrguK3guKPguYzguYLg
uJfguKMgOiAwOTg4ODEzMDYzICjguITguLjguJPguJrguLUpPGJyPkxpbmUgaWQgOiB0cGxncm91
cDE5OTk8L2Rpdj4NCg==
--000000000000899e3d063e21bc1b--
