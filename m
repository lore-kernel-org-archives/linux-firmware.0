Return-Path: <SRS0=Mijy=3P=gmail.com=tirwatysuwichaychay@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1BFCA1002
	for <linux-firmware@archiver.kernel.org>; Thu,  4 Sep 2025 11:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3767C4CEF1; Thu,  4 Sep 2025 11:54:18 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BA45C4CEF0
	for <linux-firmware@kernel.org>; Thu,  4 Sep 2025 11:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BA45C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61cd6089262so1491189a12.3
        for <linux-firmware@kernel.org>; Thu, 04 Sep 2025 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756986855; x=1757591655; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x3i5apRAHGW5sUcIg2Zm4IJDfCvc2vr5BfsjHF6M5Mk=;
        b=jVvgdflZ7YftULzp4nux+a/IJbyTtE3/OipB1BM9u3ENEuzaJlVJAbaa7DvXVMJdg/
         4nm0v4pgOlTphUdsQ7kS0aAFFBXgoud1g6ErB01ie+d8zalRL23jTGq5RJ+TQjl1rP+s
         8rIvhqCdLkEU3vRLJnwUQjIhvjf478+IceHGKoWb9pvjpceOhFXB8CmxRVx9rnJndZ3G
         af8f6oUajxfsZ8vtiXc7WwuOfvgJjoNPuAhktVGfYNXkAX664LM2wtk7mu55+ED3pCz3
         t5K0pMXzj1YydZJ7viiWcpmNiqht5alFskyVNwAppHoDxq/O213pbDRm1Wjx2qBJHkOw
         GijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986855; x=1757591655;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3i5apRAHGW5sUcIg2Zm4IJDfCvc2vr5BfsjHF6M5Mk=;
        b=Uf2aCrF3486OKPaoG/1gm1IPQ6wFKC149iekU9nt/47uK1563zYm9O8ZFfUs6kMtfy
         xt+QAGn2n1+u1qh0VndeExybH2Ktr1KPeTB1aCwVdLuHY4hl25VuSGEGJiXKkSflcGiM
         ucOT9KlClthdP9W7mZm4AXUHcC80rq5IQtcfHWXm868wAT9N3k7+ZdJQMQXlDUgv265R
         SioLrxaGnVM9dSZz30FfC1iKz9nS/In2sYxJu0H+G9Nf0cnDANOHKBnzZGhBf5px4/DK
         vs4lJzlzwXSG9YeQ5tbI3HOW1RcrFGe4MbX8ONsoaZ8nZHbEVnEAgxnGU/w4HDRaBtWK
         fRvA==
X-Gm-Message-State: AOJu0Yz0szoqQgsrpti4gcYXnQoBri8Ur7ciItTsJ5e45BIpO/WTPjzk
	GV/kPzwS2tyQZUpXtu79eUj7CrEje6ZVaUypV+ejQAf0tfwEfwS9ItAo4qEX3ZIUlCJqWELwTde
	Aw6z3lBzuODtJy+wDalrvW/W1ZCzzM9s151vE
X-Gm-Gg: ASbGncujZHQd1VnuZlUOdANjLdDcbfeLaFJwuIvWL+XVg1ZOds9gL+6jQ7tjEiXXRko
	qutWe9uoXZfpzkT8Bdn9Icy8E6epRA1DKhqF6GIPCEr2yYkEwKk5+SrEhdNLaFqT6sMVyy3ivaa
	QdX/KqClOYz2ahKXBzs0nuFbaoONjTBEUrajJsxlVkFkwUsY3BjvZtIg+UoEK+lDkLdfy7yrvBQ
	yFl3uUlwFt2BQnQw9N4GsSSpHm8F2n5iFzgyGt2OqEBAQlLkH66JfIFyM/imLvVk0Lsjuy1EA==
X-Google-Smtp-Source: AGHT+IGoXvvPIo3/QLhEtQE8lcVMvc/vxNOX8uLWAGWc8Y4lTsu323gixfVFjSPWb/7Iux8ybwVjaoq/VV+swBFYpf8=
X-Received: by 2002:a05:6402:3506:b0:61c:5272:a739 with SMTP id
 4fb4d7f45d1cf-61d2686997dmr16852647a12.2.1756986854716; Thu, 04 Sep 2025
 04:54:14 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?4LmE4LiV4Lij4Lin4Lix4LiV4LiN4LmMIOC4quC4uOC4p+C4tOC4ieC4seC4ouC4iuC4suC4jQ==?= <tirwatysuwichaychay@gmail.com>
Date: Thu, 4 Sep 2025 18:54:14 +0700
X-Gm-Features: Ac12FXxGaQU492Q_KMRTVFrleo14bAkhmt-kdJqfqVfGVUgSjQXwafZmvztoX78
Message-ID: <CANMfZYBF_igYigv3WUB37H7GWaNnzSenBF1rD+88rpsugiUOeQ@mail.gmail.com>
Subject: =?UTF-8?B?4LiE4Li44LiT4LmA4LiU4Li34Lit4LiU4Lij4LmJ4Lit4LiZ4LmA4Lij4Liy4Lii4Li0?=
	=?UTF-8?B?4LiZ4LiU4Li14LiK4LmI4Lin4Lii4LiE4Li44LiT?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="00000000000059b855063df86192"

--00000000000059b855063df86192
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
--00000000000059b855063df86192
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
--00000000000059b855063df86192--
