Return-Path: <SRS0=js67=XS=gmail.com=natheewongwiriyapiboon@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637C7C3ABA5
	for <linux-firmware@archiver.kernel.org>; Fri,  2 May 2025 04:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13FB3C4CEE9; Fri,  2 May 2025 04:21:58 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25D57C4CEE4
	for <linux-firmware@kernel.org>; Fri,  2 May 2025 04:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25D57C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-703cd93820fso13684807b3.2
        for <linux-firmware@kernel.org>; Thu, 01 May 2025 21:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746159715; x=1746764515; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p71rgK+VReAce04736ztdRO4PiMJnkkHOtKSDFW9hBE=;
        b=loXMG+yvKFx1ygpEeOYGqg/VvrzU94uaPCqFfOCtWRal7geFau3hFMM2g96UFVAlmk
         c/5+3BCiGnUB9qacSYx4J65x2CKPZUUnzpw1ZE2Cl11RL7ToquFibRKALWZFOdj4oEmc
         JBFSSIhxIy/I7qjR8JXd+pNHDyu4/v5TgyOxuokrTej65L8pfGPoSB7BhIM+k31Ny6k/
         xy9+yHxKkA13Euy3BB1PzxvRBFO2CEOJc+lLoJ5sxY9NKzzoUoqBcbszx46MogI/703H
         GrdJR7ktiv9wOXmjnL99kZKtdsIgusvAkc5aXObAUT+Fd8nhiyZZmUy04T6tMlwRuyPX
         Gb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746159715; x=1746764515;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p71rgK+VReAce04736ztdRO4PiMJnkkHOtKSDFW9hBE=;
        b=ivwm95LLGOLx2TUQI12/NkYkL/SEEduQroR0c3SeSiXaIv/PfpdbI5wtt8qaHbKpDQ
         MB/O8by6O+zLhcr6OqAbYqYhUtfIQ1ZPMwp96Hzpxo1vQ79brKhpwh5XgHInLa1DHYWN
         VmGGeWJePpvj8KfHAFk5XkXm4Le3LF+iblV1XfOAQCNAo3PFCx91lzidG3h8Qc/lduJQ
         1NiePY2G02f4k3Fb8nFHEfXIxVProMFBxnhFvvJn5RYWZTVz0njVBkAm11uK6ztQ4560
         zRwAyp5jQ3DpthyRVkU7IquvrJ2/mT1AnigM6gr+qBZxxNL4lDzafGpu3Y/0N2BSbEyx
         d/KQ==
X-Gm-Message-State: AOJu0YxpvzybdXTBwVx+AJOBwCGfd5Wgxia1QZzedEJgih0c+peyCnqz
	th6N6kIJENwyzYY1Lymrj2mswQQlRxmarZgs5VL1qlNWeBXqHMfrj7swiCsZr7rhEZYl5trxDrk
	ykXQMdxKrZME7cwNDnxRG+D6ItskGAHuH
X-Gm-Gg: ASbGncvC+uwNR3k+ppMqeSF7TPNrxcTSrdGkv/kpNqJ3pFLfJDpCgiwQH/CgHddOJtT
	b3NeimgC5p68RJp/unNE6F3PWJWacCay+lXbMg+YwI/uNTiuRumKqJtjZb3lS7HR+96HE0vm2Yh
	F8H60LN6HCA8pXVbCIuIVpA4jVxj8Dg2mrxsJUT4ysotAv0gCNlGbQc3f8cyM=
X-Google-Smtp-Source: AGHT+IG9r9xTpL7dzb9en36kZJZNyx+VP3nRiEY3qWjCrXky6gj1VECCdjPoqmBM6ZvepzSYPQdj+HAWvAGaAwFAT4I=
X-Received: by 2002:a05:690c:368d:b0:708:a265:c8f7 with SMTP id
 00721157ae682-708ced44025mr22037537b3.9.1746159715721; Thu, 01 May 2025
 21:21:55 -0700 (PDT)
MIME-Version: 1.0
From: Nathee Wongwiriyapiboon <natheewongwiriyapiboon@gmail.com>
Date: Fri, 2 May 2025 11:21:44 +0700
X-Gm-Features: ATxdqUEwv0OSl2OwST28uVCrBKBhXmhkkCfV4hSvoW9A5LrOItHqH8ODhk4_Des
Message-ID: <CAA=ZcGzhz95PVyLgSYMQ9BvjQ9kxW=6U_P69UuDd10ybxuGD8Q@mail.gmail.com>
Subject: =?UTF-8?B?4LmA4Lij4Li14Lii4LiZ4LiX4LmI4Liy4LiZ4LmA4LiI4LmJ4Liy4LiC4Lit4LiH4LiY?=
	=?UTF-8?B?4Li44Lij4LiB4Li04LiI4LmB4Lil4Liw4LmA4LiI4LmJ4Liy4LiC4Lit4LiH4Lic4Li54LmJ4Lib4Lij?=
	=?UTF-8?B?4Liw4LiB4Lit4Lia4LiB4Liy4Lij?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="00000000000093a72b06341f7d2e"

--00000000000093a72b06341f7d2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

4LmA4Lij4Li14Lii4LiZ4LiX4LmI4Liy4LiZ4LmA4LiI4LmJ4Liy4LiC4Lit4LiH4LiY4Li44Lij
4LiB4Li04LiI4LmB4Lil4Liw4LmA4LiI4LmJ4Liy4LiC4Lit4LiH4Lic4Li54LmJ4Lib4Lij4Liw
4LiB4Lit4Lia4LiB4Liy4LijDQrguJrguKPguLTguKnguLHguJcgTSZRIENyZWRpdCBHcm91cCDg
uIjguLPguIHguLHguJQNCiDguILguK3guKrguIfguKfguJnguKrguLTguJfguJjguLTguYwg4LmD
4Lir4LmJ4Lia4Lij4Li04LiB4Liy4Lij4Liq4Li04LiZ4LmA4LiK4Li34LmI4LitICLguKrguLPg
uKvguKPguLHguJrguJzguLnguYnguJvguKPguLDguIHguK3guJrguIHguLLguKMNCuC4l+C4teC5
iOC4iOC4lOC4l+C4sOC5gOC4muC4teC4ouC4meC4geC4suC4o+C4hOC5ieC4si/guJ7guLLguJPg
uLTguIrguKLguYwg4Lir4LiI4LiBLiDguJrguKPguLTguKnguLHguJcg4LmC4Lij4LiH4LiH4Liy
4LiZ4LivIFNNRXMg4LmA4LiX4LmI4Liy4LiZ4Lix4LmJ4LiZDQog4LiV4LmJ4Lit4LiH4LiB4Liy
4Lij4LiC4Liy4Lii4LiB4Li04LiI4LiB4Liy4LijIOC5gOC4nuC4tOC5iOC4oeC4nuC4peC4seC4
h+C4geC4suC4o+C4nOC4peC4tOC4leC5geC4peC4sOC4quC4leC5iuC4reC4geC4quC4tOC4meC4
hOC5ieC4siDguK/guKXguK8g4LmD4Lir4LmJ4LiY4Li44Lij4LiB4Li04LiI4LiE4Li44LiT4LiB
4LmJ4Liy4Lin4LiV4LmI4Lit4LmE4LibDQrguYTguKHguYjguKHguLXguKrguLDguJTguLjguJQg
4LiV4LmJ4Lit4LiH4LiB4Liy4Lij4LmD4LiK4LmJ4LmA4LiH4Li04LiZ4LiJ4Li44LiB4LmA4LiJ
4Li04LiZIOC4quC4tOC4meC5gOC4iuC4t+C5iOC4reC4guC4reC4h+C5gOC4o+C4suC5gOC4m+C5
h+C4meC4o+C4sOC4muC4miBPRA0KIOC4p+C4h+C5gOC4h+C4tOC4meC4quC4ueC4h+C4quC4uOC4
lCA1IOC4peC5ieC4suC4meC4muC4suC4lw0KIOC4lOC4reC4geC5gOC4muC4teC5ieC4ouC4leC5
iOC4s+C4quC4uOC4lCAwLjUgJQ0KIOC4peC4lOC4leC5ieC4mSDguKXguJTguJTguK3guIENCiDg
uYTguKHguYjguYDguIrguYfguITguYDguITguKPguJTguLTguJUg4Lia4Li54LmC4LijDQog4LmE
4Lih4LmI4LiV4LmJ4Lit4LiH4Lih4Li14Lia4Li44LiE4LiE4Lil4LiE4LmJ4Liz4Lib4Lij4Liw
4LiB4Lix4LiZDQog4Lic4LmI4Liy4LiZ4LiB4Liy4Lij4Lit4LiZ4Li44Lih4Lix4LiV4Li04Lij
4Lix4Lia4LmA4LiH4Li04LiZ4LiX4Lix4LiZ4LiX4Li1DQog4LmE4Lih4LmI4Lih4Li14LmC4Lit
4LiZ4LiB4LmI4Lit4LiZIOC5hOC4oeC5iOC4oeC4teC4oeC4seC4lOC4iOC4sw0K4LiV4Li04LiU
4LiV4LmI4LitIOC5gOC4muC4reC4o+C5jOC5guC4l+C4oyAwOTUtMTk4MTg5NyAo4LiE4Li44LiT
4LiX4LmK4Lit4LibKQ0K
--00000000000093a72b06341f7d2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+4LmA4Lij4Li14Lii4LiZ4LiX4LmI4Liy4LiZ4LmA4LiI4LmJ4Liy4LiC
4Lit4LiH4LiY4Li44Lij4LiB4Li04LiI4LmB4Lil4Liw4LmA4LiI4LmJ4Liy4LiC4Lit4LiH4Lic
4Li54LmJ4Lib4Lij4Liw4LiB4Lit4Lia4LiB4Liy4LijPGJyPuC4muC4o+C4tOC4qeC4seC4lyBN
JmFtcDtRIENyZWRpdCBHcm91cCDguIjguLPguIHguLHguJQ8YnI+wqDguILguK3guKrguIfguKfg
uJnguKrguLTguJfguJjguLTguYwg4LmD4Lir4LmJ4Lia4Lij4Li04LiB4Liy4Lij4Liq4Li04LiZ
4LmA4LiK4Li34LmI4LitICZxdW90O+C4quC4s+C4q+C4o+C4seC4muC4nOC4ueC5ieC4m+C4o+C4
sOC4geC4reC4muC4geC4suC4oyDguJfguLXguYjguIjguJTguJfguLDguYDguJrguLXguKLguJng
uIHguLLguKPguITguYnguLIv4Lie4Liy4LiT4Li04LiK4Lii4LmMIOC4q+C4iOC4gS4g4Lia4Lij
4Li04Lip4Lix4LiXIOC5guC4o+C4h+C4h+C4suC4meC4ryBTTUVzIOC5gOC4l+C5iOC4suC4meC4
seC5ieC4mSA8YnI+wqDguJXguYnguK3guIfguIHguLLguKPguILguLLguKLguIHguLTguIjguIHg
uLLguKMg4LmA4Lie4Li04LmI4Lih4Lie4Lil4Lix4LiH4LiB4Liy4Lij4Lic4Lil4Li04LiV4LmB
4Lil4Liw4Liq4LiV4LmK4Lit4LiB4Liq4Li04LiZ4LiE4LmJ4LiyIOC4r+C4peC4ryDguYPguKvg
uYnguJjguLjguKPguIHguLTguIjguITguLjguJPguIHguYnguLLguKfguJXguYjguK3guYTguJsg
4LmE4Lih4LmI4Lih4Li14Liq4Liw4LiU4Li44LiUIOC4leC5ieC4reC4h+C4geC4suC4o+C5g+C4
iuC5ieC5gOC4h+C4tOC4meC4ieC4uOC4geC5gOC4ieC4tOC4mSDguKrguLTguJnguYDguIrguLfg
uYjguK3guILguK3guIfguYDguKPguLLguYDguJvguYfguJnguKPguLDguJrguJogT0Q8YnI+wqDg
uKfguIfguYDguIfguLTguJnguKrguLnguIfguKrguLjguJQgNSDguKXguYnguLLguJnguJrguLLg
uJc8YnI+wqDguJTguK3guIHguYDguJrguLXguYnguKLguJXguYjguLPguKrguLjguJQgMC41ICU8
YnI+wqDguKXguJTguJXguYnguJkg4Lil4LiU4LiU4Lit4LiBPGJyPsKg4LmE4Lih4LmI4LmA4LiK
4LmH4LiE4LmA4LiE4Lij4LiU4Li04LiVIOC4muC4ueC5guC4ozxicj7CoOC5hOC4oeC5iOC4leC5
ieC4reC4h+C4oeC4teC4muC4uOC4hOC4hOC4peC4hOC5ieC4s+C4m+C4o+C4sOC4geC4seC4mTxi
cj7CoOC4nOC5iOC4suC4meC4geC4suC4o+C4reC4meC4uOC4oeC4seC4leC4tOC4o+C4seC4muC5
gOC4h+C4tOC4meC4l+C4seC4meC4l+C4tTxicj7CoOC5hOC4oeC5iOC4oeC4teC5guC4reC4meC4
geC5iOC4reC4mSDguYTguKHguYjguKHguLXguKHguLHguJTguIjguLM8YnI+4LiV4Li04LiU4LiV
4LmI4LitIOC5gOC4muC4reC4o+C5jOC5guC4l+C4oyAwOTUtMTk4MTg5NyAo4LiE4Li44LiT4LiX
4LmK4Lit4LibKTxicj48YnI+PGJyPjwvZGl2Pg0K
--00000000000093a72b06341f7d2e--
